using System;
using System.Collections;
using System.Collections.Generic;
using System.Drawing;
using System.Globalization;
using System.Net;
using System.Net.Sockets;
using System.Runtime.Remoting;
using System.Runtime.Remoting.Channels;
using System.Runtime.Remoting.Channels.Tcp;
using System.Windows.Forms;
using CameraViewer.NetWorking;
using CameraViewer.Remoting;
using DevExpress.XtraEditors;
using IntVideoSurv.Business;
using IntVideoSurv.Entity;
using CameraViewer.Forms;
using System.IO;
using IntVideoSurv.Business.HiK;
using System.Threading;

namespace CameraViewer
{
    public partial class MainForm : XtraForm
    {
        public delegate void ImageDataChangeHandle(object sender, DataChangeEventArgs e);

        Dictionary<int, HikVideoServerDeviceDriver> _runningDeviceList;
        Dictionary<int, HikVideoServerCameraDriver> _runningCameraList;
        Dictionary<int, GroupInfo> _listGroup;
        string _errMessage = "";
        Dictionary<int, DeviceInfo> _listDevice;
        Dictionary<int, CameraInfo> _listCam;
        Dictionary<int, CameraInfo> _listAllCam;
        Dictionary<int, SynGroup> _listSynGroup;
        Dictionary<int, DecoderInfo> _listDecoder;
        Dictionary<int, GroupSwitchGroup> _listGroupSwitchGroup;
        Dictionary<int, ProgSwitchInfo> _listProgSwitch;
        Dictionary<int, DisplayChannelInfo> _listDisplayChannelInfo;
        Dictionary<int, DefaultCardOut> _listDefaultCardOut;
        Dictionary<int, AlarmIconInfo> _listCurrentAlarmIcon;
        Dictionary<int, CameraIconInfo> _listCurrentCameraIcon;
        Dictionary<int, AlarmIconInfo> _listAllAlarmIcon;
        Dictionary<int, CameraIconInfo> _listAllCameraIcon;
        Dictionary<int, AlarmInfo> _listAlarm;
        Dictionary<int, MapInfo> _listMap;
        OutputTVDeviceDriver _outputTv;
        TcpChannel chan1;


        private GetTransPacket _getTransPacket;

        public MainForm()
        {
            #if !DEBUG
            while (Login(_inputUsername, _inputPassword, PromoteInfo) != true)
            {
                PromoteInfo = "��������ȷ���û���������!";
            }
            #else
            CurrentUser = new UserInfo { UserId = 1, UserName = "admin", UserTypeId = 1, UserTypeName = "����Ա" };
            #endif
            Splash.Splash.Show();
            this.Visible = false;
            Splash.Splash.Status = "����.Net Remoting...";
            BeginRemotingService();
            Splash.Splash.Status = "������ý�����...";
            BeginStreamMediaService();

            InitializeComponent();


            _getTransPacket = new GetTransPacket();
            _getTransPacket.LivePacketHandle.DataChange += LivePacketHandleDataChange;

            //start tcp server
            //var thread = new Thread(StartServer) { IsBackground = true };
            //thread.Start();

            
        }
        private void BeginRemotingService()
        {
            chan1 = new TcpChannel(8085);
            ChannelServices.RegisterChannel(chan1,false);
            RemotingConfiguration.RegisterWellKnownServiceType
                (
                typeof(SMUserService),
                "SMUserService",
                WellKnownObjectMode.Singleton
                );
        }
        private void BeginStreamMediaService()
        {
            int iret = HikStreamMediaServerSDK.InitStreamServerLib();
            if (Directory.Exists(AppSettings.Default.StreamMediaServicePath))
            {
                Directory.CreateDirectory(AppSettings.Default.StreamMediaServicePath);
            }
            iret = HikStreamMediaServerSDK.StartServer(AppSettings.Default.StreamMediaServicePath, 554);
            iret = HikStreamMediaServerSDK.RunServer();//δʹ��
        }
        void CameraView1DoubleDecoderCam(string tag)
        {
            //splitContainerControl1.SplitterPosition = splitContainerControl1.Height - tlpBottom.Height;
            //XtraMessageBox.Show(tag);
            string[] strs = tag.Split(';');
            if (strs.Length == 2)
            {
                DispalySynCamera(int.Parse(strs[0]));
            }
        }
        void CameraView1DoubleDevCam(string tag)
        {
            //splitContainerControl1.SplitterPosition = splitContainerControl1.Height - tlpBottom.Height;
            string[] strs = tag.Split(';');
            if (strs[1] == "D")
            {
                //ViewCameraByDeviceId(int.Parse(strs[0]));
            }
            else if (strs[1] == "C")
            {
                //ViewCameraByCameraId(int.Parse(strs[0]));

                if (mainMultiplexer.GetCurrentCameraWindow()==null)
                {
                    return;
                }
                string errMsg = "";
                int row = 0, col = 0;
                mainMultiplexer.GetCurrentCameraWindowPosition(ref row, ref col);
                WindowCameraBusiness.Instance.Insert(ref errMsg,new WindowCameraInfo{CameraId = int.Parse(strs[0]),Row =row, Col = col});
            }
        }

