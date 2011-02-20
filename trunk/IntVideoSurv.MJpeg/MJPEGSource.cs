// Camara Vision
//
// Copyright ?Andrew Kirillov, 2005-2006
// andrew.kirillov@gmail.com
//

namespace mjpeg
{
	using System;
	using System.Drawing;
	using System.IO;
	using System.Text;
	using System.Threading;
	using System.Net;
	using videosource;
    using IntVideoSurv.Entity;

	/// <summary>
	/// MJPEGSource - MJPEG stream support
	/// </summary>
	public class MJPEGSource : IVideoSource
	{
		private string	source;
		private string	login = null;
		private string	password = null;
		private object	userData = null;
		private int		framesReceived;
		private int		bytesReceived;
		private bool	useSeparateConnectionGroup = true;

        #region new var
        public IntPtr Handle { get; set; }
        public bool IsDetect { get; set; }
        public ushort Port { get; set; }
        public bool IsNeedInit { get; set; }
        public int ChannelNo { get; set; }
        public int RetrunUserId { get; set; }
        public string OutputPath { get; set; }
        public string FileExtName { get; set; }
        public int CameraId { get; set; }
        #endregion

		private const int	bufSize = 512 * 1024;	// buffer size
		private const int	readSize = 1024;		// portion size to read

		private Thread	thread = null;
		private ManualResetEvent stopEvent = null;
		private ManualResetEvent reloadEvent = null;

		// new frame event
		public event CameraEventHandler NewFrame;

		// SeparateConnectioGroup property
		// indicates to open WebRequest in separate connection group
		public bool	SeparateConnectionGroup
		{
			get { return useSeparateConnectionGroup; }
			set { useSeparateConnectionGroup = value; }
		}
		// VideoSource property
		public string VideoSource
		{
			get { return source; }
			set
			{
				source = value;
				// signal to reload
				if (thread != null)
					reloadEvent.Set();
			}
		}
		// Login property
		public string Login
		{
			get { return login; }
			set { login = value; }
		}
		// Password property
		public string Password
		{
			get { return password; }
			set { password = value; }
		}
		// FramesReceived property
		public int FramesReceived
		{
			get
			{
				int frames = framesReceived;
				framesReceived = 0;
				return frames;
			}
		}
		// BytesReceived property
		public int BytesReceived
		{
			get
			{
				int bytes = bytesReceived;
				bytesReceived = 0;
				return bytes;
			}
		}
		// UserData property
		public object UserData
		{
			get { return userData; }
			set { userData = value; }
		}
		// Get state of the video source thread
		public bool Running
		{
			get
			{
				if (thread != null)
				{
					if (thread.Join(0) == false)
						return true;

					// the thread is not running, so free resources
					Free();
				}
				return false;
			}
		}
        private DeviceInfo _deviceInfo = null;
        private CameraInfo _cameraInfo = null;
        public void Init(ref DeviceInfo deviceInfo)
        {
            deviceInfo.DeviceRunningStatus = true;
            _deviceInfo = deviceInfo;
        }
         public int GetJpegImage(ref byte[] imageBuf)
         {
             throw new Exception("not implement");

         }

         public bool RecordVideo()
         {
             return true;
         }
         public bool StopVideo()
         {
             return true;
         }

		// Constructor
		public MJPEGSource()
		{
		}

		// Start work
        public void Start(ref CameraInfo cameraInfo)
        {
            _cameraInfo = cameraInfo;
			if (thread == null)
			{
				framesReceived = 0;
				bytesReceived = 0;

				// create events
				stopEvent	= new ManualResetEvent(false);
				reloadEvent	= new ManualResetEvent(false);
				
				// create and start new thread
				thread = new Thread(new ThreadStart(WorkerThread));
				thread.Name = source;
				thread.Start();
			}
		}
        public void Close()
        {

        }

		// Signal thread to stop work
		public void SignalToStop()
		{
			// stop thread
			if (thread != null)
			{
				// signal to stop
				stopEvent.Set();
			}
		}

		// Wait for thread stop
		public void WaitForStop()
		{
			if (thread != null)
			{
				// wait for thread stop
				thread.Join();

				Free();
			}
		}

		// Abort thread
		public void Stop()
		{
			if (this.Running)
			{
				thread.Abort();
				WaitForStop();
			}
		}

		// Free resources
		private void Free()
		{
			thread = null;

			// release events
			stopEvent.Close();
			stopEvent = null;
			reloadEvent.Close();
			reloadEvent = null;
		}

