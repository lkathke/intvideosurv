// Camara Vision
//
// Copyright ?Andrew Kirillov, 2005-2006
// andrew.kirillov@gmail.com
//

namespace SANYO
{
	using System;
	using videosource;

	/// <summary>
	/// PixordConfiguration
	/// </summary>
	public class SANYOConfiguration
	{
     
		public string	source;
		public string	login;
		public string	password;
		public int		frameInterval = 0;
		public StreamType	stremType = StreamType.Jpeg;
		public string	resolution;
		public string	quality;
	}
}
