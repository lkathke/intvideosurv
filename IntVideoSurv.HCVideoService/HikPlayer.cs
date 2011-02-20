using System;
using System.Runtime.InteropServices;
using System.Drawing;

namespace HCVideoService
{
	#region Struct
	/// <summary>
	/// typedef struct{
	///		long nWidth;	//�������λ���ء��������Ƶ������Ϊ 0��
	///		long nHeight;	//����ߡ��������Ƶ������Ϊ 0��
	///		long nStamp;	//ʱ����Ϣ����λ���롣
	///		long nType;		//�������ͣ�T_AUDIO16��T_RGB32�� T_YV12������궨��˵����
	///		long nFrameRate;//����ʱ������ͼ��֡�ʡ�
	/// }FRAME_INFO; 
	/// </summary>
	public struct FRAME_INFO
	{
		/// <summary>
		/// �������λ���ء��������Ƶ������Ϊ0
		/// long nWidth;
		/// </summary>
		public int nWidth;
		/// <summary>
		/// ����ߡ��������Ƶ������Ϊ0
		/// long nHeight;
		/// </summary>
		public int nHeight;
		/// <summary>
		/// ʱ����Ϣ����λ����
		/// long nStamp;
		/// </summary>
		public int nStamp;
		/// <summary>
		/// �������ͣ�T_AUDIO16��T_RGB32�� T_YV12
		/// long nType;
		/// </summary>
		public int nType;
		/// <summary>
		/// ����ʱ������ͼ��֡��
		/// long nFrameRate;
		/// </summary>
		public int nFrameRate;
	}

	/// <summary>
	/// typedef struct{
	///		long nFilePos;	//�ļ�λ�ã�
	///		long nFrameNum;	//֡��ţ�
	///		long nFrameTime;//֡ʱ�꣨ms��;
	/// }FRAME_POS,*PFRAME_POS; 
	/// </summary>
	public struct PFRAME_POS
	{
		/// <summary>
		/// ������ļ�λ�� 
		/// long nFilePos;
		/// </summary>
		public int nFilePos;
		/// <summary>
		/// �����������֡��
		/// long nFrameNum;
		/// </summary>
		public int nFrameNum;
		/// <summary>
		/// �����������ʱ�䣨��Դ��ļ���ʼʱ�䣩
		/// long nFrameTime;
		/// </summary>
		public int nFrameTime;
		/// <summary>
		/// ����ʱ��֡��
		/// long nErrorFrameNum;
		/// </summary>
		public int nErrorFrameNum;
		/// <summary>
		/// ����ľ���ʱ�䣨�豸¼���ļ����ã�
		/// SYSTEMTIME *pErrorTime;
		/// </summary>
		public DateTime pErrorTime;
		/// <summary>
		/// ����ʱ��ʧ��֡��
		/// long nErrorLostFrameNum;
		/// </summary>
		public int nErrorLostFrameNum;
		/// <summary>
		///  ����ʱ��������ݴ�С
		/// long nErrorFrameSize;
		/// </summary>
		public int nErrorFrameSize;
	}

	/// <summary>
	/// typedef struct{
	///		char *pDataBuf;	//����֡�׵�ַ
	///		long nSize;		//����֡�Ĵ�С
	///		long nFrameNum;	//����֡�ĸ���
	///		BOOL bIsAudio;	//�Ƿ���Ƶ֡
	///		long nReserved;	//����
	/// }FRAME_TYPE; 
	/// </summary>
	public struct FRAME_TYPE
	{
		/// <summary>
		/// ����֡�׵�ַ
		/// char *pDataBuf;
		/// </summary>
		public byte[] pDataBuf;
		/// <summary>
		/// ����֡�Ĵ�С
		/// long nSize;
		/// </summary>
		public int nSize;
		/// <summary>
		/// ����֡�ĸ���
		/// long nFrameNum;
		/// </summary>
		public int nFrameNum;
		/// <summary>
		/// �Ƿ���Ƶ֡
		/// BOOL bIsAudio;
		/// </summary>
		public bool bIsAudio;
		/// <summary>
		/// ����
		/// long nReserved;
		/// </summary>
		public int nReserved;
	}
    #endregion

	#region Delegate
	///////////////////////////////////////////////////////////////////////////////////////////////
	//ע�⣺���ڻص���������Ϊvb��֧�ֶ��̣߳����Ե��ص�������VB�����ĺ���ʱ����vc���߳��е���vb�ĺ������������⡣
	//		�����Microsoft Knowledge Base Article - Q198607 ��PRB: Access Violation in VB Run-Time Using AddressOf ���� 
	///////////////////////////////////////////////////////////////////////////////////////////////

	/// <summary>
	/// void (CALLBACK* DecCBFun)(long nPort,char * pBuf,long nSize,FRAME_INFO * pFrameInfo, long nReserved1,long nReserved2)
	/// �ص�����ָ�롣����Ϊ NULL; 
	/// </summary>
	/// <param name="nPort">������ͨ����</param>
	/// <param name="pBuf">����������Ƶ����</param>
	/// <param name="nSize">����������Ƶ����pBuf�ĳ���</param>
	/// <param name="pFrameInfo">ͼ���������Ϣ</param>
	/// <param name="nReserved1">��������</param>
	/// <param name="nReserved2">��������</param>
	public delegate void DecCBFun(int nPort, IntPtr pBuf, int nSize, ref FRAME_INFO pFrameInfo, int nReserved1, int nReserved2);

	/// <summary>
	/// void (CALLBACK* DisplayCBFun)(long nPort,char * pBuf,long nSize,long nWidth,long nHeight,long nStamp,long nType,long nReceaved)); 
	/// ץͼ�ص�����������Ϊ NULL; 
	/// </summary>
	/// <param name="nPort">ͨ����</param>
	/// <param name="pBuf">����ͼ������</param>
	/// <param name="nSize">����ͼ�����ݴ�С</param>
	/// <param name="nWidth">�������λ����</param>
	/// <param name="nHeight">�����</param>
	/// <param name="nStamp">ʱ����Ϣ����λ����</param>
	/// <param name="nType">�������ͣ�T_YV12��T_RGB32��T_UYVY</param>
	/// <param name="nReceaved">����</param>
	public delegate void DisplayCBFun(int nPort, IntPtr pBuf, int nSize, int nWidth, int nHeight, int nStamp, int nType, int nReceaved);

	/// <summary>
	/// void CALLBACK SourceBufCallBack(long nPort,DWORD nBufSize, DWORD dwUser,void*pContext) 
	/// </summary>
	/// <param name="nPort">������ͨ����</param>
	/// <param name="nBufSize">��������ʣ������</param>
	/// <param name="dwUser">�û�����</param>
	/// <param name="pContext">��������</param>
	public delegate void SourceBufCallBack(int nPort, ushort nBufSize, ushort dwUser, IntPtr pContext);

	/// <summary>
	/// void FileRefDone(DWORD nPort,DWORD nUser) 
	/// </summary>
	/// <param name="nPort">������ͨ����</param>
	/// <param name="nUser">�û�����</param>
	public delegate void FileRefDone(int nPort, ushort nUser);

	/// <summary>
	/// void CALLBACK DrawFun(long nPort,HDC hDc,LONG nUser)�� 
	/// </summary>
	/// <param name="nPort">ͨ����</param>
	/// <param name="hDc">hDc OffScreen�����豸�����ģ�������������ʾ���ڿͻ���DC������������</param>
	/// <param name="nUser">�û����ݣ���������������û�����</param>
	public delegate void DrawFun(int nPort, IntPtr hDc, int nUser);

	/// <summary>
	/// void __stdcall Verify(long nPort, FRAME_POS * pFilePos, DWORD bIsVideo, DWORD nUser)
	/// </summary>
	/// <param name="nPort">ͨ����</param>
	/// <param name="pFilePos">�ļ�λ��</param>
	/// <param name="bIsVideo">�Ƿ���Ƶ���ݣ�1��Ƶ��0��Ƶ</param>
	/// <param name="nUser">�û�����</param>
	public delegate void Verify(int nPort, ref PFRAME_POS pFilePos, ushort bIsVideo, ushort nUser);

	/// <summary>
	/// void __stdcall  Audio(long nPort, char * pAudioBuf, long nSize, long nStamp, long nType, long nUser) 
	/// </summary>
	/// <param name="nPort">ͨ����</param>
	/// <param name="pAudioBuf">wave��ʽ��Ƶ����</param>
	/// <param name="nSize">��Ƶ���ݳ���</param>
	/// <param name="nStamp"> ʱ��(ms) </param>
	/// <param name="nType">��Ƶ����T_AUDIO16, ������16khz����������ÿ��������16λ��ʾ </param>
	/// <param name="nUser">�û��Զ�������</param>
	public delegate void Audio(int nPort, string pAudioBuf, int nSize, int nStamp, int nType, int nUser);

	/// <summary>
	/// void (CALLBACK *funEncChange)(long nPort,long nUser) 
	/// </summary>
	/// <param name="nPort">ͨ����</param>
	/// <param name="nUser">�û��Զ�������</param>
	public delegate void EncChange(int nPort, int nUser);

	/// <summary>
	/// void(CALLBACK *funGetOrignalFrame)(long nPort,FRAME_TYPE *frameType, long nUser) 
	/// </summary>
	/// <param name="nPort">ͨ����</param>
	/// <param name="frameType">�й�����֡����Ϣ</param>
	/// <param name="nUser"></param>
	public delegate void GetOrignalFrame(int nPort, ref FRAME_TYPE frameType, int nUser);
	#endregion

	/// <summary>
	/// ������
	/// </summary>
	public sealed class HikPlayer
    {
        #region Const Member Variables
        // #define WINVER 
        // 0x0700 Windows 7
        // 0x0600 Windows Vista
        // 0x0502 Windows 2003 Server
        // 0x0410 Windows XP
        //<0x0400 Windows 98/Windows 2000
        public static readonly int WINVER = 0x0502;

		public static readonly uint WM_USER = 0x0400;
		public static readonly uint WM_FILE_END = WM_USER + 33;
		public static readonly uint WM_ENC_CHANGE = WM_USER + 100;
		
        public static readonly int COLOR_DEFAULT = 64;
        public static readonly int PLAYER_SLIDER_MAX = 200;
        public static readonly int MAX_DISPLAY_DEVICE = 4;

        public static readonly int WIDTH_PAL = 352;
        public static readonly int HEIGHT_PAL = 288;

		#region Source buffer
		//#define SOURCE_BUF_MAX
		public static readonly uint SOURCE_BUF_MAX = 1024 * 100000;
		//#define SOURCE_BUF_MIN    1024*50
		public static readonly uint SOURCE_BUF_MIN = 1024 * 50;
		#endregion

		#region Frame type
		/// <summary>
		/// ��Ƶ����;������16khz����������ÿ��������16λ��ʾ��
		/// </summary>
		public static readonly int T_AUDIO16 = 101;
		public static readonly int T_AUDIO8 = 100;

		/// <summary>
		/// ��Ƶ���ݣ�uyvy��ʽ����U0-Y0-V0-Y1-U2-Y2-V2-Y3��.������һ������λ��ͼ�����Ͻǡ� 
		/// </summary>
		public static readonly int T_UYVY = 1;
		/// <summary>
		/// ��Ƶ���ݣ�yv12��ʽ������˳��Y0-Y1-����������V0-V1��.������U0-U1-��..���� 
		/// </summary>
		public static readonly int T_YV12 = 3;
		/// <summary>
		/// ��Ƶ���ݡ�ÿ������4���ֽڣ����з�ʽ��λͼ���ƣ���B-G-R-0 ����������һ������λ��ͼ�����½ǡ� 
		/// </summary>
		public static readonly int T_RGB32 = 7;
		#endregion