		// Thread entry point
		public void WorkerThread()
		{
			byte[]	buffer = new byte[bufSize];	// buffer to read stream
            
			while (true)
			{
				// reset reload event
				reloadEvent.Reset();

				HttpWebRequest	req = null;
				WebResponse		resp = null;
				Stream			stream = null;
				byte[]			delimiter = null;
				byte[]			delimiter2 = null;
				byte[]			boundary = null;
				int				boundaryLen, delimiterLen = 0, delimiter2Len = 0;
				int				read, todo = 0, total = 0, pos = 0, align = 1;
				int				start = 0, stop = 0;

				// align
				//  1 = searching for image start
				//  2 = searching for image end
				try
				{
					// create request
					req = (HttpWebRequest) WebRequest.Create(_deviceInfo.source);
					// set login and password
                    if ((_deviceInfo.login != null) && (_deviceInfo.pwd != null) && (_deviceInfo.login != ""))
                        req.Credentials = new NetworkCredential(_deviceInfo.login, _deviceInfo.pwd);
					// set connection group name
					if (useSeparateConnectionGroup)
						req.ConnectionGroupName = GetHashCode().ToString();
					// get response
					resp = req.GetResponse();

					// check content type
					string ct = resp.ContentType;
					 if (ct.IndexOf("multipart/x-mixed-replace") == -1)
						throw new ApplicationException("Invalid URL");

					// get boundary
					ASCIIEncoding encoding = new ASCIIEncoding();
					boundary = encoding.GetBytes(ct.Substring(ct.IndexOf("boundary=", 0) + 9));
					boundaryLen = boundary.Length;

					// get response stream
					stream = resp.GetResponseStream();

					// loop
					while ((!stopEvent.WaitOne(0, true)) && (!reloadEvent.WaitOne(0, true)))
					{
						// check total read
						if (total > bufSize - readSize)
						{
							total = pos = todo = 0;
						}

						// read next portion from stream
						if ((read = stream.Read(buffer, total, readSize)) == 0)
							throw new ApplicationException();

						total += read;
						todo += read;

						// increment received bytes counter
						bytesReceived += read;
				
						// does we know the delimiter ?
						if (delimiter == null)
						{
							// find boundary
							pos = ByteArrayUtils.Find(buffer, boundary, pos, todo);

							if (pos == -1)
							{
								// was not found
								todo = boundaryLen - 1;
								pos = total - todo;
								continue;
							}

							todo = total - pos;

							if (todo < 2)
								continue;

							// check new line delimiter type
							if (buffer[pos + boundaryLen] == 10)
							{
								delimiterLen = 2;
								delimiter = new byte[2] {10, 10};
								delimiter2Len = 1;
								delimiter2 = new byte[1] {10};
							}
							else
							{
								delimiterLen = 4;
								delimiter = new byte[4] {13, 10, 13, 10};
								delimiter2Len = 2;
								delimiter2 = new byte[2] {13, 10};
							}

							pos += boundaryLen + delimiter2Len;
							todo = total - pos;
						}

						// search for image
						if (align == 1)
						{
							start = ByteArrayUtils.Find(buffer, delimiter, pos, todo);
							if (start != -1)
							{
								// found delimiter
								start	+= delimiterLen;
								pos		= start;
								todo	= total - pos;
								align	= 2;
							}
							else
							{
								// delimiter not found
								todo	= delimiterLen - 1;
								pos		= total - todo;
							}
						}

						// search for image end
						while ((align == 2) && (todo >= boundaryLen))
						{
							stop = ByteArrayUtils.Find(buffer, boundary, pos, todo);
							if (stop != -1)
							{
								pos		= stop;
								todo	= total - pos;

								// increment frames counter
								framesReceived ++;

								// image at stop
								if (NewFrame != null)
								{
									Bitmap	bmp = (Bitmap) Bitmap.FromStream(new MemoryStream(buffer, start, stop - start));
									// notify client
									NewFrame(this, new CameraEventArgs(bmp));
									// release the image
									bmp.Dispose();
									bmp = null;
								}

								// shift array
								pos		= stop + boundaryLen;
								todo	= total - pos;
								Array.Copy(buffer, pos, buffer, 0, todo);

								total	= todo;
								pos		= 0;
								align	= 1;
							}
							else
							{
								// delimiter not found
								todo	= boundaryLen - 1;
								pos		= total - todo;
							}
						}
					}
				}
				catch (WebException ex)
				{
					System.Diagnostics.Debug.WriteLine("=============: " + ex.Message);
					// wait for a while before the next try
					Thread.Sleep(250);
				}
				catch (ApplicationException ex)
				{
					System.Diagnostics.Debug.WriteLine("=============: " + ex.Message);
					// wait for a while before the next try
					Thread.Sleep(250);
				}
				catch (Exception ex)
				{
					System.Diagnostics.Debug.WriteLine("=============: " + ex.Message);
				}
				finally
				{
					// abort request
					if (req != null)
					{
						req.Abort();
						req = null;
					}
					// close response stream
					if (stream != null)
					{
						stream.Close();
						stream = null;
					}
					// close response
					if (resp != null)
					{
						resp.Close();
						resp = null;
					}
				}

				// need to stop ?
				if (stopEvent.WaitOne(0, true))
					break;
			}
		}
	}
}