        void DispalySynCamera(int synGroupId)
        {
            try
            {

                List<SynCameraInfo> listSynCamera = SynGroupBusiness.Instance.GetAllCameraBySynGroupId(ref _errMessage, synGroupId);


                int iRow = 1;
                int iCol = 1;
                int iCount = 1;
                mainMultiplexer.CloseAll();
                mainMultiplexer.CamerasVisible = true;
                mainMultiplexer.CellWidth = 320;
                mainMultiplexer.CellHeight = 240;
                mainMultiplexer.FitToWindow = true;
                CloseAll();

                HikVideoServerDeviceDriver deviceDriver = null;
                HikVideoServerCameraDriver cameraDriver = null;
                HikVideoServerCameraDriver cameraDriver1 = null;
                DeviceInfo oDevice;
                int OutputPort = 0;
                int i = 0;
                int j = 0;
                iCount = listSynCamera.Count;
                Util.GetRowCol(iCount, ref iRow, ref iCol);

                int cameraId1 = 0;
                int cameraId2 = 0;
                CameraInfo camera = null;
                foreach (SynCameraInfo item in listSynCamera)
                {

                    camera = _listAllCam[item.CameraId];
                    oDevice = _listDevice[camera.DeviceId];
                    if (!_runningDeviceList.ContainsKey(camera.DeviceId))
                    {
                        deviceDriver = new HikVideoServerDeviceDriver();
                        deviceDriver.Init(ref oDevice);
                        _runningDeviceList.Add(camera.DeviceId, deviceDriver);
                    }

                    if (_runningDeviceList[camera.DeviceId].IsValidDevice)
                    {
                        oDevice.ServiceID = _runningDeviceList[camera.DeviceId].ServiceId;
                        if (!_runningCameraList.ContainsKey(camera.CameraId))
                        {
                            camera.ListOutputTarget = new ArrayList();
                            cameraDriver = new HikVideoServerCameraDriver(oDevice);
                            cameraDriver.CurrentCamera = camera;
                            camera.TotalDSP = _outputTv.TotalDSP;
                            _runningCameraList.Add(camera.CameraId, cameraDriver);
                        }

                    }
                    CameraWindow camwin = mainMultiplexer.GetCamera(i, j);
                    cameraDriver1 = _runningCameraList[camera.CameraId];
                    cameraDriver1.CurrentCamera.ListOutputTarget.Add(new DisplayHandlePair { DisplayChannelId = item.DisplayChannelId, DisplaySplitScreenNo = item.DisplaySplitScreenNo, Handle = camwin.Handle });
                    _runningCameraList[camera.CameraId] = cameraDriver1;
                    mainMultiplexer.SetCamera(i, j, cameraDriver);
                    j = j + 1;
                    if (j >= iCol)
                    {
                        i = i + 1;
                        j = 0;
                    }

                }
                foreach (KeyValuePair<int, HikVideoServerCameraDriver> item in _runningCameraList)
                {
                    item.Value.Start(item.Value.CurrentCamera, CardOutType.SynGroup, synGroupId);
                }

                mainMultiplexer.Rows = iRow;
                mainMultiplexer.Cols = iCol;
                mainMultiplexer.SingleCameraMode = false;
                mainMultiplexer.CamerasVisible = true;
            }
            catch (Exception ex)
            {

            }



        }