		#region Stream type
		/// <summary>
		/// ʵʱģʽ���ʺϲ�������ʵʱ���ݣ������������̽��롣
		/// </summary>
		public static readonly int STREAME_REALTIME = 0;
		/// <summary>
		/// �ļ�ģʽ���ʺ��û����ļ�����������ʽ���롣
		/// ע�⣺��PlayM4_InputData()����FALSEʱ���û�Ҫ��һ���������롣
		/// </summary>
		public static readonly int STREAME_FILE = 1;
		#endregion

		#region Error code
		/// <summary>
		/// û�д���
		/// no error
		/// </summary>
		public static readonly int PlayM4_NOERROR = 0;
		/// <summary>
		/// ��������Ƿ�
		/// input parameter is invalid;
		/// </summary>
		public static readonly int PlayM4_PARA_OVER = 1;
		/// <summary>
		/// ����˳�򲻶�
		/// The order of the function to be called is error.
		/// </summary>
		public static readonly int PlayM4_ORDER_ERROR = 2;
		/// <summary>
		/// ��ý��ʱ������ʧ��
		/// Create multimedia clock failed;
		/// </summary>
		public static readonly int PlayM4_TIMER_ERROR = 3;
		/// <summary>
		/// ��Ƶ����ʧ��
		/// Decode video data failed.
		/// </summary>
		public static readonly int PlayM4_DEC_VIDEO_ERROR = 4;
		/// <summary>
		/// ��Ƶ����ʧ��
		/// Decode audio data failed.
		/// </summary>
		public static readonly int PlayM4_DEC_AUDIO_ERROR = 5;
		/// <summary>
		/// �����ڴ�ʧ��
		/// Allocate memory failed.
		/// </summary>
		public static readonly int PlayM4_ALLOC_MEMORY_ERROR = 6;
		/// <summary>
		/// �ļ�����ʧ��
		/// Open the file failed.
		/// </summary>
		public static readonly int PlayM4_OPEN_FILE_ERROR = 7;
		/// <summary>
		/// �����߳��¼���ʧ��
		/// Create thread or event failed.
		/// </summary>
		public static readonly int PlayM4_CREATE_OBJ_ERROR = 8;
		/// <summary>
		/// ����DirectDrawʧ��
		/// Create DirectDraw object failed.
		/// </summary>
		public static readonly int PlayM4_CREATE_DDRAW_ERROR = 9;
		/// <summary>
		/// ������˻���ʧ��
		/// Failed when creating off-screen surface.
		/// </summary>
		public static readonly int PlayM4_CREATE_OFFSCREEN_ERROR = 10;
		/// <summary>
		/// ����������������ʧ��
		/// Buffer is overflow.
		/// </summary>
		public static readonly int PlayM4_BUF_OVER = 11;
		/// <summary>
		/// ������Ƶ�豸ʧ��
		/// Failed when creating audio device.
		/// </summary>
		public static readonly int PlayM4_CREATE_SOUND_ERROR = 12;
		/// <summary>
		/// ��������ʧ��
		/// Set volume failed.
		/// </summary>
		public static readonly int PlayM4_SET_VOLUME_ERROR = 13;
		/// <summary>
		/// ֻ���ڲ����ļ�ʱ����ʹ�ô˽ӿ�
		/// The function only support play file.
		/// </summary>
		public static readonly int PlayM4_SUPPORT_FILE_ONLY = 14;
		/// <summary>
		/// ֻ���ڲ�����ʱ����ʹ�ô˽ӿ�
		/// The function only support play stream.
		/// </summary>
		public static readonly int PlayM4_SUPPORT_STREAM_ONLY = 15;
		/// <summary>
		/// ϵͳ��֧�֣�������ֻ�ܹ�����Pentium 3����
		/// System not support.
		/// </summary>
		public static readonly int PlayM4_SYS_NOT_SUPPORT = 16;
		/// <summary>
		/// û���ļ�ͷ
		/// No file header.
		/// </summary>
		public static readonly int PlayM4_FILEHEADER_UNKNOWN = 17;
		/// <summary>
		/// �������ͱ������汾����Ӧ
		/// The version of decoder and encoder is not adapted.  
		/// </summary>
		public static readonly int PlayM4_VERSION_INCORRECT = 18;
		/// <summary>
		/// ��ʼ��������ʧ��
		/// Initialize decoder failed.
		/// </summary>
		public static readonly int HIK_PALYM4_INIT_DECODER_ERROR = 19;
		/// <summary>
		/// �ļ�̫�̻������޷�ʶ��
		/// The file data is unknown.
		/// </summary>
		public static readonly int PlayM4_CHECK_FILE_ERROR = 20;
		/// <summary>
		/// ��ʼ����ý��ʱ��ʧ��
		/// Initialize multimedia clock failed.
		/// </summary>
		public static readonly int PlayM4_INIT_TIMER_ERROR = 21;
		/// <summary>
		/// λ����ʧ��
		/// Blt failed.
		/// </summary>
		public static readonly int PlayM4_BLT_ERROR = 22;
		/// <summary>
		/// ��ʾOverlayʧ��
		/// Update failed.
		/// </summary>
		public static readonly int PlayM4_UPDATE_ERROR = 23;
		/// <summary>
		/// ���ļ�����
		/// Open file error, stream type is multi.
		/// </summary>
		public static readonly int PlayM4_OPEN_FILE_ERROR_MULTI = 24;
		/// <summary>
		/// ���ļ�����
		/// Open file error, stream type is video.
		/// </summary>
		public static readonly int PlayM4_OPEN_FILE_ERROR_VIDEO = 25;
		/// <summary>
		/// JPEG��ʽѹ������
		/// JPEG compress error.
		/// </summary>
		public static readonly int PlayM4_JPEG_COMPRESS_ERROR = 26;
		/// <summary>
		/// ��֧�ִ��ļ��İ汾
		/// Don't support the version of this file.
		/// </summary>
		public static readonly int PlayM4_EXTRACT_NOT_SUPPORT = 27;
		/// <summary>
		/// ��ȡ��Ƶ����ʧ��
		/// Extract video data failed.
		/// </summary>
		public static readonly int PlayM4_EXTRACT_DATA_ERROR = 28;

		#endregion

		#region Display buffers
		/// <summary>
		/// ���Ż������ֵ
		/// </summary>
		public static readonly int MAX_DIS_FRAMES = 50;
		/// <summary>
		/// ���Ż�����Сֵ
		/// </summary>
		public static readonly int MIN_DIS_FRAMES = 6;
		#endregion

		#region Locate by
		/// <summary>
		/// ֡��
		/// </summary>
		public static readonly int BY_FRAMENUM = 1;
		/// <summary>
		/// ʱ��
		/// </summary>
		public static readonly int BY_FRAMETIME = 2;
		#endregion

		#region Display type
		/// <summary>
		/// �����ֱ����������Կ���ʾ��
		/// </summary>
		public static readonly int DISPLAY_NORMAL = 1;
		/// <summary>
		/// 1/4�ֱ����������Կ���ʾ��
		/// </summary>
		public static readonly int DISPLAY_QUARTER = 2;
		#endregion

		#region Timer type
		/// <summary>
		/// һ��������ֻ��ʹ��16������ʱ�Ƚ�׼������������
		/// Only 16 timers for every process.Default TIMER;
		/// </summary>
		public static readonly int TIMER_1 = 1;
		/// <summary>
		/// ʹ����Ŀû�����ƣ���ʱû��TIMER_1׼��
		/// Not limit;But the precision less than TIMER_1; 
		/// </summary>
		public static readonly int TIMER_2 = 2;
		#endregion

		#region BUFFER TYPE
		/// <summary>
		/// ��Ƶ����Դ���������������֮ǰ��Ƶ���ݣ�ֻ����ģʽ��Ч����λbyte��
		/// </summary>
		public static readonly ushort BUF_VIDEO_SRC = 1;
		/// <summary>
		/// ��Ƶ����Դ���������������֮ǰ��Ƶ���ݣ�ֻ����ģʽ��Ч, ��λbyte�� 
		/// </summary>
        public static readonly ushort BUF_AUDIO_SRC = 2;
		/// <summary>
		/// �������Ƶ���ݻ���������λ֡���� 
		/// </summary>
        public static readonly ushort BUF_VIDEO_RENDER = 3;
		/// <summary>
		/// �������Ƶ���ݻ���������λ֡������Ƶ40ms���ݶ�Ϊһ֡�� 
		/// </summary>
        public static readonly ushort BUF_AUDIO_RENDER = 4;
		#endregion

		#endregion

		#region HikPlayer

        [DllImport("PlayCtrl.dll")]
        public static extern bool PlayM4_FreePort(int Port);

        [DllImport("PlayCtrl.dll")]
        public static extern bool PlayM4_GetPort(ref int Port);	
        
        /// <summary>
		/// 1�� BOOL PlayM4_InitDDraw(HWND hWnd);
		/// ��ʼ��DirectDraw���档��ʹ��vb,delphi����ʱ��ע�⣬�������ɵĶԻ������WS_CLIPCHILDREN
		/// ���ڷ�񣬱���ȥ�����ַ�񣬷�����ʾ����ᱻ�Ի����ϵĿؼ����ǡ�ע�⣺1.1�����ϲ���Ҫ���á�
		/// </summary>
		/// <param name="hWnd">hWnd Ӧ�ó��������ڵľ����</param>
		/// <returns></returns>
		[DllImport("PlayCtrl.dll")]
		public static extern bool PlayM4_InitDDraw(IntPtr hWnd);

		/// <summary>
		/// 2�� BOOL PlayM4_RealeseDDraw(); 
		/// �ͷ�directDraw���棻ע�⣺1.1�����ϲ���Ҫ���á�
		/// </summary>
		/// <returns></returns>
		[DllImport("PlayCtrl.dll")]
		public static extern bool PlayM4_RealeseDDraw();

		/// <summary>
		/// 3�� BOOL PlayM4_OpenFile(LONG nPort,LPSTR sFileName); 
		/// �򿪲����ļ�
		/// </summary>
		/// <param name="nPort"></param>
		/// <param name="sFileName">�ļ������ļ����ܳ���4G��С��4K</param>
		/// <returns></returns>
		[DllImport("PlayCtrl.dll")]
		public static extern bool PlayM4_OpenFile(int nPort, string sFileName);

		/// <summary>
		/// 4�� BOOL PlayM4_CloseFile(LONG nPort); 
		/// �رղ����ļ�
		/// </summary>
		/// <param name="nPort"></param>
		/// <returns></returns>
		[DllImport("PlayCtrl.dll")]
		public static extern bool PlayM4_CloseFile(int nPort);

		/// <summary>
		/// 5�� BOOL PlayM4_Play(LONG nPort, HWND hWnd); 
		/// ���ſ�ʼ��������Ƶ�����С������hWnd���ڵ�����Ҫȫ����ʾ��ֻҪ��hWnd���ڷŴ�ȫ����
		/// ����Ѿ����ţ�ֻ�Ǹı䵱ǰ�����ٶ�Ϊ�����ٶȡ� 
		/// </summary>
		/// <param name="nPort"></param>
		/// <param name="hWnd">hWnd ������Ƶ�Ĵ��ھ��</param>
		/// <returns></returns>
		[DllImport("PlayCtrl.dll")]
		public static extern bool PlayM4_Play(int nPort, IntPtr hWnd);

		/// <summary>
		/// 6�� BOOL PlayM4_Stop(LONG nPort); 
		/// ���Ž���
		/// </summary>
		/// <param name="nPort"></param>
		/// <returns></returns>
		[DllImport("PlayCtrl.dll")]
		public static extern bool PlayM4_Stop(int nPort);

		/// <summary>
		/// 7�� BOOL PlayM4_Pause(LONG nPort,DWORD nPause); 
		/// ������ͣ/�ָ�
		/// </summary>
		/// <param name="nPort"></param>
		/// <param name="nPause">nPause=TRUE��ͣ������ָ�</param>
		/// <returns></returns>
		[DllImport("PlayCtrl.dll")]
		public static extern bool PlayM4_Pause(int nPort, bool nPause);

		/// <summary>
		/// 8�� BOOL PlayM4_Fast(LONG nPort); 
		/// ���ٲ��ţ�ÿ�ε��ý�ʹ��ǰ�����ٶȼӿ�һ����������4�Σ�Ҫ�ָ��������ŵ���PlayM4_Play()��
		/// �ӵ�ǰλ�ÿ�ʼ��������
		/// </summary>
		/// <param name="nPort"></param>
		/// <returns></returns>
		[DllImport("PlayCtrl.dll")]
		public static extern bool PlayM4_Fast(int nPort);

		/// <summary>
		/// 9�� BOOL PlayM4_Slow(LONG nPort); 
		/// ���ٲ��ţ�ÿ�ε��ý�ʹ��ǰ�����ٶ���һ����������4�Σ�Ҫ�ָ��������ŵ���PlayM4_Play()
		/// </summary>
		/// <param name="nPort"></param>
		/// <returns></returns>
		[DllImport("PlayCtrl.dll")]
		public static extern bool PlayM4_Slow(int nPort);

		/// <summary>
		/// 10��BOOL PlayM4_SetPlayPos(LONG nPort,float fRelativePos); 
		/// �����ļ�����ָ������λ�ã��ٷֱȣ��� 
		/// </summary>
		/// <param name="nPort"></param>
		/// <param name="fRelativePos">��Χ0-100%</param>
		/// <returns></returns>
		[DllImport("PlayCtrl.dll")]
		public static extern bool PlayM4_SetPlayPos(int nPort, float fRelativePos);

		/// <summary>
		/// 11��float PlayM4_GetPlayPos(LONG nPort); 
		/// ����ļ�����ָ������λ��
		/// </summary>
		/// <param name="nPort">��Χ0-100%</param>
		/// <returns></returns>
		[DllImport("PlayCtrl.dll")]
		public static extern float PlayM4_GetPlayPos(int nPort);

		/// <summary>
		/// 12��BOOL PlayM4_SetFileEndMsg(LONG nPort,HWND hWnd,UINT nMsg); 
		/// �����ļ�����ʱҪ���͵���Ϣ����2.4�濪ʼ�����ļ�������ʱ�������߳̽������Զ���������Ҫ
		/// �û���ֹͣ������Ӧ�ó������յ������Ϣ��Ҫ���ò��Ž�������PlayM4_Stop(nPort)�� 
		/// </summary>
		/// <param name="nPort"></param>
		/// <param name="hWnd">��Ϣ���͵Ĵ��ڡ� </param>
		/// <param name="nMsg">�û��Զ�����������Ϣ�������ŵ��ļ�����ʱ�û���hWnd���ڹ������յ������Ϣ������Ϣ�����е�wParam��������nPort��ֵ��</param>
		/// <returns></returns>
		[DllImport("PlayCtrl.dll")]
		public static extern bool PlayM4_SetFileEndMsg(int nPort, IntPtr hWnd, uint nMsg);

		/// <summary>
		/// 13��BOOL PlayM4_SetVolume(LONG nPort,WORD nVolume); 
		/// ���������������ڲ���֮ǰ���ã�����ֵ��FALSE�������õ�ֵ�����棬����Ϊ��������ʱ�ĳ�ʼ
		/// </summary>
		/// <param name="nPort"></param>
		/// <param name="nVolume">������ֵ����Χ0-0XFFFF</param>
		/// <returns></returns>
		[DllImport("PlayCtrl.dll")]
		public static extern bool PlayM4_SetVolume(int nPort, int nVolume);

		/// <summary>
		/// 14��BOOL PlayM4_PlaySound(LONG nPort);
		/// ��������ͬһʱ��ֻ����һ·��������������Ѿ��������򿪣����Զ��ر�ԭ���Ѿ��򿪵�������
		/// ע�⣺Ĭ������������ǹرյģ� 
		/// </summary>
		/// <param name="nPort"></param>
		/// <returns></returns>
		[DllImport("PlayCtrl.dll")]
		public static extern bool PlayM4_PlaySound(int nPort);

		/// <summary>
		/// 15��BOOL PlayM4_StopSound(); 
		/// �ر�����
		/// </summary>
		/// <returns></returns>
		[DllImport("PlayCtrl.dll")]
		public static extern bool PlayM4_StopSound();

		/// <summary>
		/// 16��BOOL  PlayM4_OpenStream(LONG nPort,PBYTE pFileHeadBuf,DWORD nSize,DWORD nBufPoolSize); 
		/// �����ӿڣ����ƴ��ļ���
		/// </summary>
		/// <param name="nPort"></param>
		/// <param name="pFileHeadBuf">�û��ӿ��ϵõ����ļ�ͷ���ݡ�</param>
		/// <param name="nSize">�ļ�ͷ���ȡ�</param>
		/// <param name="nBufPoolSize">���ò������д���������Ļ�������С����Χ��SOURCE_BUF_MIN~ SOURCE_BUF_MAX�� </param>
		/// <returns></returns>
		[DllImport("PlayCtrl.dll")]
//		public static extern bool PlayM4_OpenStream(int nPort, IntPtr pFileHeadBuf, ushort nSize, ushort nBufPoolSize);
        public static extern bool PlayM4_OpenStream(int nPort, ref byte[] pFileHeadBuf, uint nSize, uint nBufPoolSize);

		/// <summary>
		/// 17��BOOL PlayM4_InputData(LONG nPort,PBYTE pBuf,DWORD nSize); 
		/// ����ӿ��ϵõ��������ݣ�����֮������������ݡ�
		/// </summary>
		/// <param name="nPort"></param>
		/// <param name="pBuf">��������ַ</param>
		/// <param name="nSize">��������С</param>
		/// <returns>TURE,��ʾ�Ѿ��������ݡ�FALSE ��ʾʧ�ܣ�����û�����롣</returns>
		[DllImport("PlayCtrl.dll")]
        public static extern bool PlayM4_InputData(int nPort, ref byte[] pBuf, uint nSize);

		/// <summary>
		/// 18��BOOL PlayM4_CloseStream(LONG nPort); 
		/// �ر�������
		/// </summary>
		/// <param name="nPort"></param>
		/// <returns></returns>
		[DllImport("PlayCtrl.dll")]
		public static extern bool PlayM4_CloseStream(int nPort);

		/// <summary>
		/// 19��int PlayM4_GetCaps(); 
		/// ���Բ�������Ҫ��һЩϵͳ���� 
		/// ע�⣺����Կ�֧�������г�����ʾ���ܣ������󽵵�CPU�����ʡ�������ͼ����352*288��PAL����С��
		///      ����Կ���֧�ַŴ���С��������ʾ����Ҳʹ��352*288�� 
		/// </summary>
		/// <returns>
		/// 1~8λ�ֱ��ʾ������Ϣ��λ����TRUE��ʾ֧�֣��� 
		///    SUPPORT_DDRAW		֧��DIRECTDRAW�������֧�֣��򲥷������ܹ����� 
		///    SUPPORT_BLT			�Կ�֧��BLT�����������֧�֣��򲥷������ܹ����� 
		///    SUPPORT_BLTFOURCC	�Կ�BLT֧����ɫת���������֧�֣���������ʹ�������ʽ��RGBת����
		///    SUPPORT_BLTSHRINKX	�Կ�BLT֧��X����С�������֧�֣�ϵͳʹ�������ʽת����
		///    SUPPORT_BLTSHRINKY	�Կ�BLT֧��Y����С�������֧�֣�ϵͳʹ�������ʽת���� 
		///    SUPPORT_BLTSTRETCHX	�Կ�BLT֧��X��Ŵ������֧�֣�ϵͳʹ�������ʽת����
		///    SUPPORT_BLTSTRETCHY	�Կ�BLT֧��Y��Ŵ������֧�֣�ϵͳʹ�������ʽת���� 
		///    SUPPORT_SSE			CPU֧��SSEָ��,Intel Pentium3����֧��SSEָ�
		///    SUPPORT_MMX			CPU֧��MMXָ��� 
		/// </returns>
		[DllImport("PlayCtrl.dll")]
		public static extern int PlayM4_GetCaps();

		/// <summary>
		/// 20��DWORD PlayM4_GetFileTime(LONG nPort); 
		/// �õ��ļ��ܵ�ʱ�䳤�ȣ���λ��
		/// </summary>
		/// <param name="nPort"></param>
		/// <returns></returns>
		[DllImport("PlayCtrl.dll")]
		public static extern int PlayM4_GetFileTime(int nPort);

		/// <summary>
		/// 21��DWORD PlayM4_GetPlayedTime(LONG nPort); 
		/// �õ��ļ���ǰ���ŵ�ʱ�䣬��λ��
		/// </summary>
		/// <param name="nPort"></param>
		/// <returns></returns>
		[DllImport("PlayCtrl.dll")]
		public static extern ushort PlayM4_GetPlayedTime(int nPort);

		/// <summary>
		/// 22��DWORD PlayM4_GetPlayedFrames(LONG nPort); 
		/// �õ��Ѿ��������Ƶ֡��
		/// </summary>
		/// <param name="nPort"></param>
		/// <returns></returns>
		[DllImport("PlayCtrl.dll")]
		public static extern ushort PlayM4_GetPlayedFrames(int nPort);

		/// <summary>
		/// 23��BOOL PlayM4_OneByOne(LONG nPort); 
		/// ��֡���š�Ҫ�ָ��������ŵ���PlayM4_Play()
		/// </summary>
		/// <param name="nPort"></param>
		/// <returns></returns>
		[DllImport("PlayCtrl.dll")]
		public static extern bool PlayM4_OneByOne(int nPort);

		/// <summary>
		/// 24��BOOL PlayM4_SetDecCallBack(LONG nPort,void (CALLBACK* DecCBFun)(long nPort,char * pBuf,long nSize,FRAME_INFO * pFrameInfo, long nReserved1,long nReserved2)); 
		/// ���ûص��������滻�������е���ʾ���֣����û��Լ�������ʾ���ú�����PlayM4_Play()֮ǰ���ã�
		/// ��PlayM4_Stop()ʱ�Զ�ʧЧ���´ε���PlayM4_Play()֮ǰ��Ҫ�������á�
		/// ע����벿�ֲ������ٶȣ�ֻҪ�û��ӻص������з��أ��������ͻ������һ�������ݡ�
		/// ������ܵ�ʹ����Ҫ�û�����Ƶ��ʾ�������������㹻���˽⣬����������ʹ�ã��й�֪ʶ�����directx��������
		/// </summary>
		/// <param name="nPort"></param>
		/// <param name="dcbf">DecCBFun�ص�����ָ�룬����ΪNULL</param>
		/// <returns></returns>
		[DllImport("PlayCtrl.dll")]
		public static extern bool PlayM4_SetDecCallBack(int nPort, DecCBFun dcbf);

		/// <summary>
		/// 25��BOOL PlayM4_SetDisplayCallBack(LONG nPort,void (CALLBACK* DisplayCBFun)(long nPort,char * pBuf,long nSize,long nWidth,long nHeight,long nStamp,long nType,long nReceaved)); 
		/// ����ץͼ�ص�������ע��Ҫ���췵�أ����Ҫֹͣ�ص������԰ѻص�����ָ��DisplayCBFun��ΪNULL��
		/// һ�����ûص���������һֱ��Ч��ֱ�������˳����ú����������κ�ʱ����á� 
		/// </summary>
		/// <param name="nPort"></param>
		/// <param name="dcbf">DisplayCBFunץͼ�ص�����������ΪNULL��</param>
		/// <returns></returns>
		[DllImport("PlayCtrl.dll")]
		public static extern bool PlayM4_SetDisplayCallBack(int nPort, DisplayCBFun dcbf);