        private void CloseAll()
        {
            foreach (KeyValuePair<int, HikVideoServerCameraDriver> item in _runningCameraList)
            {
                item.Value.Close();
            }
            _runningCameraList.Clear();
            foreach (KeyValuePair<int, HikVideoServerDeviceDriver> item in _runningDeviceList)
            {
                item.Value.Close();
            }
            _runningDeviceList.Clear();
        }
        
        private void xtraTabControl2_SelectedPageChanged(object sender, DevExpress.XtraTab.TabPageChangedEventArgs e)
        {
            switch (e.Page.TabIndex)
            {
                case 0:
                    _listGroup = GroupBusiness.Instance.GetAllGroupInfos(ref _errMessage);
                    _listMap = MapBusiness.Instance.GetAllMapInfo(ref _errMessage);
                    cameraView1.ListGroup = _listGroup;
                    cameraView1.ListMap = _listMap;
                    break;
                case 1:
                    _listDecoder = DecoderBusiness.Instance.GetAllDecoderInfo(ref _errMessage);
                    cameraView1.ListDecoder = _listDecoder;
                    break;                    
                default:
                    _listGroup = GroupBusiness.Instance.GetAllGroupInfos(ref _errMessage);
                    cameraView1.ListGroup = _listGroup;
                    break;
            }
        }

        private void tvSynGroup_DoubleClick(object sender, EventArgs e)
        {
            //splitContainerControl1.SplitterPosition = splitContainerControl1.Height - tlpBottom.Height;
            //XtraMessageBox.Show(DateTime.Now.ToString());
        }

        private bool _isFullScreen;
        public void FullScreen(bool isFullScreen)
        {
            
            bar2.Visible = !isFullScreen;
            cameraView1.Visible = !isFullScreen;
            _isFullScreen = isFullScreen;
            if (_isFullScreen)
            {
                //splitContainerControl1.SplitterPosition = splitContainerControl1.Height+2;
            }
            else
            {
                //splitContainerControl1.SplitterPosition = splitContainerControl1.Height - tlpBottom.Height;

            }

        }
        private void Exit()
        {

            this.Close();

        }
        private void barbtnClose_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            Exit();

        }