		/// <summary>
		/// 26��BOOL PlayM4_ConvertToBmpFile(char * pBuf,long nSize,long nWidth,long nHeight,long nType,char *sFileName);
		/// ��ץͼ�õ���ͼ�����ݱ����BMP�ļ���ת������ռ�õ�cpu��Դ���������Ҫ����ͼƬ����Ҫ����
		/// </summary>
		/// <param name="pBuf">ͬץͼ�ص������еĲ���</param>
		/// <param name="nSize">ͬץͼ�ص������еĲ���</param>
		/// <param name="nWidth">ͬץͼ�ص������еĲ���</param>
		/// <param name="nHeight">ͬץͼ�ص������еĲ���</param>
		/// <param name="nType">ͬץͼ�ص������еĲ���</param>
		/// <param name="sFileName">Ҫ������ļ����������BMP��Ϊ�ļ���չ����</param>
		/// <returns></returns>
		[DllImport("PlayCtrl.dll")]
		public static extern bool PlayM4_ConvertToBmpFile(IntPtr pBuf, int nSize, int nWidth, int nHeight, int nType, string sFileName);

		/// <summary>
		/// 27��DWORD PlayM4_GetFileTotalFrames(LONG nPort); 
		/// �õ��ļ��е���֡���� 
		/// </summary>
		/// <param name="nPort"></param>
		/// <returns>�ļ��е���֡���� </returns>
		[DllImport("PlayCtrl.dll")]
		public static extern int PlayM4_GetFileTotalFrames(int nPort);

		/// <summary>
		/// 28��DWORD PlayM4_GetCurrentFrameRate(LONG nPort); 
		/// �õ���ǰ�����б���ʱ��֡�ʡ�
		/// </summary>
		/// <param name="nPort"></param>
		/// <returns>��ǰ�����б���ʱ��֡�ʡ� </returns>
		[DllImport("PlayCtrl.dll")]
		public static extern ushort PlayM4_GetCurrentFrameRate(int nPort);

		/// <summary>
		/// 29��DWORD PlayM4_GetPlayedTimeEx(LONG nPort); 
		/// �õ��ļ���ǰ���ŵ�ʱ�䣬��λ����
		/// </summary>
		/// <param name="nPort"></param>
		/// <returns></returns>
		[DllImport("PlayCtrl.dll")]
		public static extern ushort PlayM4_GetPlayedTimeEx(int nPort);

		/// <summary>
		/// 30��BOOL PlayM4_SetPlayedTimeEx(LONG nPort,DWORD nTime); 
		/// ����ʱ�������ļ�����λ�ã��˽ӿڱ�PlayM4_SetPlayPos��ʱ���������ʱ�������Ʋ��Ž�����
		/// ����PlayM4_GetPlayedTime(Ex)���ʹ�ã�����ô����ʹ������ƽ�������� 
		/// </summary>
		/// <param name="nPort"></param>
		/// <param name="nTime">�����ļ�����λ�õ�ָ��ʱ�䡣��λ���롣</param>
		/// <returns></returns>
		[DllImport("PlayCtrl.dll")]
		public static extern bool PlayM4_SetPlayedTimeEx(int nPort, int nTime);

		/// <summary>
		/// 31��DWORD PlayM4_GetCurrentFrameNum(LONG nPort); 
		/// �õ���ǰ���ŵ�֡��š���PlayM4_GetPlayedFrames()���ܹ������֡��������ļ�����λ��
		/// �����ı䣬��ô�����������ķ���ֵӦ�÷ǳ��ӽ�������������ʧ���ݡ� 
		/// </summary>
		/// <param name="nPort"></param>
		/// <returns></returns>
		[DllImport("PlayCtrl.dll")]
		public static extern int PlayM4_GetCurrentFrameNum(int nPort);

		/// <summary>
		/// 32��BOOL PlayM4_SetStreamOpenMode(LONG nPort,DWORD nMode); 
		/// ���������ŵ�ģʽ�������ڲ���֮ǰ���á� 
		/// ע�⣺2.2���Ժ��������ͣ����ţ����ţ���֡���Ų����� 
		/// </summary>
		/// <param name="nPort"></param>
		/// <param name="nMode">STREAME_REALTIMEʵʱģʽ��Ĭ�ϣ���STREAME_FILE�ļ�ģʽ��</param>
		/// <returns></returns>
		[DllImport("PlayCtrl.dll")]
		public static extern bool PlayM4_SetStreamOpenMode(int nPort, ushort nMode);

		/// <summary>
		/// 33��DWORD PlayM4_GetFileHeadLength(); 
		/// �õ���ǰ�汾�������ܲ��ŵ��ļ����ļ�ͷ���ȡ���ҪӦ��������������STREAME_FILEģʽ�¡�
		/// �Ա�����ļ�ͷ��ΪPlayM4_OpenStream()����������� 
		/// <example>
		/// CFile m_TestFile;
		/// void Start() 
		/// {
		///		//����ļ�ͷ���ȣ� 
		///		DWORD nLength= PlayM4_GetFileHeadLength(); 
		///		PBYTE pFileHead=new BYTE[nLength]; 
		///		//���ļ��� 
		///		m_TestFile.Open("test.mp4 ", CFile::modeRead,NULL); 
		///		m_TestFile.Read(pFileHead,nLength); 
		///		//����ģʽ 
		///		PlayM4_SetStreamOpenMode(0,STREAME_FILE); 
		///		//�����ӿ� 
		///		if(!PlayM4_OpenStream(0,pFileHead, nLength,1024*100)) 
		///		{ 
		///			m_strPlayFileName=""; 
		///			MessageBox("�ļ��򲻿�"); 
		///		} 
		///		//���� 
		///		m_bPlaying = PlayM4_Play( 0, m_hWnd); 
		///		delete []pFileHead; 
		/// }  
		/// /////////////////////////////////////////////////////////////////////////////// 
		/// void InputData() 
		/// {
		///		BYTE pBuf[4096]; 
		///		m_TestFile.Read(pBuf,sizeof(pBuf)); 
		///		while(!PlayM4_InputData(0,pBuf,sizeof(pBuf))) 
		///		{ 
		///			if(!m_bPlaying) 
		///			break;//����Ѿ�ֹͣ���ţ����˳��� 
		///			TRACE("SLEEEP \n"); 
		///			Sleep(5); 
		///		} 
		///  } 
		/// </example>
		/// </summary>
		/// <returns>�˰汾��������Ӧ���ļ�ͷ�ĳ��ȡ� </returns>
		[DllImport("PlayCtrl.dll")]
		public static extern ushort PlayM4_GetFileHeadLength();

		/// <summary>
		/// 34��DWORD PlayM4_GetSdkVersion(); 
		/// �õ���ǰ������sdk�İ汾�ź�build�š����ֻ���޸�bug������ֻ����build�š�
		/// </summary>
		/// <returns>��16λ��ʾ��ǰ��build�š�9~16λ��ʾ���汾�ţ�1~8λ��ʾ�ΰ汾�š��磺����ֵ0x06040105 ��ʾ��build����0604���汾��1.5�� </returns>
		[DllImport("PlayCtrl.dll")]
		public static extern bool PlayM4_GetSdkVersion();

		/// <summary>
		/// 35��DWORD PlayM4_GetLastError(LONG nPort) 
		/// ��õ�ǰ����Ĵ����롣�û�Ӧ���ڵ���ĳ������ʧ��ʱ�����ô˺����Ի�ô������ϸ��Ϣ�� 
		/// </summary>
		/// <param name="nPort"></param>
		/// <returns></returns>
		[DllImport("PlayCtrl.dll")]
		public static extern int PlayM4_GetLastError(int nPort);

		/// <summary>
		/// 36��BOOL PlayM4_RefreshPlay(LONG nPort)
		/// ˢ����ʾ�����û���ͣʱ���ˢ���˴��ڣ��򴰿��е�ͼ����Ϊˢ�¶���ʧ����ʱ��������ӿڿ�
		/// �����°�ͼ����ʾ������ֻ������ͣ�͵�֡����ʱ�Ż�ִ�У� ���������ֱ�ӷ��ء� 
		/// </summary>
		/// <param name="nPort"></param>
		/// <returns></returns>
		[DllImport("PlayCtrl.dll")]
		public static extern bool PlayM4_RefreshPlay(int nPort);

		/// <summary>
		/// 37��BOOL PlayM4_SetOverlayMode(LONG nPort,BOOL bOverlay,COLORREF colorKey) 
		/// ����OVERLAYģʽ��ʾ���档��һ���Կ���ͬһʱ��ֻ����һ��OVERLAY���洦�ڻ״̬��
		/// �����ʱϵͳ���Ѿ��г���ʹ����OVERLAY����ô�������Ͳ����ٴ���OVERLAY���棬������
		/// ������Off_Screen���棬��������FALSE��һЩ���õĲ��������Լ����ǿ���Ԥ��������ʹ����
		/// overlay���档ͬ�������������ʹ����OVERLAY���棬��ô�������ĳ��򽫲���ʹ��OVERLAY
		/// ���棬�ر�ע�⣬���ǵĿ���Ԥ��ʱ����ҲҪʹ��OVERLAY(�û�������)������ȴ򿪲���������
		/// ��ʹ����OVERLAY����������Ԥ������ôԤ��������Ϊ�ò���OVERLAY��ʧ�ܡ�ʹ��OVERLAY
		/// ģʽ���ŵ��ǣ��󲿷ݵ��Կ���֧��OVERLAY����һЩ��֧��BLTӲ�����ź���ɫת�����Կ��� 
		/// (��SISϵ���Կ�)ʹ��OVERLAYģʽ��OVERLAYģʽ�µ����ź���ɫת�����Կ�֧�֣������Դ�
		/// ���Сcpu�����ʲ���߻��������������������ź���ɫת������ȱ���ǣ�ֻ����һ·������ʹ�á�
		/// �����ñ�����PLAY֮ǰʹ�ã�������Ҫ����͸��ɫ��
		/// </summary>
		/// <param name="nPort"></param>
		/// <param name="bOverlay">���ΪTRUE,��ʾ�����ȳ���ʹ��OVERLAYģʽ�����������ʹ������ģʽ�����ΪFALSE,�򲻽���OVERLAYģʽ�ĳ��ԡ� </param>
		/// <param name="colorKey">
		///     �û����õ�͸��ɫ��͸��ɫ�൱��һ��͸��Ĥ����ʾ�Ļ���ֻ�ܴ���������ɫ������������ɫ��
		///     ��ס��ʾ�Ļ��档�û�Ӧ������ʾ������Ϳ��������ɫ���������ܿ�����ʾ���档һ��Ӧ��ʹ
		///     ��һ�ֲ����õ���ɫ��Ϊ͸��ɫ������һ��˫�ֽ�ֵ0x00rrggbb,����ֽ�Ϊ0���������ֽڷֱ��ʾr,g,b��ֵ��
		/// </param>
		/// <returns></returns>
		[DllImport("PlayCtrl.dll")]
		public static extern bool PlayM4_SetOverlayMode(int nPort, bool bOverlay,int colorKey);

		/// <summary>
		/// 38��BOOL PlayM4_GetPictureSize(LONG nPort,LONG *pWidth,LONG *pHeight); 
		/// ���������ԭʼͼ��Ĵ�С�����ݴ˴�С��������ʾ���ڵ����򣬿��Բ����Կ������Ź�����
		/// ������Щ��֧��Ӳ�����ŵ��Կ���˵�ǳ����á� 
		/// </summary>
		/// <param name="nPort"></param>
		/// <param name="pWidth">ԭʼͼ��Ŀ���PAL��CIF��ʽ����352��</param>
		/// <param name="pHeight">ԭʼͼ��ĸߡ���PAL��CIF��ʽ����288��</param>
		/// <returns></returns>
		[DllImport("PlayCtrl.dll")]
        public static extern bool PlayM4_GetPictureSize(int nPort, out int pWidth, out int pHeight);

		/// <summary>
		/// 39��BOOL PlayM4_SetPicQuality(LONG nPort,BOOL bHighQuality); 
		/// ����ͼ�������������óɸ�����ʱ����Ч���ã���CPU�����ʸߡ���֧�ֶ�·����ʱ������
		/// ��Ϊ���������Խ���CPU�����ʣ���ĳ·�Ŵ󲥷�ʱ����·���óɸ��������Դﵽ�õĻ���Ч����
		/// </summary>
		/// <param name="nPort"></param>
		/// <param name="bHighQuality">����1ʱͼ�������������0ʱ��������Ĭ��ֵ����</param>
		/// <returns></returns>
		[DllImport("PlayCtrl.dll")]
		public static extern bool PlayM4_SetPicQuality(int nPort, bool bHighQuality);

		/// <summary>
		/// 40��BOOL PlayM4_PlaySoundShare(LONG nPort); 
		/// �Թ���ʽ����������ֻ�ܲ��ű�·��������ȥ�ر�����·��������
		/// ע�⣺WIN98����֮ǰ�汾����ϵͳ��֧�ִ�����������豸����������Ѿ���ʹ�ã���ô�˺���������FALSE��
		/// </summary>
		/// <param name="nPort"></param>
		/// <returns></returns>
		[DllImport("PlayCtrl.dll")]
		public static extern bool PlayM4_PlaySoundShare(int nPort);

		/// <summary>
		/// 41��BOOL PlayM4_StopSoundShare(LONG nPort); 
		/// �Թ���ʽ�ر�������PlayM4_PlaySound()��PlayM4_StopSound()���Զ�ռ��ʽ���������ġ�
		/// ע�⣺��ͬһ�������У�����ͨ������ʹ����ͬ�ķ�ʽ���Ż�ر�������
		/// </summary>
		/// <param name="nPort"></param>
		/// <returns></returns>
		[DllImport("PlayCtrl.dll")]
		public static extern bool PlayM4_StopSoundShare(int nPort);
		
		#endregion

		#region ����Ϊ2.4�������ӿ�
		/// <summary>
		/// 42��LONG PlayM4_GetStreamOpenMode(LONG nPort); 
		/// �����ģʽ���͡� 
		/// </summary>
		/// <param name="nPort"></param>
		/// <returns>STREAME_REALTIME��STREAME_FILE</returns>
		[DllImport("PlayCtrl.dll")]
		public static extern int PlayM4_GetStreamOpenMode(int nPort);

		/// <summary>
		/// 43��LONG PlayM4_GetOverlayMode(LONG nPort); 
		/// ��鵱ǰ�������Ƿ�ʹ����OVERLAYģʽ
		/// </summary>
		/// <param name="nPort"></param>
		/// <returns>0����ʾû��ʹ��OVERLAY��1����ʾʹ����OVERLAY���档</returns>
		[DllImport("PlayCtrl.dll")]
		public static extern int PlayM4_GetOverlayMode(int nPort);

		/// <summary>
		/// 44��COLORREF PlayM4_GetColorKey(LONG nPort); 
		/// ���OVERLAY����ʹ�õ�͸��ɫ
		/// </summary>
		/// <param name="nPort"></param>
		/// <returns>��ɫֵ</returns>
		[DllImport("PlayCtrl.dll")]
        public static extern uint PlayM4_GetColorKey(int nPort);

		/// <summary>
		/// 45��WORD PlayM4_GetVolume(LONG nPort); 
		/// ��õ�ǰ���õ�����
		/// </summary>
		/// <param name="nPort">����ֵ</param>
		/// <returns></returns>
		[DllImport("PlayCtrl.dll")]
        public static extern ushort PlayM4_GetVolume(int nPort);

		/// <summary>
		/// 46��BOOL PlayM4_GetPictureQuality(LONG nPort,BOOL *bHighQuality); 
		/// ��õ�ǰͼ������
		/// </summary>
		/// <param name="nPort"></param>
		/// <param name="bHighQuality">1��ʾ��������0��ʾ�������� </param>
		/// <returns></returns>
		[DllImport("PlayCtrl.dll")]
		public static extern bool PlayM4_GetPictureQuality(int nPort, out bool bHighQuality);

		/// <summary>
		/// 47��DWORD PlayM4_GetSourceBufferRemain(LONG nPort); 
		/// ���������ģʽ��Դ����ʣ������ 
		/// </summary>
		/// <param name="nPort"></param>
		/// <returns>��ǰԴ����Ĵ�С��BYTE��</returns>
		[DllImport("PlayCtrl.dll")]
		public static extern ushort PlayM4_GetSourceBufferRemain(int nPort);

		/// <summary>
		/// 48��BOOL PlayM4_ResetSourceBuffer(LONG nPort); 
		/// ���������ģʽ��Դ������ʣ������
		/// </summary>
		/// <param name="nPort"></param>
		/// <returns></returns>
		[DllImport("PlayCtrl.dll")]
		public static extern bool PlayM4_ResetSourceBuffer(int nPort);

		/// <summary>
		/// 49��BOOL PlayM4_SetSourceBufCallBack(LONG nPort,DWORD nThreShold,void (CALLBACK * SourceBufCallBack)(long nPort,DWORD nBufSize,DWORD dwUser,void*pResvered),DWORD dwUser,void *pReserved); 
		/// ����Դ��������ֵ��ʣ������С�ڵ��ڷ�ֵʱ�Ļص�����ָ��
		/// </summary>
		/// <param name="nPort"></param>
		/// <param name="nThreShold">��ֵ</param>
		/// <param name="sbcb">�ص�����ָ��</param>
		/// <param name="dwUser">�û�����</param>
		/// <param name="pReserved">��������</param>
		/// <returns></returns>
		[DllImport("PlayCtrl.dll")]
		public static extern bool PlayM4_SetSourceBufCallBack(int nPort, ushort nThreShold, SourceBufCallBack sbcb, ushort dwUser, IntPtr pReserved);

		/// <summary>
		/// 50��BOOL PlayM4_ResetSourceBufFlag(LONG nPort); 
		/// ���ûص���־λΪ��Ч״̬����ģʽ��Դ���嵽�﷧ֵʱ������û������˻ص���������һ����ص���
		/// �û���Ҫ���ûص���־λ����ܻص�������ÿ�λص����־λ������Ϊ��Ч���û��������ʵ���ʱ�����ûص���־��
		/// ����ӿڵ���ҪĿ���Ƿ�ֹ�ظ��ص��������ڷ�ֵ�����ڶ���Ϊ�û���������ʱ��������Ҳ�ڶ������ݣ���
		/// ��ʼ��״̬�£��ص���־λ����Ч�ġ� 
		/// </summary>
		/// <param name="nPort"></param>
		/// <returns></returns>
		[DllImport("PlayCtrl.dll")]
		public static extern bool PlayM4_ResetSourceBufFlag(int nPort);

		/// <summary>
		/// 51��BOOL PlayM4_SetDisplayBuf(LONG nPort,DWORD nNum); 
		/// ���ò��Ż���������������ͼ�񻺳�������С������������Ƚ���Ҫ����ֱ��Ӱ�첥�ŵ������Ժ���ʱ�ԡ�
		/// ��һ����Χ�ڻ���Խ��Խ������ͬʱ��ʱԽ���ڲ����ļ�ʱ�û���ÿ��Կ��ǿ��󻺳壨����ڴ��㹻�󣩣�
		/// ���ǵ�Ĭ��ֵ��15��֡������25֡/�������¼�0.6������ݡ��ڲ�����ʱ���ǵ�Ĭ��ֵ��10(֡)��
		/// ����û�׷�������ʱ��С�����Կ����Ե���С���ֵ�� ���������nNum ���Ż�������󻺳�֡����
		/// ��Χ��MIN_DIS_FRAMES ~MAX_DIS_FRAMES��һ֡352*288ͼ��������ڴ���Сֵ�� 352*288*3/2��Լ150K ��
		/// ���ֵ��352*288*4��Լ405K�� 
		/// </summary>
		/// <param name="nPort"></param>
		/// <param name="nNum"></param>
		/// <returns></returns>
		[DllImport("PlayCtrl.dll")]
		public static extern bool PlayM4_SetDisplayBuf(int nPort, ushort nNum);

		/// <summary>
		/// ��ò��Ż�������󻺳��֡��
		/// 
		/// 52��DWORD  PlayM4_GetDisplayBuf(LONG nPort); 
		/// </summary>
		/// <param name="nPort"></param>
		/// <returns>���Ż�������󻺳�֡��</returns>
		[DllImport("PlayCtrl.dll")]
		public static extern ushort PlayM4_GetDisplayBuf(int nPort);

		/// <summary>
		/// 53��BOOL PlayM4_SetFileRefCallBack(LONG nPort,  void (__stdcall *pFileRefDone) (DWORD nPort,DWORD nUser),DWORD nUser); 
		/// ���ûص�����ָ�룬�ļ�����������ص���Ϊ�������ļ���׼ȷ���ٵĶ�λ���������ļ��򿪵�ʱ�������ļ�������
        /// ������̺�ʱ�Ƚϳ�����Լÿ�봦��40M���ҵ����ݣ���Ҫ����Ϊ��Ӳ�̶����ݱȽ�����
        /// ���������Ĺ������ں�̨��ɣ���Ҫʹ�������ĺ���Ҫ�ȴ�������̽������������ӿڲ����ܵ�Ӱ�졣 
		/// </summary>
		/// <param name="nPort"></param>
		/// <param name="frd">�ص�����ָ��</param>
		/// <param name="nUser">�û�����</param>
		/// <returns></returns>
		[DllImport("PlayCtrl.dll")]
		public static extern bool PlayM4_SetFileRefCallBack(int nPort, FileRefDone frd, ushort nUser);

		/// <summary>
		/// 54��BOOL PlayM4_OneByOneBack(LONG nPort); 
		/// ��֡�طš�ÿ����һ�ε���һ֡���˺����������ļ���������֮����ܵ��á�
		/// ��ȻSetCurrentFrameNum()Ҳ����������֡���ˣ���Ч��Ҫ�ͺܶࡣ�ڵ�֡�ط�ʱ���ǽ���ʹ������ӿڡ�
		/// </summary>
		/// <param name="nPort"></param>
		/// <returns></returns>
		[DllImport("PlayCtrl.dll")]
		public static extern bool PlayM4_OneByOneBack(int nPort);

		/// <summary>
		/// 55��BOOL PlayM4_SetCurrentFrameNum(LONG nPort,DWORD nFrameNum); 
		/// ���õ�ǰ���Ų���λ�õ�ָ��֡�ţ�����֡������λ����λ�á��˺����������ļ���������֮����ܵ���
		/// </summary>
		/// <param name="nPort"></param>
		/// <param name="nFrameNum">֡���</param>
		/// <returns></returns>
		[DllImport("PlayCtrl.dll")]
		public static extern bool PlayM4_SetCurrentFrameNum(int nPort, int nFrameNum);

		/// <summary>
		/// 56��BOOL PlayM4_GetKeyFramePos(LONG nPort,DWORD nValue, DWORD nType, PFRAME_POS pFramePos); 
		/// ����ָ��λ��֮ǰ�Ĺؼ�֡λ�á�ͼ��������ӹؼ�֡��ʼ������û�������ļ����Ǵ�
		/// �ؼ�֡��ʼ�ģ���ô����һ���ؼ�֮֡ǰ�����ݻᱻ���ԡ�����û�Ҫ��ȡ�ļ��е�һ�����ݣ�
		/// ��Ӧ�ÿ��Ǵӹؼ�֡��ʼ��ȡ������λ�����ϵ������ඪʧ3֡���ݡ� 
		/// </summary>
		/// <param name="nPort"></param>
		/// <param name="nValue">��ǰλ�ã�������ʱ���֡�ţ�������nTypeָ����</param>
		/// <param name="nType">ָ��nValue�����͡����nType ��BY_FRAMENUM��nValue��ʾ֡��BY_FRAMTIME����nValue��ʾʱ�䣬��λms�� </param>
		/// <param name="pFramePos">���ҵ��Ĺؼ�֡���ļ�λ�ã�֡��ţ�ʱ����Ϣ�� </param>
		/// <returns></returns>
		[DllImport("PlayCtrl.dll")]
		public static extern bool PlayM4_GetKeyFramePos(int nPort, ushort nValue, ushort nType, ref PFRAME_POS pFramePos);