        private void frmMain_Win_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Escape)
            {
                Exit();
            }
        }

        private void barButtonItem1_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            frmSetting setting = new frmSetting();
            setting.ShowDialog(this);
        }

        private void multiplexer1_DoubleCamera(bool isFullScreen, CameraInfo camera)
        {
            this.FullScreen(isFullScreen);
        }


        private void frmMain_Win_FormClosing(object sender, FormClosingEventArgs e)
        {
            try
            {
                if (!(XtraMessageBox.Show(this, "��ȷ��Ҫ�˳�ϵͳ��?", "��ע��", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes))
                {
                    e.Cancel = true;

                    return;
                }

                SystemLogBusiness.Instance.Insert(ref _errMessage, new SystemLog
                    {
                        HappenTime = DateTime.Now,
                        SystemTypeId = 3,
                        SystemTypeName = "�û��˳��ɹ�",
                        Content = "�û��˳��ɹ�",
                        SyeUserName = CurrentUser.UserName,
                        ClientUserId = CurrentUser.UserId,
                        ClientUserName = CurrentUser.UserName

                    });
                CloseAll();
                _outputTv.Close();
                ChannelServices.UnregisterChannel(chan1);
                HikStreamMediaServerSDK.FiniStreamServerLib();
            }
            catch (Exception ex)
            {

            }
        }

        #region ��¼���
        public static UserInfo CurrentUser = new UserInfo();
        private static MainForm _instance;
        public static MainForm Instance
        {
            get { return _instance ?? (_instance = new MainForm()); }
        }

        private string _inputPassword = "";
        private string _inputUsername = "";
        private string PromoteInfo = "";

        private bool Login(string iu, string ip, string pi)
        {

            FormLogin lf = new FormLogin(iu, ip, pi);
            if (lf.ShowDialog(this) == DialogResult.OK)
            {
                _inputUsername = lf.InputUsername;
                _inputPassword = lf.InputPassword;
                if (lf.isLoginOK == true)
                {
                    CurrentUser = lf.currentUser;
                    return true;
                }
                return false;
            }
            System.Diagnostics.Process.GetCurrentProcess().Kill();
            return false;
        }
        #endregion

        #region �������

        private void FilterInterface()
        {
            if (CurrentUser.UserTypeName != "����Ա")
            {
                if (barButtonItem1 != null)
                {
                    this.barButtonItem1.ItemClick -= barButtonItem1_ItemClick;
                    this.barButtonItem1.ItemClick += this.barButtonItem1_ItemClick_UpdateUser;
                }

            }
        }

        private void barButtonItem1_ItemClick_UpdateUser(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            var frmUser = new FrmUser(CurrentUser);
            frmUser.ShowDialog();
        }

        #endregion

        private void frmMain_Win_Load(object sender, EventArgs e)
        {
            this.Visible = false;
            FilterInterface();

            Splash.Splash.Status = "��ȡȺ����Ϣ...";
            _runningDeviceList = new Dictionary<int, HikVideoServerDeviceDriver>();
            _listGroup = GroupBusiness.Instance.GetAllGroupInfos(ref _errMessage);
            cameraView1.ListGroup = _listGroup;
            Splash.Splash.Status = "��ʼ���忨...";
            _outputTv = new OutputTVDeviceDriver();
            _outputTv.Init();
            HikVideoServerCameraDriver.InitDecodeCard();
            Splash.Splash.Status = "��ȡ���뿨��Ϣ...";
            _listDisplayChannelInfo = DisplayChannelBusiness.Instance.GetAllDisplayChannelInfo(ref _errMessage);
            InitDisplayRegion();

            Splash.Splash.Status = "��ȡ�豸��Ϣ...";
            _listDevice = DeviceBusiness.Instance.GetAllDeviceInfo(ref _errMessage);
            Splash.Splash.Status = "��ȡ����ͷ��Ϣ...";
            //videoOutList = new Dictionary<VideoOutputInfo, VideoOutputDriver>();
            _runningCameraList = new Dictionary<int, HikVideoServerCameraDriver>();
            _listAllCam = CameraBusiness.Instance.GetAllCameraInfo(ref _errMessage);

            Splash.Splash.Status = "��ȡ��������Ϣ...";
            _listDecoder = DecoderBusiness.Instance.GetAllDecoderInfo(ref _errMessage);
            cameraView1.ListDecoder = _listDecoder;
            

            this.cameraView1.tvSynGroup.DoubleClick += this.tvSynGroup_DoubleClick;
            this.cameraView1.xtraTabControl2.SelectedPageChanged += this.xtraTabControl2_SelectedPageChanged;
            this.cameraView1.DoubleDecoderCam += CameraView1DoubleDecoderCam;
            this.cameraView1.DoubleDevCam += CameraView1DoubleDevCam;

            //Debug.WriteLine("End frmMain_Win_Load" + DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss fff"));
            Splash.Splash.Status = "��ʼ�����!";
            Splash.Splash.Close();
            //HikVideoServerCameraDriver.InitDecodeCard();
            splitContainerControl1.SplitterPosition = splitContainerControl1.Height - 46;
            this.Visible = true;
        }

        private void InitDisplayRegion()
        {
            DISPLAY_PARA struCardPlayInfo = new DISPLAY_PARA();
            struCardPlayInfo.nLeft = 0;
            struCardPlayInfo.nTop = 0;
            struCardPlayInfo.nWidth = 704;
            struCardPlayInfo.nHeight = 576;
            struCardPlayInfo.bToScreen = 0;
            struCardPlayInfo.bToVideoOut = 1;
            if (_listDisplayChannelInfo==null) return;
            foreach (var displayChannelInfo in _listDisplayChannelInfo)
            {
                InitDisplayRegion(displayChannelInfo.Key);
            }
        }
        private void InitDisplayRegion(int displayChannelInfoId)
        {
            DISPLAY_PARA struCardPlayInfo = new DISPLAY_PARA();
            struCardPlayInfo.nLeft = 0;
            struCardPlayInfo.nTop = 0;
            struCardPlayInfo.nWidth = 704;
            struCardPlayInfo.nHeight = 576;
            struCardPlayInfo.bToScreen = 0;
            struCardPlayInfo.bToVideoOut = 1;
            int iRtn = HikVisionSDK.SetDisplayStandard(displayChannelInfoId, VideoStandard_t.StandardPAL);
            REGION_PARAM[] struDisplayRegion = HikVideoServerCameraDriver.GetStruDisplayRegion(struCardPlayInfo, _listDisplayChannelInfo[displayChannelInfoId].SplitScreenNo);
            iRtn = HikVisionSDK.SetDisplayRegion(displayChannelInfoId, _listDisplayChannelInfo[displayChannelInfoId].SplitScreenNo, ref struDisplayRegion[0], 0);
            
        }
        private void frmMain_Win_Resize(object sender, EventArgs e)
        {
            //tlpBottom.Left = splitContainerControl1.Panel2.Left;
            //splitContainerControl1.SplitterPosition = splitContainerControl1.Height - tlpBottom.Height;
        }


        private void ɾ��ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            var tag = ((ContextMenuStrip)((ToolStripMenuItem) sender).Owner).SourceControl.Tag;
            if (tag is AlarmIconInfo)
            {
                AlarmIconInfo alarmIconInfo = (AlarmIconInfo)tag;
                AlarmIconBusiness.Instance.Delete(ref _errMessage, alarmIconInfo.AlarmId);
                _listCurrentAlarmIcon.Remove(alarmIconInfo.AlarmId);
                _listAllAlarmIcon.Remove(alarmIconInfo.AlarmId);
                ((ContextMenuStrip)((ToolStripMenuItem) sender).Owner).SourceControl.Dispose();
            }
            else if (tag is CameraIconInfo)
            {
                CameraIconInfo cameraIconInfo = (CameraIconInfo)tag;
                CameraIconBusiness.Instance.Delete(ref _errMessage, cameraIconInfo.CameraId);
                _listCurrentCameraIcon.Remove(cameraIconInfo.CameraId);
                _listAllCameraIcon.Remove(cameraIconInfo.CameraId);
                ((ContextMenuStrip)((ToolStripMenuItem)sender).Owner).SourceControl.Dispose();
            }
        }
        private string CurrentAlarmSites;
        private Dictionary<int, AlarmInfo> _listAlarmSites = new Dictionary<int, AlarmInfo>();
        private void timerCheckAlarmSites_Tick(object sender, EventArgs e)
        {
            if (HikVideoServerCameraDriver.AlarmSites != null)
            {
                
                CurrentAlarmSites = HikVideoServerCameraDriver.AlarmSites;
                string sitesSubString = CurrentAlarmSites.Substring(8, 4);
                int x = int.Parse(sitesSubString, NumberStyles.HexNumber);
                string sites = Convert.ToString(x, 2);
                for (int i = 0; i < sites.Length; i++)
                {
                    if ((sites.Substring(i,1)=="1"))
                    {
                        if ((_listAlarm.ContainsKey(sites.Length - i))&&_listAlarmSites.ContainsKey(sites.Length - i)==false)
                        {
                            _listAlarmSites.Add(sites.Length - i, _listAlarm[sites.Length - i]);
                        }
                        else if ((_listAlarm.ContainsKey(sites.Length - i))&&_listAlarmSites.ContainsKey(sites.Length - i)==true)
                        {
                            _listAlarmSites[sites.Length - i] = _listAlarm[sites.Length - i];
                        }
                        
                    }
                }
                HikVideoServerCameraDriver.AlarmSites =null;
            }
        }

        [System.Runtime.InteropServices.DllImport("user32.dll")]
        public static extern bool MessageBeep(uint uType);


        private void barButtonItemResultView_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            dockPanelResult.Visible = !dockPanelResult.Visible;
        }

        private void barButtonItemAlarmView_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            dockPanelAlarm.Visible = !dockPanelAlarm.Visible;
        }

        private void barButtonItem5_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            frmSetting setting = new frmSetting();
            setting.ShowDialog(this);
        }

        private void barButtonItem3_ItemClick_1(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            frmSetting setting = new frmSetting();
            setting.ShowDialog(this);
        }

        private void barButtonItem7_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            this.Close();
        }

        private void timerCurretnTime_Tick(object sender, EventArgs e)
        {
            barStaticItemCurrentTime.Caption = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
        }

        private void LivePacketHandleDataChange(object sender, DataChangeEventArgs e)
        {

            var livePacketHandle = (LivePacketHandle)sender;
            if (livePacketHandle == null) return;
            //������Ƶ 
            ShowLiveVideo(livePacketHandle);

        }
        protected void ShowLiveVideo(LivePacketHandle livePacketHandle)
        {
            CrossThreadOperationControl crossAdd = delegate()
            {
                string errMsg = "";
                Dictionary<int, WindowCameraInfo> listWindowCamera =
                    WindowCameraBusiness.Instance.GetWindowCameraInfoByCamera(ref errMsg,
                                                                              livePacketHandle.CurrentNetImage.CameraId);

                foreach (var windowCameraInfo in listWindowCamera)
                {
                    CameraWindow cameraWindow = mainMultiplexer.GetCamera(windowCameraInfo.Value.Row, windowCameraInfo.Value.Col);
                    if (cameraWindow.CurrentImage != null) cameraWindow.CurrentImage.Dispose();
                    cameraWindow.CurrentImage = livePacketHandle.CurrentNetImage.Image;
                    cameraWindow.CameraID = windowCameraInfo.Key;
                    cameraWindow.Refresh();                   
                }

            };
        }
        #region Connect sever
        private delegate void CrossThreadOperationControl();
        private void ConnectionServer()
        {
            _getTransPacket.Ip = Properties.Settings.Default.DecoderIp;
            _getTransPacket.Port = Properties.Settings.Default.DecoderPort;

            var thread = new Thread(_getTransPacket.InitSocket) { IsBackground = true };
            thread.Start();

        }

        private void GtpConnectionServerHandle(object sender, DataChangeEventArgs e)
        {
            bool isConnect = Convert.ToBoolean(e.Name);
            if (isConnect)
            {
                ThreadPool.QueueUserWorkItem(obj => _getTransPacket.GetData(), null);
                ShowConnectionInfo(e.Ip, true);
            }
            else
            {
                ShowConnectionInfo(e.Ip, false);
            }
        }

        protected void ShowConnectionInfo(string ip, bool state)
        {
            CrossThreadOperationControl crossOperation = delegate()
            {
                if (state)
                {
                    barStaticItemNetStatus.Appearance.ForeColor = barStaticItem1.Appearance.ForeColor;
                    barStaticItemNetStatus.Caption = "���ӳɹ���";
                    _socketState = true;
                }
                else
                {
                    barStaticItemNetStatus.Appearance.ForeColor = Color.Red;
                    barStaticItemNetStatus.Caption = string.Format("����ʧ�ܣ�{0}�������", Properties.Settings.Default.AutoConnectTime / 1000);
 //                   pictureEditRealImage.Image = MainForm.DefaultImage ?? Image.FromFile("NoData.jpg");
                    _socketState = false;
                }
            };

            try
            {
                Invoke(crossOperation);
            }
            catch (System.Exception ex)
            {
                Close();
                Dispose();
            }

        }

        #endregion

        private bool _socketState;
        private void timerCheckConnection_Tick(object sender, EventArgs e)
        {
            if (!_socketState)
                ConnectionServer();
        }
        private TcpListener listener = new TcpListener(IPAddress.Any, 8000);
        private TcpClient client=new TcpClient();
        private Thread thThreadread;//�����̣߳����������˿ںţ�������Ϣ


        private  int portNum; //= Convert.ToInt32(LocalPortTxt.Text);
        private bool done = false;
        private IPEndPoint ipep ;
        private Socket server;

        public void StartServer()
        {
            try{
                server = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
                server.Bind(new IPEndPoint(new IPAddress(new byte[]{192,168,1,108}), 8888));
                server.Listen(500);
                // ��ʼ����
                while (!done)
                {
                    Socket client = server.Accept();
                    //start tcp server
                    var parStart = new ParameterizedThreadStart(SocketThread);
                    var myThread = new Thread(parStart);
                    myThread.Start(client);
                }
            }
            catch (Exception e)
            {
                ;
            }
            finally
            {
                client.Close();
                listener.Stop();
                server.Close();
            }
        }

        //����socket���ӵ��߳�
        public void SocketThread(object socket)
        {
            //��ÿͻ��˽ڵ����   
            var clientConnection = new ClientConnection((Socket)socket);

            clientConnection.LivePacketHandle.DataChange += LivePacketHandleDataChange; 

            if (!listRunningClient.ContainsKey(clientConnection.DecoderInfo.id))
            {
                listRunningClient.Add(clientConnection.DecoderInfo.id, clientConnection);
            }
            else
            {
                listRunningClient[clientConnection.DecoderInfo.id] = clientConnection;
            }
            clientConnection.SendDecoderXML();
            clientConnection.GetData();
        }
        private Dictionary<int, ClientConnection> listRunningClient = new Dictionary<int, ClientConnection>();

        private void barButtonItem8_ItemClick_1(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            foreach (var v in listRunningClient)
            {
                v.Value.SendDecoderStartCommand();
            }
        }

        private void barButtonItem9_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            foreach (var v in listRunningClient)
            {
                v.Value.SendDecoderStopCommand();
            }
        }

        private void barButtonItem10_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            foreach (var v in listRunningClient)
            {
                v.Value.SetPicWidthHeight(352,288);
            }
        }

        private void barButtonItem11_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            foreach (var v in listRunningClient)
            {
                v.Value.SendDecoderXML();
            }
        }

        private void barButtonItem12_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            CameraWindow cameraWindow = mainMultiplexer.GetCamera(1, 1);
            cameraWindow.CurrentImage = Image.FromFile(@"C:\fff1a7ef-43d7-46d9-ad61-d5c9f8fe4b53.bmp");
        }

        private bool testimage;
        private object lockerCurrentImage = new object();
        private Guid guidA = Guid.NewGuid();
        private Guid guidB = Guid.NewGuid();
        private void timerTest_Tick(object sender, EventArgs e)
        {
            lock (lockerCurrentImage)
            {
                testimage =!testimage;
                if (testimage)
                {
                    CameraWindow cameraWindow = mainMultiplexer.GetCamera(1, 1);
                    if (cameraWindow.CurrentImage != null) cameraWindow.CurrentImage.Dispose();
                    cameraWindow.CurrentImage = Image.FromFile(@"C:\imm_2010_07_06_18_35_29_212.JPG");
                    cameraWindow.CurrentImageGuid = guidA;
                    cameraWindow.Refresh();

                }
                else
                {
                    CameraWindow cameraWindow = mainMultiplexer.GetCamera(1, 1);
                    if (cameraWindow.CurrentImage != null) cameraWindow.CurrentImage.Dispose();
                    cameraWindow.CurrentImage = Image.FromFile(@"C:\imm_2010_07_06_18_35_29_21.JPG");
                    cameraWindow.CurrentImageGuid = guidB;
                    cameraWindow.Refresh();
            
                }                
            }


        }

        private void simpleButton1_Click(object sender, EventArgs e)
        {
            int iRow = 1, iCol = 1;
            Util.GetRowCol(1, ref iRow, ref iCol);
            mainMultiplexer.Rows = iRow;
            mainMultiplexer.Cols = iCol;
            mainMultiplexer.Refresh();
        }

        private void simpleButton2_Click(object sender, EventArgs e)
        {
            int iRow = 2, iCol = 2;
            Util.GetRowCol(4, ref iRow, ref iCol);
            mainMultiplexer.Rows = iRow;
            mainMultiplexer.Cols = iCol;
            mainMultiplexer.Refresh();
        }

        private void simpleButton3_Click(object sender, EventArgs e)
        {
            int iRow = 3, iCol = 3;
            Util.GetRowCol(9, ref iRow, ref iCol);
            mainMultiplexer.SetRowCol(iRow,iCol);
            mainMultiplexer.Refresh();
        }

        private void simpleButton4_Click(object sender, EventArgs e)
        {
            int iRow = 4, iCol = 4;
            Util.GetRowCol(16, ref iRow, ref iCol);
            mainMultiplexer.Rows = iRow;
            mainMultiplexer.Cols = iCol;
            mainMultiplexer.Refresh();
        }

        private void simpleButton5_Click(object sender, EventArgs e)
        {
            int iRow = 5, iCol = 5;
            Util.GetRowCol(25, ref iRow, ref iCol);
            mainMultiplexer.Rows = iRow;
            mainMultiplexer.Cols = iCol;
            mainMultiplexer.Refresh();
        }

        private void splitContainerControl1_Resize(object sender, EventArgs e)
        {
            
        }

        private void splitContainerControl1_SplitterPositionChanged(object sender, EventArgs e)
        {
                splitContainerControl1.SplitterPosition = splitContainerControl1.Height - 46;
        }

        private void barButtonItem13_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            long date =DateTime.Now.Ticks;
            DateTime theDate =new DateTime(date);����

        }

        Image[] _ImageSerias = new Image[5];
        private int _currentImageIndex = 0;

        //���ؼ��Ƚ�����Image�����Ƿ���ͬ
        private bool Equals(Image a, Image b)
        {
            MemoryStream msa = new MemoryStream();
            MemoryStream msb = new MemoryStream();
            a.Save(msa, System.Drawing.Imaging.ImageFormat.Bmp);
            b.Save(msb, System.Drawing.Imaging.ImageFormat.Bmp);
            byte[] ima = msa.GetBuffer();
            byte[] imb = msb.GetBuffer();
            if (ima.Length != imb.Length) 
                return false;
            else
            {
                for (int i = 0; i < ima.Length; i++)
                    if (ima[i] != imb[i]) 
                        return false;
            }
            return true;
        }
        Guid currentGuid;
        private void barButtonItemGetPics_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            ThreadStart threadStart = new ThreadStart(CaptureImageThread);
            Thread thread = new Thread(threadStart);
            thread.Start();
        }
        public delegate void DelShowDrawingForm(Image[] image,int cameraId);
        private void ShowDrawingForm(Image[] image,int cameraId)
        {
            frmDrawing myfrmDrawing = new frmDrawing(image,cameraId);
            myfrmDrawing.ShowDialog();
        }
        private void CaptureImageThread()
        {
            //lock (lockerCurrentImage)
            //{
                try
                {
                    CameraWindow camwin = mainMultiplexer.GetCurrentCameraWindow();
                    if (camwin == null)
                    {
                        XtraMessageBox.Show("��ѡ��һ������!");
                        return;
                    }
                    _currentImageIndex = 0;
                    currentGuid = camwin.CurrentImageGuid;
                    _ImageSerias[_currentImageIndex++] = (Image)(camwin.CurrentImage.Clone());
                    while (_currentImageIndex < 5)
                    {
                        lock (lockerCurrentImage)
                        {
                            if (currentGuid != camwin.CurrentImageGuid)
                            {
                                _ImageSerias[_currentImageIndex++] = (Image)(camwin.CurrentImage.Clone());
                            }
                            Thread.Sleep(77);                            
                        }

                    }

                    //_ImageSerias[0] = Image.FromFile(@"C:\Users\Public\Pictures\Sample Pictures\Desert.jpg");
                    //_ImageSerias[1] = Image.FromFile(@"C:\Users\Public\Pictures\Sample Pictures\Penguins.jpg");
                    //_ImageSerias[2] = Image.FromFile(@"C:\Users\Public\Pictures\Sample Pictures\Koala.jpg");
                    //_ImageSerias[3] = Image.FromFile(@"C:\Users\Public\Pictures\Sample Pictures\Tulips.jpg");
                    //_ImageSerias[4] = Image.FromFile(@"C:\Users\Public\Pictures\Sample Pictures\Chrysanthemum.jpg");

                    //���������ã�����ͷID����Ϊ1
                    DelShowDrawingForm delShowDrawingForm  = ShowDrawingForm;
                    this.Invoke(delShowDrawingForm, new object[] { _ImageSerias, camwin.CameraID });


                }
                catch (Exception ex)
                {
                    XtraMessageBox.Show(ex.ToString());
                }
            //}
        }
    }
}