		/// <summary>
		/// 57��BOOL PlayM4_GetNextKeyFramePos(LONG nPort,DWORD nValue, DWORD nType, PFRAME_POS pFramePos);
		/// ����ָ��λ��֮��Ĺؼ�֡λ�á�
		/// </summary>
		/// <param name="nPort"></param>
		/// <param name="nValue">��ǰλ�ã�������ʱ���֡�ţ�������nTypeָ����</param>
		/// <param name="nType">ָ��nValue�����͡����nType ��BY_FRAMENUM��nValue��ʾ֡�ţ����nType ��Y_FRAMTIME����nValue��ʾʱ�䣬��λms��</param>
		/// <param name="pFramePos">���ҵ��Ĺؼ�֡���ļ�λ�ã�֡��ţ�ʱ����Ϣ��</param>
		/// <returns></returns>
		[DllImport("PlayCtrl.dll")]
		public static extern bool PlayM4_GetNextKeyFramePos(int nPort, ushort nValue, ushort nType, ref PFRAME_POS pFramePos);

		/// <summary>
		/// 58��BOOL PlayM4_ThrowBFrameNum(LONG nPort,DWORD nNum); 
		/// ���ò�����B֡֡����������B֡�����Լ�СCPU�����ʣ����������û��B֡����ô��
		/// �����ֵ�����������á����ڿ��ٲ��ţ���֧�ֶ�·��CPU������̫�ߵ�����¿��Կ���ʹ�á� 
		/// </summary>
		/// <param name="nPort"></param>
		/// <param name="nNum">������B֡��֡����nNum �������ǵ�DS-400XMϵ�а忨�ɼ����ļ���nNum��Χ��0~2��</param>
		/// <returns></returns>
		[DllImport("PlayCtrl.dll")]
		public static extern bool PlayM4_ThrowBFrameNum(int nPort, int nNum);

		///////////////////////////////////////////////////////////////////////////////////////////////
		//ע�⣺59~64���������ӿڣ���Ϊ֧�ֶ��Կ������ӵġ�Windows98,Windows2000��Windows2000֮���
		//		����ϵͳ��֧�ֶ��Կ�������Ҫ��װDirectX6.0����߰汾������û�����֧�ֶ��Կ����������⼸����
		//		�ڿ��Բ��迼�ǡ����ڶ��Կ��ı����ο�Microsoft sdk����ĵ�"Multiple-Monitor Systems"
		///////////////////////////////////////////////////////////////////////////////////////////////
		/// <summary>
		/// 59��BOOL PlayM4_InitDDrawDevice(); 
		/// ö��ϵͳ�е���ʾ�豸��
		/// </summary>
		/// <returns></returns>
		[DllImport("PlayCtrl.dll")]
		public static extern bool PlayM4_InitDDrawDevice();

		/// <summary>
		/// 60��void PlayM4_ReleaseDDrawDevice(); 
		/// �ͷ�ö����ʾ�豸�Ĺ����з������Դ��
		/// </summary>
		[DllImport("PlayCtrl.dll")]
		public static extern void PlayM4_ReleaseDDrawDevice();

		/// <summary>
		/// 61��DWORD PlayM4_GetDDrawDeviceTotalNums(); 
		/// ���ϵͳ����windows����󶨵��ܵ���ʾ�豸��Ŀ��������Ҫ��ָ�Կ���
		/// </summary>
		/// <returns>
		///     �������0�����ʾϵͳ��ֻ������ʾ�豸���������1�����ʾϵͳ�а�װ�˶���Կ�
		///     ��ֻ��һ���Կ���Windows����󶨡���������ֵ�����ʾϵͳ��������󶨵��Կ���Ŀ���ڶ��Կ�
		///     ��ϵͳ�п���ͨ��������ʾ���ԣ���ָ������һ���Կ���Ϊ����ʾ�豸�� 
		/// </returns>
		[DllImport("PlayCtrl.dll")]
		public static extern int PlayM4_GetDDrawDeviceTotalNums();

		/// <summary>
		/// 62��BOOL PlayM4_SetDDrawDevice(LONG nPort,DWORD nDeviceNum);
		/// ���ò��Ŵ���ʹ�õ��Կ���ע�⣺�ô��ڱ����ڸ��Կ�����Ӧ�ļ������ϲ�����ʾ���Ż��档
		/// </summary>
		/// <param name="nPort"></param>
		/// <param name="nDeviceNum">��ʾ�豸���豸�ţ������0�����ʾʹ������ʾ�豸��</param>
		/// <returns></returns>
		[DllImport("PlayCtrl.dll")]
		public static extern bool PlayM4_SetDDrawDevice(int nPort, int nDeviceNum);

		/// <summary>
		/// 63��BOOL PlayM4_GetDDrawDeviceInfo(DWORD nDeviceNum,LPSTR lpDriverDescription,DWORD nDespLen,LPSTR lpDriverName ,DWORD nNameLen,HMONITOR *hhMonitor); 
		/// �õ�ָ���Կ��ͼ�������Ϣ
		/// </summary>
		/// <param name="nDeviceNum">��ʾ�豸���豸�ţ������0�����ʾ����ʾ�豸��</param>
		/// <param name="lpDriverDescription">�����������ʾ�豸��������Ϣ�� </param>
		/// <param name="nDespLen">��ʾlpDriverDescription�ѷ���ռ�Ĵ�С����λbyte��</param>
		/// <param name="lpDriverName">�����������ʾ�豸���豸���� </param>
		/// <param name="nNameLen">��ʾlpDriverName�ѷ���ռ�Ĵ�С����λbyte��</param>
		/// <param name="hhMonitor">
		///		��ʾ�豸ʹ�õļ����������ͨ��Windows API ����GetMonitorInfo�����Եõ���ϸ��Ϣ�����û���λ����λ�á�
		///     ע�⣺HMONITOR���� ����_WIN32_WINNT >= 0x0500ʱ���ڡ�windef.h��ͷ�ļ��ж��壬
		///		�����ڡ�Multimon.H���ж��壬����û��ڱ���������Ҳ��������Ͷ��壬���԰�����Ӧ��ͷ�ļ��� 
		/// </param>
		/// <returns></returns>
		[DllImport("PlayCtrl.dll")]
        public static extern bool PlayM4_GetDDrawDeviceInfo(int nDeviceNum, [MarshalAs(UnmanagedType.LPStr)] string lpDriverDescription, ushort nDespLen, [MarshalAs(UnmanagedType.LPStr)] string lpDriverName, ushort nNameLen, IntPtr hhMonitor);

		/// <summary>
		/// 64��int PlayM4_GetCapsEx(DWORD nDDrawDeviceNum);
		/// ���ָ����ʾ�豸��ϵͳ��Ϣ��֧�ֶ��Կ���
		/// </summary>
		/// <param name="nDDrawDeviceNum">ָ����ʾ�豸���豸�ţ������0�����ʾ����ʾ�豸��</param>
		/// <returns></returns>
		[DllImport("PlayCtrl.dll")]
		public static extern int PlayM4_GetCapsEx(int nDDrawDeviceNum);

		/// <summary>
		/// 65��BOOL PlayM4_SetDisplayType(LONG nPort,LONG nType);
		/// ������ʾ��ģʽ����С������ʾʱ������DISPLAY_QUARTER ���Լ�С�Կ����������Ӷ�
		/// ֧�ָ���·��ʾ����������ʾ�������½����������ʹ�����ʾʱӦ��ʹ��DISPLAY_NORMAL��
		/// </summary>
		/// <param name="nPort"></param>
		/// <param name="nType">nType ����ģʽ��DISPLAY_NORMAL��DISPLAY_QUARTER��</param>
		/// <returns></returns>
		[DllImport("PlayCtrl.dll")]
		public static extern bool PlayM4_SetDisplayType(int nPort, int nType);

		/// <summary>
		/// 66��long PlayM4_GetDisplayType(LONG nPort);
		/// ���Ŀǰ���õ���ʾģʽ��
		/// </summary>
		/// <param name="nPort"></param>
		/// <returns>DISPLAY_NORMAL �� DISPLAY_QUARTER</returns>
		[DllImport("PlayCtrl.dll")]
		public static extern int PlayM4_GetDisplayType(int nPort);

		/// <summary>
		/// 67��BOOL __stdcall PlayM4_SetDecCBStream(LONG nPort,DWORD nStream);
		/// ���ý���ص��������͡�
		/// </summary>
		/// <param name="nPort"></param>
		/// <param name="nStream">1��Ƶ����2��Ƶ����3������</param>
		/// <returns></returns>
		[DllImport("PlayCtrl.dll")]
		public static extern bool PlayM4_SetDecCBStream(int nPort, ushort nStream);

		/// <summary>
		/// 68��BOOL __stdcall PlayM4_SetDisplayRegion(LONG nPort,DWORD nRegionNum, RECT *pSrcRect, HWND hDestWnd, BOOL bEnable); 
		/// ���û�������ʾ���򡣿������ֲ��Ŵ���ʾ��
		/// </summary>
		/// <param name="nPort"></param>
		/// <param name="nRegionNum">��ʾ������ţ�0~(MAX_DISPLAY_WND-1)��nRegionNum���nRegionNumΪ0��
		/// ��ʾ����Ҫ��ʾ����(PlayM4_Play�����õĴ���)�������ã�������hDestWnd��bEnable�����á�</param>
		/// <param name="pSrcRect">������Ҫ��ʾ��ԭʼͼ���ϵ������磺���ԭʼͼ����352*288��
		/// ��ôpSrcRect�����õķ�Χֻ���ڣ�0��0��352��288��֮�С����pSrcRect=NULL,����ʾ����ͼ��</param>
		/// <param name="hDestWnd">������ʾ���ڡ����������Ĵ����Ѿ����ù����򿪹�������ô�ò��������ԡ�</param>
		/// <param name="bEnable">�򿪣����ã���ر���ʾ����</param>
		/// <returns></returns>
		[DllImport("PlayCtrl.dll")]
		public static extern bool PlayM4_SetDisplayRegion(int nPort, ushort nRegionNum, ref Rectangle pSrcRect, IntPtr hDestWnd, bool bEnable);

		/// <summary>
		/// 69��BOOL __stdcall PlayM4_RefreshPlayEx(LONG nPort,DWORD nRegionNum); 
		/// ˢ����ʾ��ͬ36��Ϊ֧��PlayM4_SetDisplayRegion������һ�������� 
		/// </summary>
		/// <param name="nPort"></param>
		/// <param name="nRegionNum">��ʾ������š�</param>
		/// <returns></returns>
		[DllImport("PlayCtrl.dll")]
		public static extern bool PlayM4_RefreshPlayEx(int nPort, ushort nRegionNum);

		/// <summary>
		/// 70��BOOL __stdcall PlayM4_SetDDrawDeviceEx(LONG nPort,DWORD nRegionNum,DWORD nDeviceNum);
		/// ���ò��Ŵ���ʹ�õ��Կ���ͬ62��Ϊ֧��PlayM4_SetDisplayRegion������һ��������
		/// </summary>
		/// <param name="nPort"></param>
		/// <param name="nRegionNum">��ʾ������š�</param>
		/// <param name="nDeviceNum"></param>
		/// <returns></returns>
		[DllImport("PlayCtrl.dll")]
		public static extern bool PlayM4_SetDDrawDeviceEx(int nPort, ushort nRegionNum, ushort nDeviceNum);

		/// <summary>
		/// 71��BOOL __stdcall PlayM4_OpenStreamEx(LONG nPort,PBYTE pFileHeadBuf,DWORD nSize,DWORD nBufPoolSize);
		/// ������Ƶ�ֿ�����ķ�ʽ������
		/// </summary>
		/// <param name="nPort"></param>
		/// <param name="pFileHeadBuf">�û��ӿ��ϵõ����ļ�ͷ���ݡ�</param>
		/// <param name="nSize">�ļ�ͷ���� </param>
		/// <param name="nBufPoolSize"> ���ò������д���������Ļ�������С����Χ��SOURCE_BUF_MIN~ SOURCE_BUF_MAX��</param>
		/// <returns></returns>
		[DllImport("PlayCtrl.dll")]
		public static extern bool PlayM4_OpenStreamEx(int nPort, IntPtr pFileHeadBuf, ushort nSize, ushort nBufPoolSize);

		/// <summary>
		/// 72��BOOL __stdcall PlayM4_CloseStreamEx(LONG nPort);
		/// �ر�������
		/// </summary>
		/// <param name="nPort"></param>
		/// <returns></returns>
		[DllImport("PlayCtrl.dll")]
		public static extern bool PlayM4_CloseStreamEx(int nPort);

		/// <summary>
		/// 73��BOOL __stdcall PlayM4_InputVideoData(LONG nPort,PBYTE pBuf,DWORD nSize);
		/// ����ӿ��ϵõ�����Ƶ�� (�����Ǹ�����������Ƶ���ݻᱻ����)������֮������������ݡ�
		/// </summary>
		/// <param name="nPort"></param>
		/// <param name="pBuf">��������ַ</param>
		/// <param name="nSize">��������С</param>
		/// <returns>TURE,��ʾ�Ѿ��������ݡ�FALSE ��ʾʧ�ܣ�����û�����롣</returns>
		[DllImport("PlayCtrl.dll")]
		public static extern bool PlayM4_InputVideoData(int nPort, IntPtr pBuf, ushort nSize);

		/// <summary>
		/// 74��BOOL __stdcall PlayM4_InputAudioData(LONG nPort,PBYTE pBuf,DWORD nSize);
		/// ����ӿ��ϵõ�����Ƶ����������֮������������ݡ� 
		/// </summary>
		/// <param name="nPort"></param>
		/// <param name="pBuf">��������ַ</param>
		/// <param name="nSize">��������С</param>
		/// <returns>����ֵ��TURE,��ʾ�Ѿ��������ݡ�FALSE ��ʾʧ�ܣ�����û�����롣</returns>
		[DllImport("PlayCtrl.dll")]
		public static extern bool PlayM4_InputAudioData(int nPort, IntPtr pBuf, ushort nSize);

		/// <summary>
		/// 75��BOOL __stdcall PlayM4_RigisterDrawFun(LONG nPort,void (CALLBACK* DrawFun)(long nPort,HDC hDc,LONG nUser),LONG nUser);
		/// ע��һ���ص���������õ�ǰ�����device context, ����������DC�ϻ�ͼ����д�֣����ͺ����ڴ��ڵĿͻ���DC�ϻ�ͼ��
		/// �����DC���Ǵ��ڿͻ�����DC������DirectDraw���Off-Screen�����DC��ע�⣬�����ʹ��overlay���棬����ӿ���Ч��
		/// �����ֱ���ڴ����ϻ�ͼ��ֻҪ����͸��ɫ�Ͳ��ᱻ���ǡ� 
		/// </summary>
		/// <param name="nPort"></param>
		/// <param name="df">�ص��������</param>
		/// <param name="nUser">�û�����</param>
		/// <returns></returns>
		[DllImport("PlayCtrl.dll")]
		public static extern bool PlayM4_RigisterDrawFun(int nPort, DrawFun df, int nUser);

		/// <summary>
		/// 76��BOOL __stdcall PlayM4_GetRefValue(LONG nPort,BYTE *pBuffer, DWORD *pSize);
		/// ��ȡ�ļ�������Ϣ���Ա��´δ�ͬһ���ļ�ʱֱ��ʹ�������Ϣ���������������ɺ���ܻ����Ϣ�� 
		/// </summary>
		/// <param name="nPort"></param>
		/// <param name="pBuffer">������Ϣ</param>
		/// <param name="pSize">
		///		����/�������������pBuffer�Ĵ�С�����������Ϣ��С��
		///     ע�������ڵ�һ��ָ��pSize=0,pBuffer=NULL
		///     ��pSize�ķ���ֵ�����Ҫ�Ļ�������С��Ȼ������㹻�Ļ��壬�ٵ���һ�� 
		/// </param>
		/// <returns></returns>
		[DllImport("PlayCtrl.dll")]
		public static extern bool PlayM4_GetRefValue(int nPort, IntPtr pBuffer, ref ushort pSize);

		/// <summary>
		/// 77��BOOL __stdcall PlayM4_SetRefValue(LONG nPort,BYTE *pBuffer, DWORD nSize);
		/// �����ļ�����������Ѿ������ļ�������Ϣ�����Բ��ٵ������������Ļص�����(53.PlayM4_SetFileRefCallBack)��
		/// ֱ������������Ϣ��ע��������Ϣ���䳤�ȱ���׼ȷ 
		/// </summary>
		/// <param name="nPort"></param>
		/// <param name="pBuffer">������Ϣ��</param>
		/// <param name="nSize">������Ϣ�ĳ���</param>
		/// <returns></returns>
		[DllImport("PlayCtrl.dll")]
		public static extern bool PlayM4_SetRefValue(int nPort, IntPtr pBuffer, ushort nSize);

		/// <summary>
		/// 78��BOOL __stdcall PlayM4_SetTimerType(LONG nPort,DWORD nTimerType,DWORD nReserved);
		/// ���ò�����ʹ�õĶ�ʱ����ע�⣺������Open֮ǰ����
		/// </summary>
		/// <param name="nPort"></param>
		/// <param name="nTimerType">TIMER_1��TIMER_2�����궨�塣Ĭ�������0~15·ʹ��TIMER_1������ʹ��TIMER_2��</param>
		/// <param name="nReserved">����</param>
		/// <returns></returns>
		[DllImport("PlayCtrl.dll")]
		public static extern bool PlayM4_SetTimerType(int nPort, int nTimerType, ushort nReserved);

		/// <summary>
		/// 79��BOOL __stdcall PlayM4_GetTimerType(LONG nPort,DWORD *pTimerType,DWORD *pReserved);
		/// ��õ�ǰͨ��ʹ�õĶ�ʱ���� 
		/// </summary>
		/// <param name="nPort"></param>
		/// <param name="pTimerType">TIMER_1��TIMER_2</param>
		/// <param name="pReserved">����</param>
		/// <returns></returns>
		[DllImport("PlayCtrl.dll")]
		public static extern bool PlayM4_GetTimerType(int nPort, out ushort pTimerType, out ushort pReserved);

		/// <summary>
		/// 80��BOOL __stdcall PlayM4_ResetBuffer(LONG nPort,DWORD nBufType);
		/// ��ղ������еĻ�������
		/// </summary>
		/// <param name="nPort"></param>
		/// <param name="nBufType">����������</param>
		/// <returns></returns>
		[DllImport("PlayCtrl.dll")]
		public static extern bool PlayM4_ResetBuffer(int nPort, int nBufType);

		/// <summary>
		/// 81��DWORD __stdcall PlayM4_GetBufferValue(LONG nPort,DWORD nBufType);
		/// ��ȡ�������еĻ�������С��֡������byte��������ӿڿ��԰����û��˽⻺�����е����ݣ��Ӷ���������ʱ�����������ơ� 
		/// </summary>
		/// <param name="nPort"></param>
		/// <param name="nBufType">����������</param>
		/// <returns>���ݲ�����ͬ�����ػ�����ֵ��Դ����������byte,����󻺳�������֡����</returns>
		[DllImport("PlayCtrl.dll")]
		public static extern ushort PlayM4_GetBufferValue(int nPort, ushort nBufType);

		/// <summary>
		/// 82��BOOL __stdcall PlayM4_AdjustWaveAudio(LONG nPort,LONG nCoefficient);
		/// ����WAVE���Σ����Ըı������Ĵ�С������PlayM4_SetVolume()�Ĳ�ͬ���ڣ����ǵ����������ݣ�
		/// ֻ�Ը�·�����ã���PlayM4_SetVolume�ǵ�������������������ϵͳ�����á�
		/// ע�⣬������������ƻ����ʣ�������ÿ·�����������������������ʹ�á� 
		/// </summary>
		/// <param name="nPort"></param>
		/// <param name="nCoefficient">�����Ĳ�������Χ��MIN_WAVE_COEF �� MAX_WAVE_COEF��0�ǲ�������</param>
		/// <returns></returns>
		[DllImport("PlayCtrl.dll")]
		public static extern bool PlayM4_AdjustWaveAudio(int nPort, int nCoefficient);

		/// <summary>
		/// 83��BOOL __stdcall PlayM4_SetVerifyCallBack(LONG nPort, DWORD nBeginTime, DWORD nEndTime, void (__stdcall* funVerify)(long nPort, FRAME_POS * pFilePos, DWORD bIsVideo, DWORD nUser),  DWORD  nUser); 
		/// ע��һ���ص�������У�������Ƿ��޸ģ�ʵ��ˮӡ���ܡ����ڿ��Է������ݶ�ʧ�����
		/// ע�⣬��У���ڽ����ļ�������ʱ����У����Ա��뽨�ļ���������У�顣��openfile֮ǰʹ�á�
		/// </summary>
		/// <param name="nPort"></param>
		/// <param name="nBeginTime">У�鿪ʼʱ�䣬��λms</param>
		/// <param name="nEndTime">У�����ʱ�䣬��λms</param>
		/// <param name="vfy">���������ݱ��޸�ʱ�ص��ĺ���</param>
		/// <param name="nUser">�û�����</param>
		/// <returns></returns>
		[DllImport("PlayCtrl.dll")]
		public static extern bool PlayM4_SetVerifyCallBack(int nPort, uint nBeginTime, uint nEndTime, Verify vfy, uint nUser);

		/// <summary>
		/// 84��BOOL __stdcall PlayM4_SetAudioCallBack(LONG nPort, void (__stdcall * funAudio)(long nPort, char * pAudioBuf, long nSize, long nStamp, long nType, long nUser), long nUser);
		/// ��Ƶ֡������wave���ݻص�
		/// </summary>
		/// <param name="nPort"></param>
		/// <param name="nBufType"></param>
		/// <param name="ado">��Ƶ�ص�����</param>
		/// <param name="nUser">�û��Զ�������</param>
		/// <returns></returns>
		[DllImport("PlayCtrl.dll")]
		public static extern bool PlayM4_SetAudioCallBack(int nPort, Audio ado, int nUser);

		/// <summary>
		/// 85��BOOL __stdcall PlayM4_SetEncTypeChangeCallBack(LONG nPort,void(CALLBACK *funEncChange)(long nPort,long nUser),long nUser);
		/// ����ʱͼ���ʽ�����ı�֪ͨ�û��Ļص��������ڴ��ļ�ǰʹ��
		/// </summary>
		/// <param name="nPort"></param>
		/// <param name="ec">�ص�����</param>
		/// <param name="nUser">�û��Զ�������</param>
		/// <returns></returns>
		[DllImport("PlayCtrl.dll")]
		public static extern bool PlayM4_SetEncTypeChangeCallBack(int nPort, EncChange ec, int nUser);

		/// <summary>
		/// 86��BOOL __stdcall PlayM4_SetColor(LONG nPort, DWORD nRegionNum, int nBrightness, int nContrast, int nSaturation, int nHue);
		/// ����ͼ�����Ƶ��������ʱ������
		/// ע�⣺���ȫ��ΪĬ��ֵ����������ɫ����
		/// </summary>
		/// <param name="nPort"></param>
		/// <param name="nRegionNum">��ʾ���򣬲ο�PlayM4_SetDisplayRegion�����ֻ��һ����ʾ����(ͨ�����)��Ϊ0</param>
		/// <param name="nBrightness">���ȣ�Ĭ��64�� ��Χ0-128</param>
		/// <param name="nContrast">�Աȶȣ�Ĭ��64�� ��Χ0-128</param>
		/// <param name="nSaturation">���Ͷȣ�Ĭ��64�� ��Χ0-128</param>
		/// <param name="nHue">ɫ����Ĭ��64�� ��Χ0-128</param>
		/// <returns></returns>
		[DllImport("PlayCtrl.dll")]
		public static extern bool PlayM4_SetColor(int nPort, ushort nRegionNum, int nBrightness, int nContrast, int nSaturation, int nHue);

		/// <summary>
		/// 87��BOOL __stdcall PlayM4_GetColor(LONG nPort, DWORD nRegionNum, int *pBrightness, int *pContrast, int *pSaturation, int *pHue);
		/// ��Ӧ�Ļ����ɫֵ
		/// </summary>
		/// <param name="nPort"></param>
		/// <param name="nRegionNum">��ʾ���򣬲ο�PlayM4_SetDisplayRegion�����ֻ��һ����ʾ����(ͨ�����)��Ϊ0</param>
		/// <param name="nBrightness">���ȣ�Ĭ��64�� ��Χ0-128</param>
		/// <param name="nContrast">�Աȶȣ�Ĭ��64�� ��Χ0-128</param>
		/// <param name="nSaturation">���Ͷȣ�Ĭ��64�� ��Χ0-128</param>
		/// <param name="nHue">ɫ����Ĭ��64�� ��Χ0-128</param>
		/// <returns></returns>
		[DllImport("PlayCtrl.dll")]
		public static extern bool PlayM4_GetColor(int nPort, ushort nRegionNum, out int pBrightness, out int pContrast, out int pSaturation, out int pHue);

		/// <summary>
		/// 88��BOOL __stdcall PlayM4_SetEncChangeMsg(LONG nPort,HWND hWnd,UINT nMsg)
		/// ���ý���ʱ�����ʽ�����ı�ʱҪ���͵���Ϣ�� 
		/// </summary>
		/// <param name="nPort"></param>
		/// <param name="hWnd">��Ϣ���͵Ĵ��ڡ�</param>
		/// <param name="nMsg">�û��������Ϣ�������ý���ʱ�����ʽ�����ı�ʱҪ���ʹ˶������Ϣ����Ϣ�����е�wParam����ֵ�Ƿ���nPort��ֵ�� </param>
		/// <returns></returns>
		[DllImport("PlayCtrl.dll")]
		public static extern bool PlayM4_SetEncChangeMsg(int nPort, IntPtr hWnd, uint nMsg);

		/// <summary>
		/// 89��BOOL _stdcall PlayM4_GetOriginalFrameCallBack(LONG nPort, BOOL bIsChange, BOOL bNormalSpeed, long nStartFrameNum, long nStartStamp, long nFileHeader, void(CALLBACK *funGetOrignalFrame)(long nPort,FRAME_TYPE *frameType, long nUser), long nUser)
		/// �����õ�ԭʼ֡���ݵĻص����������Ըı�ÿ֡��ʱ���֡�ţ����ļ���֮����á����ڽ������ļ�ƴ����һ��
		/// </summary>
		/// <param name="nPort"></param>
		/// <param name="bIsChange">�Ƿ�Ҫ�ı�ÿ֡�Ĳ���</param>
		/// <param name="bNormalSpeed">�Ƿ�Ҫ�������ٶȵõ�ԭʼ֡</param>
		/// <param name="nStartFrameNum">��Ҫ�ı�ԭʼ֡֡�ţ����Ǵ��ļ��Ŀ�ʼ֡��</param>
		/// <param name="nStartStamp">��Ҫ�ı�ԭʼ֡ʱ�꣬���Ǵ��ļ��Ŀ�ʼʱ��</param>
		/// <param name="nFileHeader">�������:�ļ�ͷ�汾��Ϣ������汾��ƥ�䣬���ز��ɹ�</param>
		/// <param name="gof"></param>
		/// <param name="nUser">�û�����</param>
		/// <returns></returns>
		[DllImport("PlayCtrl.dll")]
		public static extern bool PlayM4_GetOriginalFrameCallBack(int nPort, bool bIsChange, bool bNormalSpeed, int nStartFrameNum, int nStartStamp, out int nFileHeader, GetOrignalFrame gof, int nUser);

		/// <summary>
		/// 90��BOOL _stdcall PlayM4_GetFileSpecialAttr(LONG nPort, DWORD *pTimeStamp,DWORD *pFileNum ,DWORD *nFileHeader)
		/// �õ��ļ�����ʱ���֡�ţ����ļ���֮����á����ϸ��ļ�һ��ʹ�ã������ļ�ƴ�ӡ� 
		/// </summary>
		/// <param name="nPort"></param>
		/// <param name="pTimeStamp">�ļ�����ʱ��</param>
		/// <param name="pFileNum">�ļ�����֡��</param>
		/// <param name="nFileHeader">�ļ�ͷ��Ϣ</param>
		/// <returns></returns>
		[DllImport("PlayCtrl.dll")]
		public static extern bool PlayM4_GetFileSpecialAttr(int nPort, ref ushort pTimeStamp, ref ushort pFileNum, ref ushort nFileHeader);
		#endregion

		#region ����Ϊ4.7��(build0711)�����ӿ�

		/// <summary>
		/// 91.��BOOL _stdcall PlayM4_ConvertToJpegFile(char *pBuf, long nSize, long nWidth, int nHeight, long nType, char *sFileName)
		/// ץͼ��ΪJPEG�ļ�, �ú���������ʾ�ص�������ʹ��, �÷��μ�PlayM4_ConvertToBmpFile(); 
		/// </summary>
		/// <param name="pBuf">ͼ�����ݻ���</param>
		/// <param name="nSize">ͼ���С</param>
		/// <param name="nWidth">ͼ���</param>
		/// <param name="nHeight">ͼ���</param>
		/// <param name="nType">ͼ������YV12</param>
		/// <param name="sFileName">����jpeg�ļ�·�� </param>
		/// <returns>
		///		TRUE: ����Jpeg�ļ��ɹ�
		///		FALSE: ʧ��, �ɵ���PlayM4_GetLastError()��ȡ�������� 
		/// </returns>
		[DllImport("PlayCtrl.dll")]
		public static extern bool PlayM4_ConvertToJpegFile(byte[] pBuf, int nSize, int nWidth, int nHeight, int nType, string sFileName);

		/// <summary>
		/// 92��BOOL _stdcall PlayM4_SetJpegQuality(long nQuality)
		/// ����ץȡ��jpegͼ������, ���÷�Χ0~100, ����ʹ��75~90, �������øú���, �����Ĭ��ͼ������, ĿǰĬ��Ϊ80 
		/// </summary>
		/// <param name="nQuality">
		///	��������, ��Χ0~100
		///     0:   ͼ���������, ��ץȡ��ͼ���С��С 
		///     100: ͼ���������, ��ץȡ��ͼ���С��� 
		/// </param>
		/// <returns>
		///		TRUE: ���óɹ�, �������õ�����
		///		FALSE: ����ʧ��, ����Ĭ��ֵ, �ɵ���PlayM4_GetLastError()��ȡ�������� 
		/// </returns>
		[DllImport("PlayCtrl.dll")]
		public static extern bool PlayM4_SetJpegQuality(int nQuality);

		/// <summary>
		/// 93��BOOL _stdcall PlayM4_SetDeflash(LONG nPort,BOOL bDeflash)
		/// �����Ƿ�ȥ��˸����, ԭ���ھ�ֹͼ�����������������, ͼ��������˸���󣨻��ˢ�»���������
		/// ����ȥ��˸���ܺ���˸Ч������������ᣬͬʱҲ�ܽ������� 
		/// </summary>
		/// <param name="nPort">ͨ����</param>
		/// <param name="bDeflash"> TRUE��ʾ����ȥ��˸��FALSE��ʾ�����ã�Ĭ��Ϊ������</param>
		/// <returns>TRUE: ���óɹ���FALSE: ����ʧ��, ����Ĭ��ֵ, �ɵ���PlayM4_GetLastError()��ȡ�������� </returns>
		[DllImport("PlayCtrl.dll")]
		public static extern bool PlayM4_SetDeflash(int nPort, bool bDeflash);
		#endregion

		#region ����Ϊ4.8��(build0813)�����ӿ�
		/// <summary>
		/// 94��BOOL __stdcall PlayM4_CheckDiscontinuousFrameNum(LONG nPort, BOOL bCheck)
		/// ֡�Ų�����ʱ�Ƿ�����һ��I֡
		/// </summary>
		/// <param name="nPort">ͨ����</param>
		/// <param name="bCheck">֡�Ų�����ʱ�Ƿ�����һ��I֡</param>
		/// <returns>TRUE:  ���óɹ�  FALSE: ����ʧ�� </returns>
		[DllImport("PlayCtrl.dll")]
		public static extern bool PlayM4_CheckDiscontinuousFrameNum(int nPort, bool bCheck);

		/// <summary>
		/// 95��BOOL __stdcall PlayM4_GetBMP(LONG nPort,PBYTE pBitmap,DWORD nBufSize,DWORD* pBmpSize);
		/// ץȡbmpͼ�� 
		/// </summary>
		/// <param name="nPort">ͨ����</param>
		/// <param name="pBitmap">
		///     ���BMPͼ�����ݵ�ַ�����û����䣬����С��bmpͼ���С
		///     sizeof(BITMAPFILEHEADER) + sizeof(BITMAPINFOHEADER) + w * h * 4�� ����w��h�ֱ�Ϊͼ���ߡ� 
		/// </param>
		/// <param name="nBufSize">����Ļ�������С</param>
		/// <param name="pBmpSize">��ȡ����ʵ��bmpͼ���С</param>
		/// <returns>TRUE:  ��ȡ�ɹ� FALSE: ��ȡʧ�� </returns>
		[DllImport("PlayCtrl.dll")]
        public static extern bool PlayM4_GetBMP(int nPort, byte[] pBitmap, int nBufSize, out int pBmpSize);

		/// <summary>
		/// 96��BOOL __stdcall PlayM4_GetJPEG(LONG nPort,PBYTE pJpeg,DWORD nBufSize,DWORD* pJpegSize);
		/// ץȡjpegͼ��
		/// </summary>
		/// <param name="nPort">ͨ����</param>
		/// <param name="pJpeg">���JEPGͼ�����ݵ�ַ�����û����䣬����С��JPEGͼ���С�������Сw * h * 3/2�� ����w��h�ֱ�Ϊͼ���ߡ�</param>
		/// <param name="nBufSize">����Ļ�������С��</param>
		/// <param name="pJpegSize">��ȡ����ʵ��bmpͼ���С��</param>
		/// <returns>TRUE:   ��ȡ�ɹ�  FALSE:  ��ȡʧ��</returns>
		[DllImport("PlayCtrl.dll")]
        public static extern bool PlayM4_GetJPEG(int nPort, byte[] pJpeg, int nBufSize, out int pJpegSize);

		/// <summary>
		/// 97��BOOL __stdcall PlayM4_SetDecCallBackMend(LONG nPort,void (CALLBACK* DecCBFun)(long nPort,char * pBuf,long nSize,FRAME_INFO * pFrameInfo, long nUser, long nReserved2), long nUser);
		/// ���ûص��������滻�������е���ʾ���֣����û��Լ�������ʾ���ú�����PlayM4_Play֮ǰ���ã�
		/// ��PlayM4_Stopʱ�Զ�ʧЧ���´ε���PlayM4_Play֮ǰ��Ҫ�������á�
		/// ע����벿�ֲ������ٶȣ�ֻҪ�û��ӻص������з��أ��������ͻ������һ�������ݡ��������
		/// ��ʹ����Ҫ�û�����Ƶ��ʾ�������������㹻���˽⣬����������ʹ�ã��й�֪ʶ�����directx��������
		/// </summary>
		/// <param name="nPort"></param>
		/// <param name="dcbf">DecCBFun�ص�����ָ�룬����ΪNULL</param>
		/// <param name="nUser"></param>
		/// <returns></returns>
		[DllImport("PlayCtrl.dll")]
		public static extern bool PlayM4_SetDecCallBackMend(int nPort, DecCBFun dcbf, int nUser);
		#endregion
    }
}
