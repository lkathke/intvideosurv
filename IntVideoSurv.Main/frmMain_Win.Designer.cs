using System.Windows.Forms;

namespace CameraViewer
{
    partial class MainForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(MainForm));
            this.barManager1 = new DevExpress.XtraBars.BarManager(this.components);
            this.barMenu = new DevExpress.XtraBars.Bar();
            this.barSubItemMenuSystem = new DevExpress.XtraBars.BarSubItem();
            this.barButtonItem5 = new DevExpress.XtraBars.BarButtonItem();
            this.barButtonItem7 = new DevExpress.XtraBars.BarButtonItem();
            this.barSubItemMenuView = new DevExpress.XtraBars.BarSubItem();
            this.barButtonItemResultView = new DevExpress.XtraBars.BarButtonItem();
            this.barButtonItemAlarmView = new DevExpress.XtraBars.BarButtonItem();
            this.barSubItemMenuQuery = new DevExpress.XtraBars.BarSubItem();
            this.barSubItem1 = new DevExpress.XtraBars.BarSubItem();
            this.bar3 = new DevExpress.XtraBars.Bar();
            this.barButtonItem3 = new DevExpress.XtraBars.BarButtonItem();
            this.barButtonItem8 = new DevExpress.XtraBars.BarButtonItem();
            this.barButtonItem9 = new DevExpress.XtraBars.BarButtonItem();
            this.barButtonItem10 = new DevExpress.XtraBars.BarButtonItem();
            this.barButtonItem11 = new DevExpress.XtraBars.BarButtonItem();
            this.barButtonItem12 = new DevExpress.XtraBars.BarButtonItem();
            this.barButtonItem13 = new DevExpress.XtraBars.BarButtonItem();
            this.barButtonItemGetPics = new DevExpress.XtraBars.BarButtonItem();
            this.barButtonItem14 = new DevExpress.XtraBars.BarButtonItem();
            this.bar4 = new DevExpress.XtraBars.Bar();
            this.barStaticItem1 = new DevExpress.XtraBars.BarStaticItem();
            this.barStaticItemCurrentUser = new DevExpress.XtraBars.BarStaticItem();
            this.barStaticItem3 = new DevExpress.XtraBars.BarStaticItem();
            this.barStaticItemCameraNo = new DevExpress.XtraBars.BarStaticItem();
            this.barStaticItemDecoderNo = new DevExpress.XtraBars.BarStaticItem();
            this.barStaticItem4 = new DevExpress.XtraBars.BarStaticItem();
            this.barStaticItemCurrentTime = new DevExpress.XtraBars.BarStaticItem();
            this.barStaticItem5 = new DevExpress.XtraBars.BarStaticItem();
            this.barStaticItemNetStatus = new DevExpress.XtraBars.BarStaticItem();
            this.barAndDockingController1 = new DevExpress.XtraBars.BarAndDockingController(this.components);
            this.barDockControlTop = new DevExpress.XtraBars.BarDockControl();
            this.barDockControlBottom = new DevExpress.XtraBars.BarDockControl();
            this.barDockControlLeft = new DevExpress.XtraBars.BarDockControl();
            this.barDockControlRight = new DevExpress.XtraBars.BarDockControl();
            this.dockManager1 = new DevExpress.XtraBars.Docking.DockManager(this.components);
            this.dockPanelResult = new DevExpress.XtraBars.Docking.DockPanel();
            this.dockPanel2_Container = new DevExpress.XtraBars.Docking.ControlContainer();
            this.dockPanel1 = new DevExpress.XtraBars.Docking.DockPanel();
            this.dockPanel1_Container = new DevExpress.XtraBars.Docking.ControlContainer();
            this.splitContainerControl1 = new DevExpress.XtraEditors.SplitContainerControl();
            this.splitContainerControl2 = new DevExpress.XtraEditors.SplitContainerControl();
            this.cameraView1 = new CameraViewer.Controls.CameraView();
            this.pictureEdit1 = new DevExpress.XtraEditors.PictureEdit();
            this.layoutControl2 = new DevExpress.XtraLayout.LayoutControl();
            this.simpleButton1 = new DevExpress.XtraEditors.SimpleButton();
            this.simpleButton2 = new DevExpress.XtraEditors.SimpleButton();
            this.simpleButton3 = new DevExpress.XtraEditors.SimpleButton();
            this.simpleButton4 = new DevExpress.XtraEditors.SimpleButton();
            this.simpleButton5 = new DevExpress.XtraEditors.SimpleButton();
            this.layoutControlGroup2 = new DevExpress.XtraLayout.LayoutControlGroup();
            this.layoutControlItem4 = new DevExpress.XtraLayout.LayoutControlItem();
            this.layoutControlItem5 = new DevExpress.XtraLayout.LayoutControlItem();
            this.layoutControlItem6 = new DevExpress.XtraLayout.LayoutControlItem();
            this.layoutControlItem7 = new DevExpress.XtraLayout.LayoutControlItem();
            this.layoutControlItem8 = new DevExpress.XtraLayout.LayoutControlItem();
            this.dockPanelAlarm = new DevExpress.XtraBars.Docking.DockPanel();
            this.dockPanel3_Container = new DevExpress.XtraBars.Docking.ControlContainer();
            this.pcBottom = new DevExpress.XtraEditors.PanelControl();
            this.xtraTabControlResult = new DevExpress.XtraTab.XtraTabControl();
            this.xtraTabPageEvent = new DevExpress.XtraTab.XtraTabPage();
            this.panelControl2 = new DevExpress.XtraEditors.PanelControl();
            this.splitContainerControl7 = new DevExpress.XtraEditors.SplitContainerControl();
            this.gridControlEvent = new DevExpress.XtraGrid.GridControl();
            this.advBandedGridViewEvent = new DevExpress.XtraGrid.Views.BandedGrid.AdvBandedGridView();
            this.gridBand5 = new DevExpress.XtraGrid.Views.BandedGrid.GridBand();
            this.bandedGridColumn12 = new DevExpress.XtraGrid.Views.BandedGrid.BandedGridColumn();
            this.bandedGridColumn15 = new DevExpress.XtraGrid.Views.BandedGrid.BandedGridColumn();
            this.bandedGridColumn14 = new DevExpress.XtraGrid.Views.BandedGrid.BandedGridColumn();
            this.gridBand7 = new DevExpress.XtraGrid.Views.BandedGrid.GridBand();
            this.gridBand8 = new DevExpress.XtraGrid.Views.BandedGrid.GridBand();
            this.splitContainerControl8 = new DevExpress.XtraEditors.SplitContainerControl();
            this.pictureEditEvent = new DevExpress.XtraEditors.PictureEdit();
            this.splitContainerControlEventVideo = new DevExpress.XtraEditors.SplitContainerControl();
            this.simpleButton6 = new DevExpress.XtraEditors.SimpleButton();
            this.layoutControl1 = new DevExpress.XtraLayout.LayoutControl();
            this.simpleButton9 = new DevExpress.XtraEditors.SimpleButton();
            this.simpleButton7 = new DevExpress.XtraEditors.SimpleButton();
            this.simpleButton8 = new DevExpress.XtraEditors.SimpleButton();
            this.layoutControlGroup1 = new DevExpress.XtraLayout.LayoutControlGroup();
            this.layoutControlItem1 = new DevExpress.XtraLayout.LayoutControlItem();
            this.layoutControlItem2 = new DevExpress.XtraLayout.LayoutControlItem();
            this.layoutControlItem3 = new DevExpress.XtraLayout.LayoutControlItem();
            this.simpleButtonPlay = new DevExpress.XtraEditors.SimpleButton();
            this.simpleButton14 = new DevExpress.XtraEditors.SimpleButton();
            this.panelControl1 = new DevExpress.XtraEditors.PanelControl();
            this.checkedComboBoxEditUserSelection = new DevExpress.XtraEditors.CheckedComboBoxEdit();
            this.labelControl7 = new DevExpress.XtraEditors.LabelControl();
            this.lblEventCurrentPage = new DevExpress.XtraEditors.LabelControl();
            this.labelControl9 = new DevExpress.XtraEditors.LabelControl();
            this.labelControl10 = new DevExpress.XtraEditors.LabelControl();
            this.cbeEventNumberPerPage = new DevExpress.XtraEditors.ComboBoxEdit();
            this.btnEventLastPage = new DevExpress.XtraEditors.SimpleButton();
            this.btnEventNextPage = new DevExpress.XtraEditors.SimpleButton();
            this.btnEventPrevPage = new DevExpress.XtraEditors.SimpleButton();
            this.btnEventFirstPage = new DevExpress.XtraEditors.SimpleButton();
            this.btnQueryEvent = new DevExpress.XtraEditors.SimpleButton();
            this.labelControl11 = new DevExpress.XtraEditors.LabelControl();
            this.labelControl12 = new DevExpress.XtraEditors.LabelControl();
            this.teStartTimeEvent = new DevExpress.XtraEditors.TimeEdit();
            this.teEndTimeEvent = new DevExpress.XtraEditors.TimeEdit();
            this.checkedComboBoxEditEventCamera = new DevExpress.XtraEditors.CheckedComboBoxEdit();
            this.labelControl13 = new DevExpress.XtraEditors.LabelControl();
            this.radioGroupEvent = new DevExpress.XtraEditors.RadioGroup();
            this.xtraTabPageVehicle = new DevExpress.XtraTab.XtraTabPage();
            this.panelControl3 = new DevExpress.XtraEditors.PanelControl();
            this.splitContainerControl5 = new DevExpress.XtraEditors.SplitContainerControl();
            this.gridControlVehicle = new DevExpress.XtraGrid.GridControl();
            this.advBandedGridViewVehicle = new DevExpress.XtraGrid.Views.BandedGrid.AdvBandedGridView();
            this.gridBand3 = new DevExpress.XtraGrid.Views.BandedGrid.GridBand();
            this.bandedGridColumn7 = new DevExpress.XtraGrid.Views.BandedGrid.BandedGridColumn();
            this.bandedGridColumn8 = new DevExpress.XtraGrid.Views.BandedGrid.BandedGridColumn();
            this.bandedGridColumn9 = new DevExpress.XtraGrid.Views.BandedGrid.BandedGridColumn();
            this.bandedGridColumn10 = new DevExpress.XtraGrid.Views.BandedGrid.BandedGridColumn();
            this.gridBand4 = new DevExpress.XtraGrid.Views.BandedGrid.GridBand();
            this.bandedGridColumn11 = new DevExpress.XtraGrid.Views.BandedGrid.BandedGridColumn();
            this.bandedGridColumn13 = new DevExpress.XtraGrid.Views.BandedGrid.BandedGridColumn();
            this.bandedGridColumn17 = new DevExpress.XtraGrid.Views.BandedGrid.BandedGridColumn();
            this.bandedGridColumn18 = new DevExpress.XtraGrid.Views.BandedGrid.BandedGridColumn();
            this.bandedGridColumn19 = new DevExpress.XtraGrid.Views.BandedGrid.BandedGridColumn();
            this.bandedGridColumn20 = new DevExpress.XtraGrid.Views.BandedGrid.BandedGridColumn();
            this.bandedGridColumn21 = new DevExpress.XtraGrid.Views.BandedGrid.BandedGridColumn();
            this.bandedGridColumn22 = new DevExpress.XtraGrid.Views.BandedGrid.BandedGridColumn();
            this.bandedGridColumn23 = new DevExpress.XtraGrid.Views.BandedGrid.BandedGridColumn();
            this.splitContainerControl6 = new DevExpress.XtraEditors.SplitContainerControl();
            this.pictureEditVehicle = new DevExpress.XtraEditors.PictureEdit();
            this.splitContainerControlVideoVehicle = new DevExpress.XtraEditors.SplitContainerControl();
            this.simpleButton10 = new DevExpress.XtraEditors.SimpleButton();
            this.simpleButton11 = new DevExpress.XtraEditors.SimpleButton();
            this.simpleButton12 = new DevExpress.XtraEditors.SimpleButton();
            this.panelControl4 = new DevExpress.XtraEditors.PanelControl();
            this.labelControl8 = new DevExpress.XtraEditors.LabelControl();
            this.lblVehicleCurrentPage = new DevExpress.XtraEditors.LabelControl();
            this.comboBoxEdit1 = new DevExpress.XtraEditors.ComboBoxEdit();
            this.labelControl6 = new DevExpress.XtraEditors.LabelControl();
            this.btnVehicleLastPage = new DevExpress.XtraEditors.SimpleButton();
            this.btnVehicleNextPage = new DevExpress.XtraEditors.SimpleButton();
            this.btnVehiclePrePage = new DevExpress.XtraEditors.SimpleButton();
            this.btnVehicleFirstPage = new DevExpress.XtraEditors.SimpleButton();
            this.textEdit1 = new DevExpress.XtraEditors.TextEdit();
            this.labelControl2 = new DevExpress.XtraEditors.LabelControl();
            this.btnQueryVehicle = new DevExpress.XtraEditors.SimpleButton();
            this.labelControl3 = new DevExpress.XtraEditors.LabelControl();
            this.labelControl4 = new DevExpress.XtraEditors.LabelControl();
            this.teStartTimeVehicle = new DevExpress.XtraEditors.TimeEdit();
            this.teEndTimeVehicle = new DevExpress.XtraEditors.TimeEdit();
            this.checkedComboBoxEditVehicleCamera = new DevExpress.XtraEditors.CheckedComboBoxEdit();
            this.labelControl5 = new DevExpress.XtraEditors.LabelControl();
            this.radioGroupVehicle = new DevExpress.XtraEditors.RadioGroup();
            this.xtraTabPageFace = new DevExpress.XtraTab.XtraTabPage();
            this.splitContainerControl3 = new DevExpress.XtraEditors.SplitContainerControl();
            this.gridControlFace = new DevExpress.XtraGrid.GridControl();
            this.advBandedGridViewFace = new DevExpress.XtraGrid.Views.BandedGrid.AdvBandedGridView();
            this.gridBand1 = new DevExpress.XtraGrid.Views.BandedGrid.GridBand();
            this.bandedGridColumn1 = new DevExpress.XtraGrid.Views.BandedGrid.BandedGridColumn();
            this.bandedGridColumn4 = new DevExpress.XtraGrid.Views.BandedGrid.BandedGridColumn();
            this.bandedGridColumn2 = new DevExpress.XtraGrid.Views.BandedGrid.BandedGridColumn();
            this.bandedGridColumn3 = new DevExpress.XtraGrid.Views.BandedGrid.BandedGridColumn();
            this.gridBand2 = new DevExpress.XtraGrid.Views.BandedGrid.GridBand();
            this.bandedGridColumn6 = new DevExpress.XtraGrid.Views.BandedGrid.BandedGridColumn();
            this.bandedGridColumn5 = new DevExpress.XtraGrid.Views.BandedGrid.BandedGridColumn();
            this.gridViewFace = new DevExpress.XtraGrid.Views.Grid.GridView();
            this.splitContainerControl4 = new DevExpress.XtraEditors.SplitContainerControl();
            this.pictureEditFace = new DevExpress.XtraEditors.PictureEdit();
            this.splitContainerControlFaceVideo = new DevExpress.XtraEditors.SplitContainerControl();
            this.panelControl6 = new DevExpress.XtraEditors.PanelControl();
            this.lblFaceCurrentPage = new DevExpress.XtraEditors.LabelControl();
            this.label3 = new DevExpress.XtraEditors.LabelControl();
            this.label4 = new DevExpress.XtraEditors.LabelControl();
            this.cbeFaceNumberPerPage = new DevExpress.XtraEditors.ComboBoxEdit();
            this.btnFaceLastPage = new DevExpress.XtraEditors.SimpleButton();
            this.btnFaceNextPage = new DevExpress.XtraEditors.SimpleButton();
            this.btnFacePrePage = new DevExpress.XtraEditors.SimpleButton();
            this.btnFaceFirstPage = new DevExpress.XtraEditors.SimpleButton();
            this.btnQueryFace = new DevExpress.XtraEditors.SimpleButton();
            this.lblStartTime = new DevExpress.XtraEditors.LabelControl();
            this.lblEndTime = new DevExpress.XtraEditors.LabelControl();
            this.teStartTimeFace = new DevExpress.XtraEditors.TimeEdit();
            this.teEndTimeFace = new DevExpress.XtraEditors.TimeEdit();
            this.checkedComboBoxEditFaceCamera = new DevExpress.XtraEditors.CheckedComboBoxEdit();
            this.labelControl1 = new DevExpress.XtraEditors.LabelControl();
            this.radioGroupFace = new DevExpress.XtraEditors.RadioGroup();
            this.barButtonItem1 = new DevExpress.XtraBars.BarButtonItem();
            this.barButtonItem2 = new DevExpress.XtraBars.BarButtonItem();
            this.barButtonItem4 = new DevExpress.XtraBars.BarButtonItem();
            this.barbtnClose = new DevExpress.XtraBars.BarButtonItem();
            this.barButtonItem6 = new DevExpress.XtraBars.BarButtonItem();
            this.barSubItem3 = new DevExpress.XtraBars.BarSubItem();
            this.barStaticItem2 = new DevExpress.XtraBars.BarStaticItem();
            this.barStaticItem6 = new DevExpress.XtraBars.BarStaticItem();
            this.mainMultiplexer = new CameraViewer.Multiplexer();
            this.cmIcon = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.删除ToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.timerCheckAlarmSites = new System.Windows.Forms.Timer(this.components);
            this.timerUpdateIcon = new System.Windows.Forms.Timer(this.components);
            this.bar2 = new DevExpress.XtraBars.Bar();
            this.timerCurretnTime = new System.Windows.Forms.Timer(this.components);
            this.timerTest = new System.Windows.Forms.Timer(this.components);
            ((System.ComponentModel.ISupportInitialize)(this.barManager1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.barAndDockingController1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dockManager1)).BeginInit();
            this.dockPanelResult.SuspendLayout();
            this.dockPanel1.SuspendLayout();
            this.dockPanel1_Container.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.splitContainerControl1)).BeginInit();
            this.splitContainerControl1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.splitContainerControl2)).BeginInit();
            this.splitContainerControl2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureEdit1.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.layoutControl2)).BeginInit();
            this.layoutControl2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.layoutControlGroup2)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.layoutControlItem4)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.layoutControlItem5)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.layoutControlItem6)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.layoutControlItem7)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.layoutControlItem8)).BeginInit();
            this.dockPanelAlarm.SuspendLayout();
            this.dockPanel3_Container.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pcBottom)).BeginInit();
            this.pcBottom.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.xtraTabControlResult)).BeginInit();
            this.xtraTabControlResult.SuspendLayout();
            this.xtraTabPageEvent.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.panelControl2)).BeginInit();
            this.panelControl2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.splitContainerControl7)).BeginInit();
            this.splitContainerControl7.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.gridControlEvent)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.advBandedGridViewEvent)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.splitContainerControl8)).BeginInit();
            this.splitContainerControl8.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureEditEvent.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.splitContainerControlEventVideo)).BeginInit();
            this.splitContainerControlEventVideo.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.layoutControl1)).BeginInit();
            this.layoutControl1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.layoutControlGroup1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.layoutControlItem1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.layoutControlItem2)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.layoutControlItem3)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.panelControl1)).BeginInit();
            this.panelControl1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.checkedComboBoxEditUserSelection.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.cbeEventNumberPerPage.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.teStartTimeEvent.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.teEndTimeEvent.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.checkedComboBoxEditEventCamera.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.radioGroupEvent.Properties)).BeginInit();
            this.xtraTabPageVehicle.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.panelControl3)).BeginInit();
            this.panelControl3.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.splitContainerControl5)).BeginInit();
            this.splitContainerControl5.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.gridControlVehicle)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.advBandedGridViewVehicle)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.splitContainerControl6)).BeginInit();
            this.splitContainerControl6.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureEditVehicle.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.splitContainerControlVideoVehicle)).BeginInit();
            this.splitContainerControlVideoVehicle.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.panelControl4)).BeginInit();
            this.panelControl4.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.comboBoxEdit1.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.textEdit1.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.teStartTimeVehicle.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.teEndTimeVehicle.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.checkedComboBoxEditVehicleCamera.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.radioGroupVehicle.Properties)).BeginInit();
            this.xtraTabPageFace.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.splitContainerControl3)).BeginInit();
            this.splitContainerControl3.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.gridControlFace)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.advBandedGridViewFace)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.gridViewFace)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.splitContainerControl4)).BeginInit();
            this.splitContainerControl4.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureEditFace.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.splitContainerControlFaceVideo)).BeginInit();
            this.splitContainerControlFaceVideo.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.panelControl6)).BeginInit();
            this.panelControl6.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.cbeFaceNumberPerPage.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.teStartTimeFace.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.teEndTimeFace.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.checkedComboBoxEditFaceCamera.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.radioGroupFace.Properties)).BeginInit();
            this.cmIcon.SuspendLayout();
            this.SuspendLayout();
            // 
            // barManager1
            // 
            this.barManager1.Bars.AddRange(new DevExpress.XtraBars.Bar[] {
            this.barMenu,
            this.bar3,
            this.bar4});
            this.barManager1.Controller = this.barAndDockingController1;
            this.barManager1.DockControls.Add(this.barDockControlTop);
            this.barManager1.DockControls.Add(this.barDockControlBottom);
            this.barManager1.DockControls.Add(this.barDockControlLeft);
            this.barManager1.DockControls.Add(this.barDockControlRight);
            this.barManager1.DockManager = this.dockManager1;
            this.barManager1.Form = this;
            this.barManager1.Items.AddRange(new DevExpress.XtraBars.BarItem[] {
            this.barButtonItem1,
            this.barButtonItem2,
            this.barButtonItem4,
            this.barbtnClose,
            this.barButtonItem6,
            this.barSubItemMenuSystem,
            this.barSubItemMenuView,
            this.barSubItem3,
            this.barSubItemMenuQuery,
            this.barSubItem1,
            this.barButtonItem3,
            this.barButtonItem5,
            this.barButtonItem7,
            this.barButtonItemResultView,
            this.barButtonItemAlarmView,
            this.barStaticItem1,
            this.barStaticItemCurrentUser,
            this.barStaticItem3,
            this.barStaticItemCameraNo,
            this.barStaticItem2,
            this.barStaticItemDecoderNo,
            this.barStaticItem4,
            this.barStaticItemCurrentTime,
            this.barStaticItem5,
            this.barStaticItem6,
            this.barStaticItemNetStatus,
            this.barButtonItem8,
            this.barButtonItem9,
            this.barButtonItem10,
            this.barButtonItem11,
            this.barButtonItem12,
            this.barButtonItem13,
            this.barButtonItemGetPics,
            this.barButtonItem14});
            this.barManager1.MainMenu = this.barMenu;
            this.barManager1.MaxItemId = 38;
            this.barManager1.StatusBar = this.bar4;
            // 
            // barMenu
            // 
            this.barMenu.BarName = "Custom 2";
            this.barMenu.DockCol = 0;
            this.barMenu.DockRow = 0;
            this.barMenu.DockStyle = DevExpress.XtraBars.BarDockStyle.Top;
            this.barMenu.LinksPersistInfo.AddRange(new DevExpress.XtraBars.LinkPersistInfo[] {
            new DevExpress.XtraBars.LinkPersistInfo(this.barSubItemMenuSystem),
            new DevExpress.XtraBars.LinkPersistInfo(this.barSubItemMenuView),
            new DevExpress.XtraBars.LinkPersistInfo(this.barSubItemMenuQuery),
            new DevExpress.XtraBars.LinkPersistInfo(this.barSubItem1)});
            this.barMenu.OptionsBar.DrawDragBorder = false;
            this.barMenu.OptionsBar.MultiLine = true;
            this.barMenu.OptionsBar.UseWholeRow = true;
            this.barMenu.Text = "Custom 2";
            // 
            // barSubItemMenuSystem
            // 
            this.barSubItemMenuSystem.Caption = "系统(&S)";
            this.barSubItemMenuSystem.Id = 9;
            this.barSubItemMenuSystem.LinksPersistInfo.AddRange(new DevExpress.XtraBars.LinkPersistInfo[] {
            new DevExpress.XtraBars.LinkPersistInfo(this.barButtonItem5),
            new DevExpress.XtraBars.LinkPersistInfo(this.barButtonItem7)});
            this.barSubItemMenuSystem.Name = "barSubItemMenuSystem";
            // 
            // barButtonItem5
            // 
            this.barButtonItem5.Caption = "系统设置";
            this.barButtonItem5.Id = 15;
            this.barButtonItem5.Name = "barButtonItem5";
            this.barButtonItem5.ItemClick += new DevExpress.XtraBars.ItemClickEventHandler(this.barButtonItem5_ItemClick);
            // 
            // barButtonItem7
            // 
            this.barButtonItem7.Caption = "退出";
            this.barButtonItem7.Id = 16;
            this.barButtonItem7.Name = "barButtonItem7";
            this.barButtonItem7.ItemClick += new DevExpress.XtraBars.ItemClickEventHandler(this.barButtonItem7_ItemClick);
            // 
            // barSubItemMenuView
            // 
            this.barSubItemMenuView.Caption = "视图(&V)";
            this.barSubItemMenuView.Id = 10;
            this.barSubItemMenuView.LinksPersistInfo.AddRange(new DevExpress.XtraBars.LinkPersistInfo[] {
            new DevExpress.XtraBars.LinkPersistInfo(this.barButtonItemResultView),
            new DevExpress.XtraBars.LinkPersistInfo(this.barButtonItemAlarmView)});
            this.barSubItemMenuView.Name = "barSubItemMenuView";
            // 
            // barButtonItemResultView
            // 
            this.barButtonItemResultView.Caption = "结果视图";
            this.barButtonItemResultView.Id = 17;
            this.barButtonItemResultView.Name = "barButtonItemResultView";
            this.barButtonItemResultView.ItemClick += new DevExpress.XtraBars.ItemClickEventHandler(this.barButtonItemAlarmView_ItemClick);
            // 
            // barButtonItemAlarmView
            // 
            this.barButtonItemAlarmView.Caption = "报警视图";
            this.barButtonItemAlarmView.Id = 18;
            this.barButtonItemAlarmView.Name = "barButtonItemAlarmView";
            this.barButtonItemAlarmView.ItemClick += new DevExpress.XtraBars.ItemClickEventHandler(this.barButtonItemResultView_ItemClick);
            // 
            // barSubItemMenuQuery
            // 
            this.barSubItemMenuQuery.Caption = "查询(&Q)";
            this.barSubItemMenuQuery.Id = 12;
            this.barSubItemMenuQuery.Name = "barSubItemMenuQuery";
            // 
            // barSubItem1
            // 
            this.barSubItem1.Caption = "帮助(&H)";
            this.barSubItem1.Id = 13;
            this.barSubItem1.Name = "barSubItem1";
            // 
            // bar3
            // 
            this.bar3.BarName = "Custom 3";
            this.bar3.DockCol = 0;
            this.bar3.DockRow = 1;
            this.bar3.DockStyle = DevExpress.XtraBars.BarDockStyle.Top;
            this.bar3.LinksPersistInfo.AddRange(new DevExpress.XtraBars.LinkPersistInfo[] {
            new DevExpress.XtraBars.LinkPersistInfo(this.barButtonItem3),
            new DevExpress.XtraBars.LinkPersistInfo(this.barButtonItem8),
            new DevExpress.XtraBars.LinkPersistInfo(this.barButtonItem9),
            new DevExpress.XtraBars.LinkPersistInfo(this.barButtonItem10),
            new DevExpress.XtraBars.LinkPersistInfo(this.barButtonItem11),
            new DevExpress.XtraBars.LinkPersistInfo(this.barButtonItem12),
            new DevExpress.XtraBars.LinkPersistInfo(this.barButtonItem13),
            new DevExpress.XtraBars.LinkPersistInfo(this.barButtonItemGetPics),
            new DevExpress.XtraBars.LinkPersistInfo(this.barButtonItem14)});
            this.bar3.Offset = 4;
            this.bar3.Text = "Custom 3";
            // 
            // barButtonItem3
            // 
            this.barButtonItem3.Caption = "系统设置";
            this.barButtonItem3.Id = 14;
            this.barButtonItem3.Name = "barButtonItem3";
            this.barButtonItem3.ItemClick += new DevExpress.XtraBars.ItemClickEventHandler(this.barButtonItem3_ItemClick_1);
            // 
            // barButtonItem8
            // 
            this.barButtonItem8.Caption = "发送命令1";
            this.barButtonItem8.Id = 30;
            this.barButtonItem8.Name = "barButtonItem8";
            this.barButtonItem8.ItemClick += new DevExpress.XtraBars.ItemClickEventHandler(this.barButtonItem8_ItemClick_1);
            // 
            // barButtonItem9
            // 
            this.barButtonItem9.Caption = "发送命令2";
            this.barButtonItem9.Id = 31;
            this.barButtonItem9.Name = "barButtonItem9";
            this.barButtonItem9.ItemClick += new DevExpress.XtraBars.ItemClickEventHandler(this.barButtonItem9_ItemClick);
            // 
            // barButtonItem10
            // 
            this.barButtonItem10.Caption = "发送命令3";
            this.barButtonItem10.Id = 32;
            this.barButtonItem10.Name = "barButtonItem10";
            this.barButtonItem10.ItemClick += new DevExpress.XtraBars.ItemClickEventHandler(this.barButtonItem10_ItemClick);
            // 
            // barButtonItem11
            // 
            this.barButtonItem11.Caption = "发送命令4";
            this.barButtonItem11.Id = 33;
            this.barButtonItem11.Name = "barButtonItem11";
            this.barButtonItem11.ItemClick += new DevExpress.XtraBars.ItemClickEventHandler(this.barButtonItem11_ItemClick);
            // 
            // barButtonItem12
            // 
            this.barButtonItem12.Caption = "测试加图像";
            this.barButtonItem12.Id = 34;
            this.barButtonItem12.Name = "barButtonItem12";
            this.barButtonItem12.ItemClick += new DevExpress.XtraBars.ItemClickEventHandler(this.barButtonItem12_ItemClick);
            // 
            // barButtonItem13
            // 
            this.barButtonItem13.Caption = "测试";
            this.barButtonItem13.Id = 35;
            this.barButtonItem13.Name = "barButtonItem13";
            this.barButtonItem13.ItemClick += new DevExpress.XtraBars.ItemClickEventHandler(this.barButtonItem13_ItemClick);
            // 
            // barButtonItemGetPics
            // 
            this.barButtonItemGetPics.Caption = "获取图片";
            this.barButtonItemGetPics.Id = 36;
            this.barButtonItemGetPics.Name = "barButtonItemGetPics";
            this.barButtonItemGetPics.ItemClick += new DevExpress.XtraBars.ItemClickEventHandler(this.barButtonItemGetPics_ItemClick);
            // 
            // barButtonItem14
            // 
            this.barButtonItem14.Caption = "测试播放视频";
            this.barButtonItem14.Id = 37;
            this.barButtonItem14.Name = "barButtonItem14";
            this.barButtonItem14.ItemClick += new DevExpress.XtraBars.ItemClickEventHandler(this.barButtonItem14_ItemClick);
            // 
            // bar4
            // 
            this.bar4.BarName = "Custom 4";
            this.bar4.CanDockStyle = DevExpress.XtraBars.BarCanDockStyle.Bottom;
            this.bar4.DockCol = 0;
            this.bar4.DockRow = 0;
            this.bar4.DockStyle = DevExpress.XtraBars.BarDockStyle.Bottom;
            this.bar4.LinksPersistInfo.AddRange(new DevExpress.XtraBars.LinkPersistInfo[] {
            new DevExpress.XtraBars.LinkPersistInfo(this.barStaticItem1),
            new DevExpress.XtraBars.LinkPersistInfo(this.barStaticItemCurrentUser),
            new DevExpress.XtraBars.LinkPersistInfo(this.barStaticItem3),
            new DevExpress.XtraBars.LinkPersistInfo(this.barStaticItemCameraNo),
            new DevExpress.XtraBars.LinkPersistInfo(this.barStaticItemDecoderNo),
            new DevExpress.XtraBars.LinkPersistInfo(this.barStaticItem4),
            new DevExpress.XtraBars.LinkPersistInfo(this.barStaticItemCurrentTime),
            new DevExpress.XtraBars.LinkPersistInfo(this.barStaticItem5),
            new DevExpress.XtraBars.LinkPersistInfo(this.barStaticItemNetStatus)});
            this.bar4.OptionsBar.AllowQuickCustomization = false;
            this.bar4.OptionsBar.DrawDragBorder = false;
            this.bar4.OptionsBar.UseWholeRow = true;
            this.bar4.Text = "Custom 4";
            // 
            // barStaticItem1
            // 
            this.barStaticItem1.Caption = "当前用户:";
            this.barStaticItem1.Id = 19;
            this.barStaticItem1.Name = "barStaticItem1";
            this.barStaticItem1.TextAlignment = System.Drawing.StringAlignment.Near;
            // 
            // barStaticItemCurrentUser
            // 
            this.barStaticItemCurrentUser.Caption = "admin";
            this.barStaticItemCurrentUser.Id = 20;
            this.barStaticItemCurrentUser.Name = "barStaticItemCurrentUser";
            this.barStaticItemCurrentUser.TextAlignment = System.Drawing.StringAlignment.Near;
            // 
            // barStaticItem3
            // 
            this.barStaticItem3.Caption = "摄像头数:";
            this.barStaticItem3.Id = 21;
            this.barStaticItem3.Name = "barStaticItem3";
            this.barStaticItem3.TextAlignment = System.Drawing.StringAlignment.Near;
            // 
            // barStaticItemCameraNo
            // 
            this.barStaticItemCameraNo.Caption = "20";
            this.barStaticItemCameraNo.Id = 22;
            this.barStaticItemCameraNo.Name = "barStaticItemCameraNo";
            this.barStaticItemCameraNo.TextAlignment = System.Drawing.StringAlignment.Near;
            // 
            // barStaticItemDecoderNo
            // 
            this.barStaticItemDecoderNo.Caption = "8";
            this.barStaticItemDecoderNo.Id = 24;
            this.barStaticItemDecoderNo.Name = "barStaticItemDecoderNo";
            this.barStaticItemDecoderNo.TextAlignment = System.Drawing.StringAlignment.Near;
            // 
            // barStaticItem4
            // 
            this.barStaticItem4.Caption = "当前时间:";
            this.barStaticItem4.Id = 25;
            this.barStaticItem4.Name = "barStaticItem4";
            this.barStaticItem4.TextAlignment = System.Drawing.StringAlignment.Near;
            // 
            // barStaticItemCurrentTime
            // 
            this.barStaticItemCurrentTime.Caption = "2011-02-20 22:22:22";
            this.barStaticItemCurrentTime.Id = 26;
            this.barStaticItemCurrentTime.Name = "barStaticItemCurrentTime";
            this.barStaticItemCurrentTime.TextAlignment = System.Drawing.StringAlignment.Near;
            // 
            // barStaticItem5
            // 
            this.barStaticItem5.Caption = "网络状态:";
            this.barStaticItem5.Id = 27;
            this.barStaticItem5.Name = "barStaticItem5";
            this.barStaticItem5.TextAlignment = System.Drawing.StringAlignment.Near;
            // 
            // barStaticItemNetStatus
            // 
            this.barStaticItemNetStatus.Caption = "正常";
            this.barStaticItemNetStatus.Id = 29;
            this.barStaticItemNetStatus.Name = "barStaticItemNetStatus";
            this.barStaticItemNetStatus.TextAlignment = System.Drawing.StringAlignment.Near;
            // 
            // barAndDockingController1
            // 
            this.barAndDockingController1.PropertiesBar.AllowLinkLighting = false;
            // 
            // barDockControlTop
            // 
            this.barDockControlTop.CausesValidation = false;
            this.barDockControlTop.Dock = System.Windows.Forms.DockStyle.Top;
            this.barDockControlTop.Location = new System.Drawing.Point(0, 0);
            this.barDockControlTop.Size = new System.Drawing.Size(1251, 55);
            // 
            // barDockControlBottom
            // 
            this.barDockControlBottom.CausesValidation = false;
            this.barDockControlBottom.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.barDockControlBottom.Location = new System.Drawing.Point(0, 724);
            this.barDockControlBottom.Size = new System.Drawing.Size(1251, 28);
            // 
            // barDockControlLeft
            // 
            this.barDockControlLeft.CausesValidation = false;
            this.barDockControlLeft.Dock = System.Windows.Forms.DockStyle.Left;
            this.barDockControlLeft.Location = new System.Drawing.Point(0, 55);
            this.barDockControlLeft.Size = new System.Drawing.Size(0, 669);
            // 
            // barDockControlRight
            // 
            this.barDockControlRight.CausesValidation = false;
            this.barDockControlRight.Dock = System.Windows.Forms.DockStyle.Right;
            this.barDockControlRight.Location = new System.Drawing.Point(1251, 55);
            this.barDockControlRight.Size = new System.Drawing.Size(0, 669);
            // 
            // dockManager1
            // 
            this.dockManager1.Controller = this.barAndDockingController1;
            this.dockManager1.Form = this;
            this.dockManager1.RootPanels.AddRange(new DevExpress.XtraBars.Docking.DockPanel[] {
            this.dockPanelResult,
            this.dockPanel1,
            this.dockPanelAlarm});
            this.dockManager1.TopZIndexControls.AddRange(new string[] {
            "DevExpress.XtraBars.BarDockControl",
            "DevExpress.XtraBars.StandaloneBarDockControl",
            "System.Windows.Forms.StatusBar",
            "DevExpress.XtraBars.Ribbon.RibbonStatusBar",
            "DevExpress.XtraBars.Ribbon.RibbonControl"});
            // 
            // dockPanelResult
            // 
            this.dockPanelResult.Controls.Add(this.dockPanel2_Container);
            this.dockPanelResult.Dock = DevExpress.XtraBars.Docking.DockingStyle.Right;
            this.dockPanelResult.ID = new System.Guid("324e6132-3aa7-458f-848d-8ebbea578ea5");
            this.dockPanelResult.Location = new System.Drawing.Point(1086, 55);
            this.dockPanelResult.Name = "dockPanelResult";
            this.dockPanelResult.OriginalSize = new System.Drawing.Size(165, 200);
            this.dockPanelResult.Size = new System.Drawing.Size(165, 669);
            this.dockPanelResult.Text = "报警";
            // 
            // dockPanel2_Container
            // 
            this.dockPanel2_Container.Location = new System.Drawing.Point(4, 23);
            this.dockPanel2_Container.Name = "dockPanel2_Container";
            this.dockPanel2_Container.Size = new System.Drawing.Size(157, 642);
            this.dockPanel2_Container.TabIndex = 0;
            // 
            // dockPanel1
            // 
            this.dockPanel1.Controls.Add(this.dockPanel1_Container);
            this.dockPanel1.Dock = DevExpress.XtraBars.Docking.DockingStyle.Left;
            this.dockPanel1.ID = new System.Guid("e603f316-2b99-4234-84b6-2fcc0438bb24");
            this.dockPanel1.Location = new System.Drawing.Point(0, 55);
            this.dockPanel1.Name = "dockPanel1";
            this.dockPanel1.Options.AllowFloating = false;
            this.dockPanel1.Options.FloatOnDblClick = false;
            this.dockPanel1.Options.ShowAutoHideButton = false;
            this.dockPanel1.Options.ShowCloseButton = false;
            this.dockPanel1.OriginalSize = new System.Drawing.Size(200, 200);
            this.dockPanel1.Size = new System.Drawing.Size(200, 669);
            this.dockPanel1.Text = "导航";
            // 
            // dockPanel1_Container
            // 
            this.dockPanel1_Container.Controls.Add(this.splitContainerControl1);
            this.dockPanel1_Container.Location = new System.Drawing.Point(4, 23);
            this.dockPanel1_Container.Name = "dockPanel1_Container";
            this.dockPanel1_Container.Size = new System.Drawing.Size(192, 642);
            this.dockPanel1_Container.TabIndex = 0;
            // 
            // splitContainerControl1
            // 
            this.splitContainerControl1.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.Simple;
            this.splitContainerControl1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.splitContainerControl1.Horizontal = false;
            this.splitContainerControl1.Location = new System.Drawing.Point(0, 0);
            this.splitContainerControl1.Name = "splitContainerControl1";
            this.splitContainerControl1.Panel1.Controls.Add(this.splitContainerControl2);
            this.splitContainerControl1.Panel1.Text = "Panel1";
            this.splitContainerControl1.Panel2.Controls.Add(this.layoutControl2);
            this.splitContainerControl1.Panel2.Text = "Panel2";
            this.splitContainerControl1.Size = new System.Drawing.Size(192, 642);
            this.splitContainerControl1.SplitterPosition = 603;
            this.splitContainerControl1.TabIndex = 0;
            this.splitContainerControl1.Text = "splitContainerControl1";
            this.splitContainerControl1.Resize += new System.EventHandler(this.splitContainerControl1_Resize);
            this.splitContainerControl1.SplitterPositionChanged += new System.EventHandler(this.splitContainerControl1_SplitterPositionChanged);
            // 
            // splitContainerControl2
            // 
            this.splitContainerControl2.Dock = System.Windows.Forms.DockStyle.Fill;
            this.splitContainerControl2.Horizontal = false;
            this.splitContainerControl2.Location = new System.Drawing.Point(0, 0);
            this.splitContainerControl2.Name = "splitContainerControl2";
            this.splitContainerControl2.Panel1.Controls.Add(this.cameraView1);
            this.splitContainerControl2.Panel1.Text = "Panel1";
            this.splitContainerControl2.Panel2.Controls.Add(this.pictureEdit1);
            this.splitContainerControl2.Panel2.Text = "Panel2";
            this.splitContainerControl2.Size = new System.Drawing.Size(188, 603);
            this.splitContainerControl2.SplitterPosition = 403;
            this.splitContainerControl2.TabIndex = 6;
            this.splitContainerControl2.Text = "splitContainerControl2";
            // 
            // cameraView1
            // 
            this.cameraView1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.cameraView1.Location = new System.Drawing.Point(0, 0);
            this.cameraView1.Margin = new System.Windows.Forms.Padding(5, 3, 5, 3);
            this.cameraView1.Name = "cameraView1";
            this.cameraView1.Size = new System.Drawing.Size(188, 403);
            this.cameraView1.TabIndex = 4;
            this.cameraView1.Load += new System.EventHandler(this.cameraView1_Load);
            // 
            // pictureEdit1
            // 
            this.pictureEdit1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.pictureEdit1.Location = new System.Drawing.Point(0, 0);
            this.pictureEdit1.MenuManager = this.barManager1;
            this.pictureEdit1.Name = "pictureEdit1";
            this.pictureEdit1.Size = new System.Drawing.Size(188, 195);
            this.pictureEdit1.TabIndex = 5;
            // 
            // layoutControl2
            // 
            this.layoutControl2.Controls.Add(this.simpleButton1);
            this.layoutControl2.Controls.Add(this.simpleButton2);
            this.layoutControl2.Controls.Add(this.simpleButton3);
            this.layoutControl2.Controls.Add(this.simpleButton4);
            this.layoutControl2.Controls.Add(this.simpleButton5);
            this.layoutControl2.Dock = System.Windows.Forms.DockStyle.Fill;
            this.layoutControl2.Location = new System.Drawing.Point(0, 0);
            this.layoutControl2.Name = "layoutControl2";
            this.layoutControl2.Root = this.layoutControlGroup2;
            this.layoutControl2.Size = new System.Drawing.Size(188, 30);
            this.layoutControl2.TabIndex = 1;
            this.layoutControl2.Text = "layoutControl2";
            // 
            // simpleButton1
            // 
            this.simpleButton1.Location = new System.Drawing.Point(2, 2);
            this.simpleButton1.Name = "simpleButton1";
            this.simpleButton1.Size = new System.Drawing.Size(32, 22);
            this.simpleButton1.StyleController = this.layoutControl2;
            this.simpleButton1.TabIndex = 0;
            this.simpleButton1.Text = "1";
            this.simpleButton1.Click += new System.EventHandler(this.simpleButton1_Click);
            // 
            // simpleButton2
            // 
            this.simpleButton2.Location = new System.Drawing.Point(38, 2);
            this.simpleButton2.Name = "simpleButton2";
            this.simpleButton2.Size = new System.Drawing.Size(32, 22);
            this.simpleButton2.StyleController = this.layoutControl2;
            this.simpleButton2.TabIndex = 0;
            this.simpleButton2.Text = "4";
            this.simpleButton2.Click += new System.EventHandler(this.simpleButton2_Click);
            // 
            // simpleButton3
            // 
            this.simpleButton3.Location = new System.Drawing.Point(74, 2);
            this.simpleButton3.Name = "simpleButton3";
            this.simpleButton3.Size = new System.Drawing.Size(34, 22);
            this.simpleButton3.StyleController = this.layoutControl2;
            this.simpleButton3.TabIndex = 0;
            this.simpleButton3.Text = "9";
            this.simpleButton3.Click += new System.EventHandler(this.simpleButton3_Click);
            // 
            // simpleButton4
            // 
            this.simpleButton4.Location = new System.Drawing.Point(112, 2);
            this.simpleButton4.Name = "simpleButton4";
            this.simpleButton4.Size = new System.Drawing.Size(33, 22);
            this.simpleButton4.StyleController = this.layoutControl2;
            this.simpleButton4.TabIndex = 0;
            this.simpleButton4.Text = "16";
            this.simpleButton4.Click += new System.EventHandler(this.simpleButton4_Click);
            // 
            // simpleButton5
            // 
            this.simpleButton5.Location = new System.Drawing.Point(149, 2);
            this.simpleButton5.Name = "simpleButton5";
            this.simpleButton5.Size = new System.Drawing.Size(37, 22);
            this.simpleButton5.StyleController = this.layoutControl2;
            this.simpleButton5.TabIndex = 0;
            this.simpleButton5.Text = "25";
            this.simpleButton5.Click += new System.EventHandler(this.simpleButton5_Click);
            // 
            // layoutControlGroup2
            // 
            this.layoutControlGroup2.CustomizationFormText = "layoutControlGroup2";
            this.layoutControlGroup2.EnableIndentsWithoutBorders = DevExpress.Utils.DefaultBoolean.True;
            this.layoutControlGroup2.GroupBordersVisible = false;
            this.layoutControlGroup2.Items.AddRange(new DevExpress.XtraLayout.BaseLayoutItem[] {
            this.layoutControlItem4,
            this.layoutControlItem5,
            this.layoutControlItem6,
            this.layoutControlItem7,
            this.layoutControlItem8});
            this.layoutControlGroup2.Location = new System.Drawing.Point(0, 0);
            this.layoutControlGroup2.Name = "layoutControlGroup2";
            this.layoutControlGroup2.Padding = new DevExpress.XtraLayout.Utils.Padding(0, 0, 0, 0);
            this.layoutControlGroup2.Size = new System.Drawing.Size(188, 30);
            this.layoutControlGroup2.Spacing = new DevExpress.XtraLayout.Utils.Padding(0, 0, 0, 0);
            this.layoutControlGroup2.Text = "layoutControlGroup2";
            this.layoutControlGroup2.TextVisible = false;
            // 
            // layoutControlItem4
            // 
            this.layoutControlItem4.Control = this.simpleButton5;
            this.layoutControlItem4.CustomizationFormText = "layoutControlItem4";
            this.layoutControlItem4.Location = new System.Drawing.Point(147, 0);
            this.layoutControlItem4.Name = "layoutControlItem4";
            this.layoutControlItem4.Size = new System.Drawing.Size(41, 30);
            this.layoutControlItem4.Text = "layoutControlItem4";
            this.layoutControlItem4.TextSize = new System.Drawing.Size(0, 0);
            this.layoutControlItem4.TextToControlDistance = 0;
            this.layoutControlItem4.TextVisible = false;
            // 
            // layoutControlItem5
            // 
            this.layoutControlItem5.Control = this.simpleButton4;
            this.layoutControlItem5.CustomizationFormText = "layoutControlItem5";
            this.layoutControlItem5.Location = new System.Drawing.Point(110, 0);
            this.layoutControlItem5.Name = "layoutControlItem5";
            this.layoutControlItem5.Size = new System.Drawing.Size(37, 30);
            this.layoutControlItem5.Text = "layoutControlItem5";
            this.layoutControlItem5.TextSize = new System.Drawing.Size(0, 0);
            this.layoutControlItem5.TextToControlDistance = 0;
            this.layoutControlItem5.TextVisible = false;
            // 
            // layoutControlItem6
            // 
            this.layoutControlItem6.Control = this.simpleButton3;
            this.layoutControlItem6.CustomizationFormText = "layoutControlItem6";
            this.layoutControlItem6.Location = new System.Drawing.Point(72, 0);
            this.layoutControlItem6.Name = "layoutControlItem6";
            this.layoutControlItem6.Size = new System.Drawing.Size(38, 30);
            this.layoutControlItem6.Text = "layoutControlItem6";
            this.layoutControlItem6.TextSize = new System.Drawing.Size(0, 0);
            this.layoutControlItem6.TextToControlDistance = 0;
            this.layoutControlItem6.TextVisible = false;
            // 
            // layoutControlItem7
            // 
            this.layoutControlItem7.Control = this.simpleButton2;
            this.layoutControlItem7.CustomizationFormText = "layoutControlItem7";
            this.layoutControlItem7.Location = new System.Drawing.Point(36, 0);
            this.layoutControlItem7.Name = "layoutControlItem7";
            this.layoutControlItem7.Size = new System.Drawing.Size(36, 30);
            this.layoutControlItem7.Text = "layoutControlItem7";
            this.layoutControlItem7.TextSize = new System.Drawing.Size(0, 0);
            this.layoutControlItem7.TextToControlDistance = 0;
            this.layoutControlItem7.TextVisible = false;
            // 
            // layoutControlItem8
            // 
            this.layoutControlItem8.Control = this.simpleButton1;
            this.layoutControlItem8.CustomizationFormText = "layoutControlItem8";
            this.layoutControlItem8.Location = new System.Drawing.Point(0, 0);
            this.layoutControlItem8.Name = "layoutControlItem8";
            this.layoutControlItem8.Size = new System.Drawing.Size(36, 30);
            this.layoutControlItem8.Text = "layoutControlItem8";
            this.layoutControlItem8.TextSize = new System.Drawing.Size(0, 0);
            this.layoutControlItem8.TextToControlDistance = 0;
            this.layoutControlItem8.TextVisible = false;
            // 
            // dockPanelAlarm
            // 
            this.dockPanelAlarm.Controls.Add(this.dockPanel3_Container);
            this.dockPanelAlarm.Dock = DevExpress.XtraBars.Docking.DockingStyle.Bottom;
            this.dockPanelAlarm.ID = new System.Guid("a9616fb8-8c7a-42f6-8822-ac9022a24a64");
            this.dockPanelAlarm.Location = new System.Drawing.Point(200, 411);
            this.dockPanelAlarm.Name = "dockPanelAlarm";
            this.dockPanelAlarm.OriginalSize = new System.Drawing.Size(200, 313);
            this.dockPanelAlarm.Size = new System.Drawing.Size(886, 313);
            this.dockPanelAlarm.Text = "结果";
            // 
            // dockPanel3_Container
            // 
            this.dockPanel3_Container.Controls.Add(this.pcBottom);
            this.dockPanel3_Container.Location = new System.Drawing.Point(4, 23);
            this.dockPanel3_Container.Name = "dockPanel3_Container";
            this.dockPanel3_Container.Size = new System.Drawing.Size(878, 286);
            this.dockPanel3_Container.TabIndex = 0;
            // 
            // pcBottom
            // 
            this.pcBottom.Controls.Add(this.xtraTabControlResult);
            this.pcBottom.Dock = System.Windows.Forms.DockStyle.Fill;
            this.pcBottom.Location = new System.Drawing.Point(0, 0);
            this.pcBottom.Name = "pcBottom";
            this.pcBottom.Size = new System.Drawing.Size(878, 286);
            this.pcBottom.TabIndex = 6;
            // 
            // xtraTabControlResult
            // 
            this.xtraTabControlResult.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.NoBorder;
            this.xtraTabControlResult.Dock = System.Windows.Forms.DockStyle.Fill;
            this.xtraTabControlResult.Location = new System.Drawing.Point(2, 2);
            this.xtraTabControlResult.Name = "xtraTabControlResult";
            this.xtraTabControlResult.SelectedTabPage = this.xtraTabPageEvent;
            this.xtraTabControlResult.Size = new System.Drawing.Size(874, 282);
            this.xtraTabControlResult.TabIndex = 0;
            this.xtraTabControlResult.TabPages.AddRange(new DevExpress.XtraTab.XtraTabPage[] {
            this.xtraTabPageEvent,
            this.xtraTabPageVehicle,
            this.xtraTabPageFace});
            // 
            // xtraTabPageEvent
            // 
            this.xtraTabPageEvent.Controls.Add(this.panelControl2);
            this.xtraTabPageEvent.Controls.Add(this.panelControl1);
            this.xtraTabPageEvent.Name = "xtraTabPageEvent";
            this.xtraTabPageEvent.Size = new System.Drawing.Size(868, 254);
            this.xtraTabPageEvent.Text = "事件";
            // 
            // panelControl2
            // 
            this.panelControl2.Controls.Add(this.splitContainerControl7);
            this.panelControl2.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panelControl2.Location = new System.Drawing.Point(0, 52);
            this.panelControl2.Name = "panelControl2";
            this.panelControl2.Size = new System.Drawing.Size(868, 202);
            this.panelControl2.TabIndex = 1;
            // 
            // splitContainerControl7
            // 
            this.splitContainerControl7.Dock = System.Windows.Forms.DockStyle.Fill;
            this.splitContainerControl7.Location = new System.Drawing.Point(2, 2);
            this.splitContainerControl7.Name = "splitContainerControl7";
            this.splitContainerControl7.Panel1.Controls.Add(this.gridControlEvent);
            this.splitContainerControl7.Panel1.Text = "Panel1";
            this.splitContainerControl7.Panel2.Controls.Add(this.splitContainerControl8);
            this.splitContainerControl7.Panel2.Text = "Panel2";
            this.splitContainerControl7.Size = new System.Drawing.Size(864, 198);
            this.splitContainerControl7.SplitterPosition = 309;
            this.splitContainerControl7.TabIndex = 0;
            this.splitContainerControl7.Text = "splitContainerControl7";
            // 
            // gridControlEvent
            // 
            this.gridControlEvent.Dock = System.Windows.Forms.DockStyle.Fill;
            this.gridControlEvent.Location = new System.Drawing.Point(0, 0);
            this.gridControlEvent.MainView = this.advBandedGridViewEvent;
            this.gridControlEvent.MenuManager = this.barManager1;
            this.gridControlEvent.Name = "gridControlEvent";
            this.gridControlEvent.Size = new System.Drawing.Size(309, 198);
            this.gridControlEvent.TabIndex = 0;
            this.gridControlEvent.ViewCollection.AddRange(new DevExpress.XtraGrid.Views.Base.BaseView[] {
            this.advBandedGridViewEvent});
            // 
            // advBandedGridViewEvent
            // 
            this.advBandedGridViewEvent.Bands.AddRange(new DevExpress.XtraGrid.Views.BandedGrid.GridBand[] {
            this.gridBand5,
            this.gridBand7,
            this.gridBand8});
            this.advBandedGridViewEvent.Columns.AddRange(new DevExpress.XtraGrid.Views.BandedGrid.BandedGridColumn[] {
            this.bandedGridColumn12,
            this.bandedGridColumn14,
            this.bandedGridColumn15});
            this.advBandedGridViewEvent.GridControl = this.gridControlEvent;
            this.advBandedGridViewEvent.Name = "advBandedGridViewEvent";
            this.advBandedGridViewEvent.OptionsBehavior.AllowAddRows = DevExpress.Utils.DefaultBoolean.False;
            this.advBandedGridViewEvent.OptionsBehavior.AllowDeleteRows = DevExpress.Utils.DefaultBoolean.False;
            this.advBandedGridViewEvent.OptionsBehavior.Editable = false;
            this.advBandedGridViewEvent.OptionsBehavior.ReadOnly = true;
            this.advBandedGridViewEvent.OptionsView.ShowBands = false;
            this.advBandedGridViewEvent.OptionsView.ShowGroupPanel = false;
            // 
            // gridBand5
            // 
            this.gridBand5.Caption = "基本信息";
            this.gridBand5.Columns.Add(this.bandedGridColumn12);
            this.gridBand5.Columns.Add(this.bandedGridColumn15);
            this.gridBand5.Columns.Add(this.bandedGridColumn14);
            this.gridBand5.MinWidth = 20;
            this.gridBand5.Name = "gridBand5";
            this.gridBand5.Width = 217;
            // 
            // bandedGridColumn12
            // 
            this.bandedGridColumn12.Caption = "索引号";
            this.bandedGridColumn12.Name = "bandedGridColumn12";
            this.bandedGridColumn12.Visible = true;
            this.bandedGridColumn12.Width = 217;
            // 
            // bandedGridColumn15
            // 
            this.bandedGridColumn15.Caption = "地点";
            this.bandedGridColumn15.Name = "bandedGridColumn15";
            this.bandedGridColumn15.RowIndex = 1;
            this.bandedGridColumn15.Visible = true;
            this.bandedGridColumn15.Width = 89;
            // 
            // bandedGridColumn14
            // 
            this.bandedGridColumn14.Caption = "时间";
            this.bandedGridColumn14.Name = "bandedGridColumn14";
            this.bandedGridColumn14.RowIndex = 1;
            this.bandedGridColumn14.Visible = true;
            this.bandedGridColumn14.Width = 128;
            // 
            // gridBand7
            // 
            this.gridBand7.Caption = "物体信息";
            this.gridBand7.MinWidth = 20;
            this.gridBand7.Name = "gridBand7";
            this.gridBand7.Width = 63;
            // 
            // gridBand8
            // 
            this.gridBand8.Caption = "rect信息";
            this.gridBand8.MinWidth = 20;
            this.gridBand8.Name = "gridBand8";
            this.gridBand8.Width = 75;
            // 
            // splitContainerControl8
            // 
            this.splitContainerControl8.Dock = System.Windows.Forms.DockStyle.Fill;
            this.splitContainerControl8.Location = new System.Drawing.Point(0, 0);
            this.splitContainerControl8.Name = "splitContainerControl8";
            this.splitContainerControl8.Panel1.Controls.Add(this.pictureEditEvent);
            this.splitContainerControl8.Panel1.Text = "Panel1";
            this.splitContainerControl8.Panel2.Controls.Add(this.splitContainerControlEventVideo);
            this.splitContainerControl8.Panel2.Text = "Panel2";
            this.splitContainerControl8.Size = new System.Drawing.Size(550, 198);
            this.splitContainerControl8.SplitterPosition = 301;
            this.splitContainerControl8.TabIndex = 0;
            this.splitContainerControl8.Text = "splitContainerControl8";
            // 
            // pictureEditEvent
            // 
            this.pictureEditEvent.Dock = System.Windows.Forms.DockStyle.Fill;
            this.pictureEditEvent.Location = new System.Drawing.Point(0, 0);
            this.pictureEditEvent.MenuManager = this.barManager1;
            this.pictureEditEvent.Name = "pictureEditEvent";
            this.pictureEditEvent.Size = new System.Drawing.Size(301, 198);
            this.pictureEditEvent.TabIndex = 0;
            // 
            // splitContainerControlEventVideo
            // 
            this.splitContainerControlEventVideo.Dock = System.Windows.Forms.DockStyle.Fill;
            this.splitContainerControlEventVideo.Horizontal = false;
            this.splitContainerControlEventVideo.Location = new System.Drawing.Point(0, 0);
            this.splitContainerControlEventVideo.Name = "splitContainerControlEventVideo";
            this.splitContainerControlEventVideo.Panel1.Text = "Panel1";
            this.splitContainerControlEventVideo.Panel2.Controls.Add(this.simpleButton6);
            this.splitContainerControlEventVideo.Panel2.Controls.Add(this.simpleButtonPlay);
            this.splitContainerControlEventVideo.Panel2.Controls.Add(this.simpleButton14);
            this.splitContainerControlEventVideo.Panel2.Text = "Panel2";
            this.splitContainerControlEventVideo.Size = new System.Drawing.Size(244, 198);
            this.splitContainerControlEventVideo.SplitterPosition = 167;
            this.splitContainerControlEventVideo.TabIndex = 0;
            this.splitContainerControlEventVideo.Text = "splitContainerControl9";
            // 
            // simpleButton6
            // 
            this.simpleButton6.Location = new System.Drawing.Point(169, 2);
            this.simpleButton6.Name = "simpleButton6";
            this.simpleButton6.Size = new System.Drawing.Size(77, 22);
            this.simpleButton6.StyleController = this.layoutControl1;
            this.simpleButton6.TabIndex = 3;
            this.simpleButton6.Text = "口";
            this.simpleButton6.Click += new System.EventHandler(this.simpleButton6_Click);
            // 
            // layoutControl1
            // 
            this.layoutControl1.Controls.Add(this.simpleButton9);
            this.layoutControl1.Controls.Add(this.simpleButton7);
            this.layoutControl1.Controls.Add(this.simpleButton8);
            this.layoutControl1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.layoutControl1.Location = new System.Drawing.Point(0, 0);
            this.layoutControl1.Name = "layoutControl1";
            this.layoutControl1.Root = this.layoutControlGroup1;
            this.layoutControl1.Size = new System.Drawing.Size(249, 26);
            this.layoutControl1.TabIndex = 0;
            this.layoutControl1.Text = "layoutControl1";
            // 
            // simpleButton9
            // 
            this.simpleButton9.Location = new System.Drawing.Point(170, 2);
            this.simpleButton9.Name = "simpleButton9";
            this.simpleButton9.Size = new System.Drawing.Size(77, 22);
            this.simpleButton9.StyleController = this.layoutControl1;
            this.simpleButton9.TabIndex = 0;
            this.simpleButton9.Text = "口";
            this.simpleButton9.Click += new System.EventHandler(this.simpleButton9_Click);
            // 
            // simpleButton7
            // 
            this.simpleButton7.Location = new System.Drawing.Point(2, 2);
            this.simpleButton7.Name = "simpleButton7";
            this.simpleButton7.Size = new System.Drawing.Size(78, 22);
            this.simpleButton7.StyleController = this.layoutControl1;
            this.simpleButton7.TabIndex = 0;
            this.simpleButton7.Text = ">";
            this.simpleButton7.Click += new System.EventHandler(this.simpleButton7_Click);
            // 
            // simpleButton8
            // 
            this.simpleButton8.Location = new System.Drawing.Point(84, 2);
            this.simpleButton8.Name = "simpleButton8";
            this.simpleButton8.Size = new System.Drawing.Size(82, 22);
            this.simpleButton8.StyleController = this.layoutControl1;
            this.simpleButton8.TabIndex = 0;
            this.simpleButton8.Text = "||";
            this.simpleButton8.Click += new System.EventHandler(this.simpleButton8_Click);
            // 
            // layoutControlGroup1
            // 
            this.layoutControlGroup1.CustomizationFormText = "layoutControlGroup1";
            this.layoutControlGroup1.EnableIndentsWithoutBorders = DevExpress.Utils.DefaultBoolean.True;
            this.layoutControlGroup1.GroupBordersVisible = false;
            this.layoutControlGroup1.Items.AddRange(new DevExpress.XtraLayout.BaseLayoutItem[] {
            this.layoutControlItem1,
            this.layoutControlItem2,
            this.layoutControlItem3});
            this.layoutControlGroup1.Location = new System.Drawing.Point(0, 0);
            this.layoutControlGroup1.Name = "layoutControlGroup1";
            this.layoutControlGroup1.Padding = new DevExpress.XtraLayout.Utils.Padding(0, 0, 0, 0);
            this.layoutControlGroup1.Size = new System.Drawing.Size(249, 26);
            this.layoutControlGroup1.Spacing = new DevExpress.XtraLayout.Utils.Padding(0, 0, 0, 0);
            this.layoutControlGroup1.Text = "layoutControlGroup1";
            this.layoutControlGroup1.TextVisible = false;
            // 
            // layoutControlItem1
            // 
            this.layoutControlItem1.Control = this.simpleButton7;
            this.layoutControlItem1.CustomizationFormText = "layoutControlItem1";
            this.layoutControlItem1.Location = new System.Drawing.Point(0, 0);
            this.layoutControlItem1.Name = "layoutControlItem1";
            this.layoutControlItem1.Size = new System.Drawing.Size(82, 26);
            this.layoutControlItem1.Text = "layoutControlItem1";
            this.layoutControlItem1.TextSize = new System.Drawing.Size(0, 0);
            this.layoutControlItem1.TextToControlDistance = 0;
            this.layoutControlItem1.TextVisible = false;
            // 
            // layoutControlItem2
            // 
            this.layoutControlItem2.Control = this.simpleButton8;
            this.layoutControlItem2.CustomizationFormText = "layoutControlItem2";
            this.layoutControlItem2.Location = new System.Drawing.Point(82, 0);
            this.layoutControlItem2.Name = "layoutControlItem2";
            this.layoutControlItem2.Size = new System.Drawing.Size(86, 26);
            this.layoutControlItem2.Text = "layoutControlItem2";
            this.layoutControlItem2.TextSize = new System.Drawing.Size(0, 0);
            this.layoutControlItem2.TextToControlDistance = 0;
            this.layoutControlItem2.TextVisible = false;
            // 
            // layoutControlItem3
            // 
            this.layoutControlItem3.Control = this.simpleButton9;
            this.layoutControlItem3.CustomizationFormText = "layoutControlItem3";
            this.layoutControlItem3.Location = new System.Drawing.Point(168, 0);
            this.layoutControlItem3.Name = "layoutControlItem3";
            this.layoutControlItem3.Size = new System.Drawing.Size(81, 26);
            this.layoutControlItem3.Text = "layoutControlItem3";
            this.layoutControlItem3.TextSize = new System.Drawing.Size(0, 0);
            this.layoutControlItem3.TextToControlDistance = 0;
            this.layoutControlItem3.TextVisible = false;
            // 
            // simpleButtonPlay
            // 
            this.simpleButtonPlay.Location = new System.Drawing.Point(1, 2);
            this.simpleButtonPlay.Name = "simpleButtonPlay";
            this.simpleButtonPlay.Size = new System.Drawing.Size(78, 22);
            this.simpleButtonPlay.StyleController = this.layoutControl1;
            this.simpleButtonPlay.TabIndex = 2;
            this.simpleButtonPlay.Text = ">";
            this.simpleButtonPlay.Click += new System.EventHandler(this.simpleButtonPlay_Click);
            // 
            // simpleButton14
            // 
            this.simpleButton14.Location = new System.Drawing.Point(83, 2);
            this.simpleButton14.Name = "simpleButton14";
            this.simpleButton14.Size = new System.Drawing.Size(82, 22);
            this.simpleButton14.StyleController = this.layoutControl1;
            this.simpleButton14.TabIndex = 1;
            this.simpleButton14.Text = "||";
            this.simpleButton14.Click += new System.EventHandler(this.simpleButton14_Click);
            // 
            // panelControl1
            // 
            this.panelControl1.Controls.Add(this.checkedComboBoxEditUserSelection);
            this.panelControl1.Controls.Add(this.labelControl7);
            this.panelControl1.Controls.Add(this.lblEventCurrentPage);
            this.panelControl1.Controls.Add(this.labelControl9);
            this.panelControl1.Controls.Add(this.labelControl10);
            this.panelControl1.Controls.Add(this.cbeEventNumberPerPage);
            this.panelControl1.Controls.Add(this.btnEventLastPage);
            this.panelControl1.Controls.Add(this.btnEventNextPage);
            this.panelControl1.Controls.Add(this.btnEventPrevPage);
            this.panelControl1.Controls.Add(this.btnEventFirstPage);
            this.panelControl1.Controls.Add(this.btnQueryEvent);
            this.panelControl1.Controls.Add(this.labelControl11);
            this.panelControl1.Controls.Add(this.labelControl12);
            this.panelControl1.Controls.Add(this.teStartTimeEvent);
            this.panelControl1.Controls.Add(this.teEndTimeEvent);
            this.panelControl1.Controls.Add(this.checkedComboBoxEditEventCamera);
            this.panelControl1.Controls.Add(this.labelControl13);
            this.panelControl1.Controls.Add(this.radioGroupEvent);
            this.panelControl1.Dock = System.Windows.Forms.DockStyle.Top;
            this.panelControl1.Location = new System.Drawing.Point(0, 0);
            this.panelControl1.Name = "panelControl1";
            this.panelControl1.Size = new System.Drawing.Size(868, 52);
            this.panelControl1.TabIndex = 0;
            // 
            // checkedComboBoxEditUserSelection
            // 
            this.checkedComboBoxEditUserSelection.Location = new System.Drawing.Point(471, 28);
            this.checkedComboBoxEditUserSelection.MenuManager = this.barManager1;
            this.checkedComboBoxEditUserSelection.Name = "checkedComboBoxEditUserSelection";
            this.checkedComboBoxEditUserSelection.Properties.Buttons.AddRange(new DevExpress.XtraEditors.Controls.EditorButton[] {
            new DevExpress.XtraEditors.Controls.EditorButton(DevExpress.XtraEditors.Controls.ButtonPredefines.Combo)});
            this.checkedComboBoxEditUserSelection.Size = new System.Drawing.Size(118, 21);
            this.checkedComboBoxEditUserSelection.TabIndex = 50;
            // 
            // labelControl7
            // 
            this.labelControl7.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.NoBorder;
            this.labelControl7.Location = new System.Drawing.Point(405, 33);
            this.labelControl7.Name = "labelControl7";
            this.labelControl7.Size = new System.Drawing.Size(60, 14);
            this.labelControl7.TabIndex = 49;
            this.labelControl7.Text = "用户显示：";
            // 
            // lblEventCurrentPage
            // 
            this.lblEventCurrentPage.Location = new System.Drawing.Point(311, 33);
            this.lblEventCurrentPage.Name = "lblEventCurrentPage";
            this.lblEventCurrentPage.Size = new System.Drawing.Size(67, 14);
            this.lblEventCurrentPage.TabIndex = 48;
            this.lblEventCurrentPage.Text = "当前：1/1页";
            // 
            // labelControl9
            // 
            this.labelControl9.Location = new System.Drawing.Point(183, 33);
            this.labelControl9.Name = "labelControl9";
            this.labelControl9.Size = new System.Drawing.Size(24, 14);
            this.labelControl9.TabIndex = 45;
            this.labelControl9.Text = "每页";
            // 
            // labelControl10
            // 
            this.labelControl10.Location = new System.Drawing.Point(297, 33);
            this.labelControl10.Name = "labelControl10";
            this.labelControl10.Size = new System.Drawing.Size(12, 14);
            this.labelControl10.TabIndex = 46;
            this.labelControl10.Text = "项";
            // 
            // cbeEventNumberPerPage
            // 
            this.cbeEventNumberPerPage.EditValue = "20";
            this.cbeEventNumberPerPage.Location = new System.Drawing.Point(211, 27);
            this.cbeEventNumberPerPage.Name = "cbeEventNumberPerPage";
            this.cbeEventNumberPerPage.Properties.Buttons.AddRange(new DevExpress.XtraEditors.Controls.EditorButton[] {
            new DevExpress.XtraEditors.Controls.EditorButton(DevExpress.XtraEditors.Controls.ButtonPredefines.Combo)});
            this.cbeEventNumberPerPage.Properties.Items.AddRange(new object[] {
            "5",
            "10",
            "20",
            "50",
            "100",
            "200"});
            this.cbeEventNumberPerPage.Properties.TextEditStyle = DevExpress.XtraEditors.Controls.TextEditStyles.DisableTextEditor;
            this.cbeEventNumberPerPage.Size = new System.Drawing.Size(79, 21);
            this.cbeEventNumberPerPage.TabIndex = 47;
            this.cbeEventNumberPerPage.SelectedValueChanged += new System.EventHandler(this.cbeEventNumberPerPage_SelectedValueChanged);
            // 
            // btnEventLastPage
            // 
            this.btnEventLastPage.Location = new System.Drawing.Point(150, 25);
            this.btnEventLastPage.Name = "btnEventLastPage";
            this.btnEventLastPage.Size = new System.Drawing.Size(26, 24);
            this.btnEventLastPage.TabIndex = 43;
            this.btnEventLastPage.Text = ">|";
            this.btnEventLastPage.Click += new System.EventHandler(this.btnEventLastPage_Click);
            // 
            // btnEventNextPage
            // 
            this.btnEventNextPage.Location = new System.Drawing.Point(120, 25);
            this.btnEventNextPage.Name = "btnEventNextPage";
            this.btnEventNextPage.Size = new System.Drawing.Size(26, 24);
            this.btnEventNextPage.TabIndex = 42;
            this.btnEventNextPage.Text = ">";
            this.btnEventNextPage.Click += new System.EventHandler(this.btnEventNextPage_Click);
            // 
            // btnEventPrevPage
            // 
            this.btnEventPrevPage.Location = new System.Drawing.Point(90, 25);
            this.btnEventPrevPage.Name = "btnEventPrevPage";
            this.btnEventPrevPage.Size = new System.Drawing.Size(26, 24);
            this.btnEventPrevPage.TabIndex = 41;
            this.btnEventPrevPage.Text = "<";
            this.btnEventPrevPage.Click += new System.EventHandler(this.btnEventPrePage_Click);
            // 
            // btnEventFirstPage
            // 
            this.btnEventFirstPage.Location = new System.Drawing.Point(60, 25);
            this.btnEventFirstPage.Name = "btnEventFirstPage";
            this.btnEventFirstPage.Size = new System.Drawing.Size(26, 24);
            this.btnEventFirstPage.TabIndex = 44;
            this.btnEventFirstPage.Text = "|<";
            this.btnEventFirstPage.Click += new System.EventHandler(this.btnEventFirstPage_Click);
            // 
            // btnQueryEvent
            // 
            this.btnQueryEvent.Appearance.Font = new System.Drawing.Font("Tahoma", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnQueryEvent.Appearance.Options.UseFont = true;
            this.btnQueryEvent.Dock = System.Windows.Forms.DockStyle.Right;
            this.btnQueryEvent.Enabled = false;
            this.btnQueryEvent.ImeMode = System.Windows.Forms.ImeMode.Alpha;
            this.btnQueryEvent.Location = new System.Drawing.Point(806, 2);
            this.btnQueryEvent.Name = "btnQueryEvent";
            this.btnQueryEvent.Size = new System.Drawing.Size(60, 48);
            this.btnQueryEvent.TabIndex = 40;
            this.btnQueryEvent.Text = "查询";
            this.btnQueryEvent.Click += new System.EventHandler(this.btnQueryEvent_Click);
            // 
            // labelControl11
            // 
            this.labelControl11.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.NoBorder;
            this.labelControl11.Location = new System.Drawing.Point(271, 6);
            this.labelControl11.Name = "labelControl11";
            this.labelControl11.Size = new System.Drawing.Size(60, 14);
            this.labelControl11.TabIndex = 36;
            this.labelControl11.Text = "开始时间：";
            // 
            // labelControl12
            // 
            this.labelControl12.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.NoBorder;
            this.labelControl12.Location = new System.Drawing.Point(506, 6);
            this.labelControl12.Name = "labelControl12";
            this.labelControl12.Size = new System.Drawing.Size(60, 14);
            this.labelControl12.TabIndex = 37;
            this.labelControl12.Text = "结束时间：";
            // 
            // teStartTimeEvent
            // 
            this.teStartTimeEvent.EditValue = new System.DateTime(2010, 10, 30, 11, 0, 0, 0);
            this.teStartTimeEvent.Enabled = false;
            this.teStartTimeEvent.Location = new System.Drawing.Point(337, 3);
            this.teStartTimeEvent.Name = "teStartTimeEvent";
            this.teStartTimeEvent.Properties.Buttons.AddRange(new DevExpress.XtraEditors.Controls.EditorButton[] {
            new DevExpress.XtraEditors.Controls.EditorButton()});
            this.teStartTimeEvent.Properties.Mask.EditMask = "G";
            this.teStartTimeEvent.Size = new System.Drawing.Size(145, 21);
            this.teStartTimeEvent.TabIndex = 38;
            // 
            // teEndTimeEvent
            // 
            this.teEndTimeEvent.EditValue = new System.DateTime(2010, 1, 11, 10, 0, 0, 0);
            this.teEndTimeEvent.Enabled = false;
            this.teEndTimeEvent.Location = new System.Drawing.Point(572, 3);
            this.teEndTimeEvent.Name = "teEndTimeEvent";
            this.teEndTimeEvent.Properties.Buttons.AddRange(new DevExpress.XtraEditors.Controls.EditorButton[] {
            new DevExpress.XtraEditors.Controls.EditorButton()});
            this.teEndTimeEvent.Properties.Mask.EditMask = "G";
            this.teEndTimeEvent.Size = new System.Drawing.Size(138, 21);
            this.teEndTimeEvent.TabIndex = 39;
            // 
            // checkedComboBoxEditEventCamera
            // 
            this.checkedComboBoxEditEventCamera.Location = new System.Drawing.Point(111, 3);
            this.checkedComboBoxEditEventCamera.MenuManager = this.barManager1;
            this.checkedComboBoxEditEventCamera.Name = "checkedComboBoxEditEventCamera";
            this.checkedComboBoxEditEventCamera.Properties.Buttons.AddRange(new DevExpress.XtraEditors.Controls.EditorButton[] {
            new DevExpress.XtraEditors.Controls.EditorButton(DevExpress.XtraEditors.Controls.ButtonPredefines.Combo)});
            this.checkedComboBoxEditEventCamera.Size = new System.Drawing.Size(117, 21);
            this.checkedComboBoxEditEventCamera.TabIndex = 35;
            // 
            // labelControl13
            // 
            this.labelControl13.Location = new System.Drawing.Point(65, 6);
            this.labelControl13.Name = "labelControl13";
            this.labelControl13.Size = new System.Drawing.Size(40, 14);
            this.labelControl13.TabIndex = 34;
            this.labelControl13.Text = "摄像头:";
            // 
            // radioGroupEvent
            // 
            this.radioGroupEvent.Dock = System.Windows.Forms.DockStyle.Left;
            this.radioGroupEvent.Location = new System.Drawing.Point(2, 2);
            this.radioGroupEvent.MenuManager = this.barManager1;
            this.radioGroupEvent.Name = "radioGroupEvent";
            this.radioGroupEvent.Properties.Items.AddRange(new DevExpress.XtraEditors.Controls.RadioGroupItem[] {
            new DevExpress.XtraEditors.Controls.RadioGroupItem(null, "实时"),
            new DevExpress.XtraEditors.Controls.RadioGroupItem(null, "历史")});
            this.radioGroupEvent.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.radioGroupEvent.Size = new System.Drawing.Size(57, 48);
            this.radioGroupEvent.TabIndex = 33;
            this.radioGroupEvent.SelectedIndexChanged += new System.EventHandler(this.radioGroupEvent_SelectedIndexChanged);
            // 
            // xtraTabPageVehicle
            // 
            this.xtraTabPageVehicle.Controls.Add(this.panelControl3);
            this.xtraTabPageVehicle.Controls.Add(this.panelControl4);
            this.xtraTabPageVehicle.Name = "xtraTabPageVehicle";
            this.xtraTabPageVehicle.Size = new System.Drawing.Size(868, 254);
            this.xtraTabPageVehicle.Text = "车牌";
            // 
            // panelControl3
            // 
            this.panelControl3.Controls.Add(this.splitContainerControl5);
            this.panelControl3.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panelControl3.Location = new System.Drawing.Point(0, 52);
            this.panelControl3.Name = "panelControl3";
            this.panelControl3.Size = new System.Drawing.Size(868, 202);
            this.panelControl3.TabIndex = 3;
            // 
            // splitContainerControl5
            // 
            this.splitContainerControl5.Dock = System.Windows.Forms.DockStyle.Fill;
            this.splitContainerControl5.Location = new System.Drawing.Point(2, 2);
            this.splitContainerControl5.Name = "splitContainerControl5";
            this.splitContainerControl5.Panel1.Controls.Add(this.gridControlVehicle);
            this.splitContainerControl5.Panel1.Text = "Panel1";
            this.splitContainerControl5.Panel2.Controls.Add(this.splitContainerControl6);
            this.splitContainerControl5.Panel2.Text = "Panel2";
            this.splitContainerControl5.Size = new System.Drawing.Size(864, 198);
            this.splitContainerControl5.SplitterPosition = 329;
            this.splitContainerControl5.TabIndex = 0;
            this.splitContainerControl5.Text = "splitContainerControl5";
            // 
            // gridControlVehicle
            // 
            this.gridControlVehicle.Dock = System.Windows.Forms.DockStyle.Fill;
            this.gridControlVehicle.Location = new System.Drawing.Point(0, 0);
            this.gridControlVehicle.MainView = this.advBandedGridViewVehicle;
            this.gridControlVehicle.MenuManager = this.barManager1;
            this.gridControlVehicle.Name = "gridControlVehicle";
            this.gridControlVehicle.Size = new System.Drawing.Size(329, 198);
            this.gridControlVehicle.TabIndex = 0;
            this.gridControlVehicle.ViewCollection.AddRange(new DevExpress.XtraGrid.Views.Base.BaseView[] {
            this.advBandedGridViewVehicle});
            // 
            // advBandedGridViewVehicle
            // 
            this.advBandedGridViewVehicle.Bands.AddRange(new DevExpress.XtraGrid.Views.BandedGrid.GridBand[] {
            this.gridBand3,
            this.gridBand4});
            this.advBandedGridViewVehicle.Columns.AddRange(new DevExpress.XtraGrid.Views.BandedGrid.BandedGridColumn[] {
            this.bandedGridColumn7,
            this.bandedGridColumn8,
            this.bandedGridColumn9,
            this.bandedGridColumn10,
            this.bandedGridColumn11,
            this.bandedGridColumn13,
            this.bandedGridColumn17,
            this.bandedGridColumn18,
            this.bandedGridColumn19,
            this.bandedGridColumn20,
            this.bandedGridColumn21,
            this.bandedGridColumn22,
            this.bandedGridColumn23});
            this.advBandedGridViewVehicle.GridControl = this.gridControlVehicle;
            this.advBandedGridViewVehicle.Name = "advBandedGridViewVehicle";
            this.advBandedGridViewVehicle.OptionsBehavior.AllowAddRows = DevExpress.Utils.DefaultBoolean.False;
            this.advBandedGridViewVehicle.OptionsBehavior.AllowDeleteRows = DevExpress.Utils.DefaultBoolean.False;
            this.advBandedGridViewVehicle.OptionsBehavior.Editable = false;
            this.advBandedGridViewVehicle.OptionsBehavior.ReadOnly = true;
            this.advBandedGridViewVehicle.OptionsView.ShowBands = false;
            this.advBandedGridViewVehicle.OptionsView.ShowGroupPanel = false;
            this.advBandedGridViewVehicle.SelectionChanged += new DevExpress.Data.SelectionChangedEventHandler(this.advBandedGridView1_SelectionChanged);
            this.advBandedGridViewVehicle.RowClick += new DevExpress.XtraGrid.Views.Grid.RowClickEventHandler(this.advBandedGridView1_RowClick);
            this.advBandedGridViewVehicle.CustomDrawRowIndicator += new DevExpress.XtraGrid.Views.Grid.RowIndicatorCustomDrawEventHandler(this.advBandedGridView1_CustomDrawRowIndicator);
            // 
            // gridBand3
            // 
            this.gridBand3.Caption = "基本信息";
            this.gridBand3.Columns.Add(this.bandedGridColumn7);
            this.gridBand3.Columns.Add(this.bandedGridColumn8);
            this.gridBand3.Columns.Add(this.bandedGridColumn9);
            this.gridBand3.Columns.Add(this.bandedGridColumn10);
            this.gridBand3.MinWidth = 20;
            this.gridBand3.Name = "gridBand3";
            this.gridBand3.Width = 196;
            // 
            // bandedGridColumn7
            // 
            this.bandedGridColumn7.Caption = "索引号";
            this.bandedGridColumn7.Name = "bandedGridColumn7";
            this.bandedGridColumn7.Visible = true;
            this.bandedGridColumn7.Width = 94;
            // 
            // bandedGridColumn8
            // 
            this.bandedGridColumn8.Caption = "置信度";
            this.bandedGridColumn8.Name = "bandedGridColumn8";
            this.bandedGridColumn8.Visible = true;
            this.bandedGridColumn8.Width = 102;
            // 
            // bandedGridColumn9
            // 
            this.bandedGridColumn9.Caption = "时间";
            this.bandedGridColumn9.Name = "bandedGridColumn9";
            this.bandedGridColumn9.RowIndex = 1;
            this.bandedGridColumn9.Visible = true;
            this.bandedGridColumn9.Width = 196;
            // 
            // bandedGridColumn10
            // 
            this.bandedGridColumn10.Caption = "地点";
            this.bandedGridColumn10.Name = "bandedGridColumn10";
            this.bandedGridColumn10.RowIndex = 2;
            this.bandedGridColumn10.Visible = true;
            this.bandedGridColumn10.Width = 196;
            // 
            // gridBand4
            // 
            this.gridBand4.Caption = "车辆";
            this.gridBand4.Columns.Add(this.bandedGridColumn11);
            this.gridBand4.MinWidth = 20;
            this.gridBand4.Name = "gridBand4";
            this.gridBand4.Width = 144;
            // 
            // bandedGridColumn11
            // 
            this.bandedGridColumn11.Caption = "车牌号";
            this.bandedGridColumn11.Name = "bandedGridColumn11";
            this.bandedGridColumn11.Visible = true;
            this.bandedGridColumn11.Width = 144;
            // 
            // bandedGridColumn13
            // 
            this.bandedGridColumn13.Caption = "车辆对象";
            this.bandedGridColumn13.Name = "bandedGridColumn13";
            this.bandedGridColumn13.Visible = true;
            // 
            // bandedGridColumn17
            // 
            this.bandedGridColumn17.Caption = "speed";
            this.bandedGridColumn17.Name = "bandedGridColumn17";
            this.bandedGridColumn17.Visible = true;
            // 
            // bandedGridColumn18
            // 
            this.bandedGridColumn18.Caption = "stemagainst";
            this.bandedGridColumn18.Name = "bandedGridColumn18";
            this.bandedGridColumn18.Visible = true;
            // 
            // bandedGridColumn19
            // 
            this.bandedGridColumn19.Caption = "stop";
            this.bandedGridColumn19.Name = "bandedGridColumn19";
            this.bandedGridColumn19.Visible = true;
            // 
            // bandedGridColumn20
            // 
            this.bandedGridColumn20.Caption = "accident";
            this.bandedGridColumn20.Name = "bandedGridColumn20";
            this.bandedGridColumn20.Visible = true;
            // 
            // bandedGridColumn21
            // 
            this.bandedGridColumn21.Caption = "linechange";
            this.bandedGridColumn21.Name = "bandedGridColumn21";
            this.bandedGridColumn21.Visible = true;
            // 
            // bandedGridColumn22
            // 
            this.bandedGridColumn22.Caption = "platecolor";
            this.bandedGridColumn22.Name = "bandedGridColumn22";
            this.bandedGridColumn22.Visible = true;
            // 
            // bandedGridColumn23
            // 
            this.bandedGridColumn23.Caption = "vehiclecolor";
            this.bandedGridColumn23.Name = "bandedGridColumn23";
            this.bandedGridColumn23.Visible = true;
            // 
            // splitContainerControl6
            // 
            this.splitContainerControl6.Dock = System.Windows.Forms.DockStyle.Fill;
            this.splitContainerControl6.Location = new System.Drawing.Point(0, 0);
            this.splitContainerControl6.Name = "splitContainerControl6";
            this.splitContainerControl6.Panel1.Controls.Add(this.pictureEditVehicle);
            this.splitContainerControl6.Panel1.Text = "Panel1";
            this.splitContainerControl6.Panel2.Controls.Add(this.splitContainerControlVideoVehicle);
            this.splitContainerControl6.Panel2.Text = "Panel2";
            this.splitContainerControl6.Size = new System.Drawing.Size(530, 198);
            this.splitContainerControl6.SplitterPosition = 303;
            this.splitContainerControl6.TabIndex = 0;
            this.splitContainerControl6.Text = "splitContainerControl6";
            // 
            // pictureEditVehicle
            // 
            this.pictureEditVehicle.Dock = System.Windows.Forms.DockStyle.Fill;
            this.pictureEditVehicle.Location = new System.Drawing.Point(0, 0);
            this.pictureEditVehicle.MenuManager = this.barManager1;
            this.pictureEditVehicle.Name = "pictureEditVehicle";
            this.pictureEditVehicle.Size = new System.Drawing.Size(303, 198);
            this.pictureEditVehicle.TabIndex = 0;
            // 
            // splitContainerControlVideoVehicle
            // 
            this.splitContainerControlVideoVehicle.Dock = System.Windows.Forms.DockStyle.Fill;
            this.splitContainerControlVideoVehicle.Horizontal = false;
            this.splitContainerControlVideoVehicle.Location = new System.Drawing.Point(0, 0);
            this.splitContainerControlVideoVehicle.Name = "splitContainerControlVideoVehicle";
            this.splitContainerControlVideoVehicle.Panel1.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.Default;
            this.splitContainerControlVideoVehicle.Panel1.Text = "Panel1";
            this.splitContainerControlVideoVehicle.Panel2.Controls.Add(this.simpleButton10);
            this.splitContainerControlVideoVehicle.Panel2.Controls.Add(this.simpleButton11);
            this.splitContainerControlVideoVehicle.Panel2.Controls.Add(this.simpleButton12);
            this.splitContainerControlVideoVehicle.Panel2.Text = "Panel2";
            this.splitContainerControlVideoVehicle.Size = new System.Drawing.Size(222, 198);
            this.splitContainerControlVideoVehicle.SplitterPosition = 167;
            this.splitContainerControlVideoVehicle.TabIndex = 0;
            this.splitContainerControlVideoVehicle.Text = "splitContainerControl7";
            // 
            // simpleButton10
            // 
            this.simpleButton10.Location = new System.Drawing.Point(168, 2);
            this.simpleButton10.Name = "simpleButton10";
            this.simpleButton10.Size = new System.Drawing.Size(77, 22);
            this.simpleButton10.StyleController = this.layoutControl1;
            this.simpleButton10.TabIndex = 3;
            this.simpleButton10.Text = "口";
            this.simpleButton10.Click += new System.EventHandler(this.simpleButton13_Click);
            // 
            // simpleButton11
            // 
            this.simpleButton11.Location = new System.Drawing.Point(0, 2);
            this.simpleButton11.Name = "simpleButton11";
            this.simpleButton11.Size = new System.Drawing.Size(78, 22);
            this.simpleButton11.StyleController = this.layoutControl1;
            this.simpleButton11.TabIndex = 2;
            this.simpleButton11.Text = ">";
            this.simpleButton11.Click += new System.EventHandler(this.simpleButton11_Click);
            // 
            // simpleButton12
            // 
            this.simpleButton12.Location = new System.Drawing.Point(82, 2);
            this.simpleButton12.Name = "simpleButton12";
            this.simpleButton12.Size = new System.Drawing.Size(82, 22);
            this.simpleButton12.StyleController = this.layoutControl1;
            this.simpleButton12.TabIndex = 1;
            this.simpleButton12.Text = "||";
            this.simpleButton12.Click += new System.EventHandler(this.simpleButton12_Click);
            // 
            // panelControl4
            // 
            this.panelControl4.Controls.Add(this.labelControl8);
            this.panelControl4.Controls.Add(this.lblVehicleCurrentPage);
            this.panelControl4.Controls.Add(this.comboBoxEdit1);
            this.panelControl4.Controls.Add(this.labelControl6);
            this.panelControl4.Controls.Add(this.btnVehicleLastPage);
            this.panelControl4.Controls.Add(this.btnVehicleNextPage);
            this.panelControl4.Controls.Add(this.btnVehiclePrePage);
            this.panelControl4.Controls.Add(this.btnVehicleFirstPage);
            this.panelControl4.Controls.Add(this.textEdit1);
            this.panelControl4.Controls.Add(this.labelControl2);
            this.panelControl4.Controls.Add(this.btnQueryVehicle);
            this.panelControl4.Controls.Add(this.labelControl3);
            this.panelControl4.Controls.Add(this.labelControl4);
            this.panelControl4.Controls.Add(this.teStartTimeVehicle);
            this.panelControl4.Controls.Add(this.teEndTimeVehicle);
            this.panelControl4.Controls.Add(this.checkedComboBoxEditVehicleCamera);
            this.panelControl4.Controls.Add(this.labelControl5);
            this.panelControl4.Controls.Add(this.radioGroupVehicle);
            this.panelControl4.Dock = System.Windows.Forms.DockStyle.Top;
            this.panelControl4.Location = new System.Drawing.Point(0, 0);
            this.panelControl4.Name = "panelControl4";
            this.panelControl4.Size = new System.Drawing.Size(868, 52);
            this.panelControl4.TabIndex = 2;
            // 
            // labelControl8
            // 
            this.labelControl8.Location = new System.Drawing.Point(306, 29);
            this.labelControl8.Name = "labelControl8";
            this.labelControl8.Size = new System.Drawing.Size(12, 14);
            this.labelControl8.TabIndex = 39;
            this.labelControl8.Text = "项";
            // 
            // lblVehicleCurrentPage
            // 
            this.lblVehicleCurrentPage.Location = new System.Drawing.Point(324, 29);
            this.lblVehicleCurrentPage.Name = "lblVehicleCurrentPage";
            this.lblVehicleCurrentPage.Size = new System.Drawing.Size(67, 14);
            this.lblVehicleCurrentPage.TabIndex = 38;
            this.lblVehicleCurrentPage.Text = "当前：1/1页";
            // 
            // comboBoxEdit1
            // 
            this.comboBoxEdit1.Location = new System.Drawing.Point(216, 26);
            this.comboBoxEdit1.MenuManager = this.barManager1;
            this.comboBoxEdit1.Name = "comboBoxEdit1";
            this.comboBoxEdit1.Properties.Buttons.AddRange(new DevExpress.XtraEditors.Controls.EditorButton[] {
            new DevExpress.XtraEditors.Controls.EditorButton(DevExpress.XtraEditors.Controls.ButtonPredefines.Combo)});
            this.comboBoxEdit1.Properties.Items.AddRange(new object[] {
            "5",
            "10",
            "20",
            "50",
            "100",
            "200"});
            this.comboBoxEdit1.Size = new System.Drawing.Size(84, 21);
            this.comboBoxEdit1.TabIndex = 37;
            this.comboBoxEdit1.SelectedValueChanged += new System.EventHandler(this.cbeVehicleNumberPerPage_SelectedValueChanged);
            // 
            // labelControl6
            // 
            this.labelControl6.Location = new System.Drawing.Point(186, 30);
            this.labelControl6.Name = "labelControl6";
            this.labelControl6.Size = new System.Drawing.Size(24, 14);
            this.labelControl6.TabIndex = 36;
            this.labelControl6.Text = "每页";
            // 
            // btnVehicleLastPage
            // 
            this.btnVehicleLastPage.Location = new System.Drawing.Point(154, 25);
            this.btnVehicleLastPage.Name = "btnVehicleLastPage";
            this.btnVehicleLastPage.Size = new System.Drawing.Size(26, 24);
            this.btnVehicleLastPage.TabIndex = 35;
            this.btnVehicleLastPage.Text = ">|";
            this.btnVehicleLastPage.Click += new System.EventHandler(this.btnVehicleLastPage_Click);
            // 
            // btnVehicleNextPage
            // 
            this.btnVehicleNextPage.Location = new System.Drawing.Point(123, 25);
            this.btnVehicleNextPage.Name = "btnVehicleNextPage";
            this.btnVehicleNextPage.Size = new System.Drawing.Size(26, 24);
            this.btnVehicleNextPage.TabIndex = 35;
            this.btnVehicleNextPage.Text = ">";
            this.btnVehicleNextPage.Click += new System.EventHandler(this.btnVehicleNextPage_Click);
            // 
            // btnVehiclePrePage
            // 
            this.btnVehiclePrePage.Location = new System.Drawing.Point(92, 25);
            this.btnVehiclePrePage.Name = "btnVehiclePrePage";
            this.btnVehiclePrePage.Size = new System.Drawing.Size(26, 24);
            this.btnVehiclePrePage.TabIndex = 35;
            this.btnVehiclePrePage.Text = "<";
            this.btnVehiclePrePage.Click += new System.EventHandler(this.btnVehiclePrePage_Click);
            // 
            // btnVehicleFirstPage
            // 
            this.btnVehicleFirstPage.Location = new System.Drawing.Point(62, 25);
            this.btnVehicleFirstPage.Name = "btnVehicleFirstPage";
            this.btnVehicleFirstPage.Size = new System.Drawing.Size(26, 24);
            this.btnVehicleFirstPage.TabIndex = 35;
            this.btnVehicleFirstPage.Text = "|<";
            this.btnVehicleFirstPage.Click += new System.EventHandler(this.btnVehicleFirstPage_Click);
            // 
            // textEdit1
            // 
            this.textEdit1.Location = new System.Drawing.Point(476, 26);
            this.textEdit1.Name = "textEdit1";
            this.textEdit1.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.textEdit1.Size = new System.Drawing.Size(102, 21);
            this.textEdit1.TabIndex = 32;
            // 
            // labelControl2
            // 
            this.labelControl2.Location = new System.Drawing.Point(410, 29);
            this.labelControl2.Name = "labelControl2";
            this.labelControl2.Size = new System.Drawing.Size(60, 14);
            this.labelControl2.TabIndex = 30;
            this.labelControl2.Text = "车牌号码：";
            // 
            // btnQueryVehicle
            // 
            this.btnQueryVehicle.Appearance.Font = new System.Drawing.Font("Tahoma", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnQueryVehicle.Appearance.Options.UseFont = true;
            this.btnQueryVehicle.Dock = System.Windows.Forms.DockStyle.Right;
            this.btnQueryVehicle.ImeMode = System.Windows.Forms.ImeMode.Alpha;
            this.btnQueryVehicle.Location = new System.Drawing.Point(806, 2);
            this.btnQueryVehicle.Name = "btnQueryVehicle";
            this.btnQueryVehicle.Size = new System.Drawing.Size(60, 48);
            this.btnQueryVehicle.TabIndex = 34;
            this.btnQueryVehicle.Text = "查询";
            this.btnQueryVehicle.Click += new System.EventHandler(this.btnQueryVehicle_Click);
            // 
            // labelControl3
            // 
            this.labelControl3.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.NoBorder;
            this.labelControl3.Location = new System.Drawing.Point(269, 1);
            this.labelControl3.Name = "labelControl3";
            this.labelControl3.Size = new System.Drawing.Size(60, 14);
            this.labelControl3.TabIndex = 28;
            this.labelControl3.Text = "开始时间：";
            // 
            // labelControl4
            // 
            this.labelControl4.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.NoBorder;
            this.labelControl4.Location = new System.Drawing.Point(496, 2);
            this.labelControl4.Name = "labelControl4";
            this.labelControl4.Size = new System.Drawing.Size(60, 14);
            this.labelControl4.TabIndex = 29;
            this.labelControl4.Text = "结束时间：";
            // 
            // teStartTimeVehicle
            // 
            this.teStartTimeVehicle.EditValue = new System.DateTime(2010, 10, 30, 0, 0, 0, 0);
            this.teStartTimeVehicle.Enabled = false;
            this.teStartTimeVehicle.Location = new System.Drawing.Point(335, 2);
            this.teStartTimeVehicle.Name = "teStartTimeVehicle";
            this.teStartTimeVehicle.Properties.Buttons.AddRange(new DevExpress.XtraEditors.Controls.EditorButton[] {
            new DevExpress.XtraEditors.Controls.EditorButton()});
            this.teStartTimeVehicle.Properties.Mask.EditMask = "G";
            this.teStartTimeVehicle.Size = new System.Drawing.Size(155, 21);
            this.teStartTimeVehicle.TabIndex = 31;
            // 
            // teEndTimeVehicle
            // 
            this.teEndTimeVehicle.EditValue = new System.DateTime(2010, 1, 11, 0, 0, 0, 0);
            this.teEndTimeVehicle.Enabled = false;
            this.teEndTimeVehicle.Location = new System.Drawing.Point(562, 2);
            this.teEndTimeVehicle.Name = "teEndTimeVehicle";
            this.teEndTimeVehicle.Properties.Buttons.AddRange(new DevExpress.XtraEditors.Controls.EditorButton[] {
            new DevExpress.XtraEditors.Controls.EditorButton()});
            this.teEndTimeVehicle.Properties.Mask.EditMask = "G";
            this.teEndTimeVehicle.Size = new System.Drawing.Size(155, 21);
            this.teEndTimeVehicle.TabIndex = 33;
            // 
            // checkedComboBoxEditVehicleCamera
            // 
            this.checkedComboBoxEditVehicleCamera.Location = new System.Drawing.Point(111, 3);
            this.checkedComboBoxEditVehicleCamera.MenuManager = this.barManager1;
            this.checkedComboBoxEditVehicleCamera.Name = "checkedComboBoxEditVehicleCamera";
            this.checkedComboBoxEditVehicleCamera.Properties.Buttons.AddRange(new DevExpress.XtraEditors.Controls.EditorButton[] {
            new DevExpress.XtraEditors.Controls.EditorButton(DevExpress.XtraEditors.Controls.ButtonPredefines.Combo)});
            this.checkedComboBoxEditVehicleCamera.Size = new System.Drawing.Size(117, 21);
            this.checkedComboBoxEditVehicleCamera.TabIndex = 27;
            // 
            // labelControl5
            // 
            this.labelControl5.Location = new System.Drawing.Point(65, 6);
            this.labelControl5.Name = "labelControl5";
            this.labelControl5.Size = new System.Drawing.Size(40, 14);
            this.labelControl5.TabIndex = 26;
            this.labelControl5.Text = "摄像头:";
            // 
            // radioGroupVehicle
            // 
            this.radioGroupVehicle.Dock = System.Windows.Forms.DockStyle.Left;
            this.radioGroupVehicle.Location = new System.Drawing.Point(2, 2);
            this.radioGroupVehicle.MenuManager = this.barManager1;
            this.radioGroupVehicle.Name = "radioGroupVehicle";
            this.radioGroupVehicle.Properties.Items.AddRange(new DevExpress.XtraEditors.Controls.RadioGroupItem[] {
            new DevExpress.XtraEditors.Controls.RadioGroupItem(null, "实时"),
            new DevExpress.XtraEditors.Controls.RadioGroupItem(null, "历史")});
            this.radioGroupVehicle.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.radioGroupVehicle.Size = new System.Drawing.Size(57, 48);
            this.radioGroupVehicle.TabIndex = 0;
            this.radioGroupVehicle.SelectedIndexChanged += new System.EventHandler(this.radioGroupVehicle_SelectedIndexChanged);
            // 
            // xtraTabPageFace
            // 
            this.xtraTabPageFace.Controls.Add(this.splitContainerControl3);
            this.xtraTabPageFace.Controls.Add(this.panelControl6);
            this.xtraTabPageFace.Name = "xtraTabPageFace";
            this.xtraTabPageFace.Size = new System.Drawing.Size(868, 254);
            this.xtraTabPageFace.Text = "人脸";
            // 
            // splitContainerControl3
            // 
            this.splitContainerControl3.Dock = System.Windows.Forms.DockStyle.Fill;
            this.splitContainerControl3.Location = new System.Drawing.Point(0, 52);
            this.splitContainerControl3.Name = "splitContainerControl3";
            this.splitContainerControl3.Panel1.Controls.Add(this.gridControlFace);
            this.splitContainerControl3.Panel1.Text = "Panel1";
            this.splitContainerControl3.Panel2.Controls.Add(this.splitContainerControl4);
            this.splitContainerControl3.Panel2.Text = "Panel2";
            this.splitContainerControl3.Size = new System.Drawing.Size(868, 202);
            this.splitContainerControl3.SplitterPosition = 318;
            this.splitContainerControl3.TabIndex = 4;
            this.splitContainerControl3.Text = "splitContainerControl3";
            // 
            // gridControlFace
            // 
            this.gridControlFace.Dock = System.Windows.Forms.DockStyle.Fill;
            this.gridControlFace.Location = new System.Drawing.Point(0, 0);
            this.gridControlFace.MainView = this.advBandedGridViewFace;
            this.gridControlFace.MenuManager = this.barManager1;
            this.gridControlFace.Name = "gridControlFace";
            this.gridControlFace.Size = new System.Drawing.Size(318, 202);
            this.gridControlFace.TabIndex = 1;
            this.gridControlFace.ViewCollection.AddRange(new DevExpress.XtraGrid.Views.Base.BaseView[] {
            this.advBandedGridViewFace,
            this.gridViewFace});
            // 
            // advBandedGridViewFace
            // 
            this.advBandedGridViewFace.Bands.AddRange(new DevExpress.XtraGrid.Views.BandedGrid.GridBand[] {
            this.gridBand1,
            this.gridBand2});
            this.advBandedGridViewFace.Columns.AddRange(new DevExpress.XtraGrid.Views.BandedGrid.BandedGridColumn[] {
            this.bandedGridColumn1,
            this.bandedGridColumn2,
            this.bandedGridColumn3,
            this.bandedGridColumn4,
            this.bandedGridColumn5,
            this.bandedGridColumn6});
            this.advBandedGridViewFace.GridControl = this.gridControlFace;
            this.advBandedGridViewFace.IndicatorWidth = 40;
            this.advBandedGridViewFace.Name = "advBandedGridViewFace";
            this.advBandedGridViewFace.OptionsBehavior.AllowAddRows = DevExpress.Utils.DefaultBoolean.False;
            this.advBandedGridViewFace.OptionsBehavior.AllowDeleteRows = DevExpress.Utils.DefaultBoolean.False;
            this.advBandedGridViewFace.OptionsBehavior.Editable = false;
            this.advBandedGridViewFace.OptionsBehavior.ReadOnly = true;
            this.advBandedGridViewFace.OptionsView.ShowBands = false;
            this.advBandedGridViewFace.OptionsView.ShowGroupPanel = false;
            this.advBandedGridViewFace.SelectionChanged += new DevExpress.Data.SelectionChangedEventHandler(this.advBandedGridViewFace_SelectionChanged);
            this.advBandedGridViewFace.RowClick += new DevExpress.XtraGrid.Views.Grid.RowClickEventHandler(this.advBandedGridViewFace_RowClick);
            this.advBandedGridViewFace.CustomDrawRowIndicator += new DevExpress.XtraGrid.Views.Grid.RowIndicatorCustomDrawEventHandler(this.advBandedGridViewFace_CustomDrawRowIndicator);
            // 
            // gridBand1
            // 
            this.gridBand1.Caption = "基本信息";
            this.gridBand1.Columns.Add(this.bandedGridColumn1);
            this.gridBand1.Columns.Add(this.bandedGridColumn4);
            this.gridBand1.Columns.Add(this.bandedGridColumn2);
            this.gridBand1.Columns.Add(this.bandedGridColumn3);
            this.gridBand1.Name = "gridBand1";
            this.gridBand1.Width = 184;
            // 
            // bandedGridColumn1
            // 
            this.bandedGridColumn1.Caption = "索引号";
            this.bandedGridColumn1.FieldName = "索引号";
            this.bandedGridColumn1.Name = "bandedGridColumn1";
            this.bandedGridColumn1.Visible = true;
            this.bandedGridColumn1.Width = 88;
            // 
            // bandedGridColumn4
            // 
            this.bandedGridColumn4.Caption = "置信度";
            this.bandedGridColumn4.FieldName = "置信度";
            this.bandedGridColumn4.Name = "bandedGridColumn4";
            this.bandedGridColumn4.Visible = true;
            this.bandedGridColumn4.Width = 96;
            // 
            // bandedGridColumn2
            // 
            this.bandedGridColumn2.Caption = "时间";
            this.bandedGridColumn2.FieldName = "时间";
            this.bandedGridColumn2.Name = "bandedGridColumn2";
            this.bandedGridColumn2.RowIndex = 1;
            this.bandedGridColumn2.Visible = true;
            this.bandedGridColumn2.Width = 184;
            // 
            // bandedGridColumn3
            // 
            this.bandedGridColumn3.Caption = "地点";
            this.bandedGridColumn3.FieldName = "地点";
            this.bandedGridColumn3.Name = "bandedGridColumn3";
            this.bandedGridColumn3.RowIndex = 2;
            this.bandedGridColumn3.Visible = true;
            this.bandedGridColumn3.Width = 184;
            // 
            // gridBand2
            // 
            this.gridBand2.Caption = "人脸";
            this.gridBand2.Columns.Add(this.bandedGridColumn6);
            this.gridBand2.Columns.Add(this.bandedGridColumn5);
            this.gridBand2.Name = "gridBand2";
            this.gridBand2.Width = 123;
            // 
            // bandedGridColumn6
            // 
            this.bandedGridColumn6.Caption = "人脸对象";
            this.bandedGridColumn6.FieldName = "人脸对象";
            this.bandedGridColumn6.Name = "bandedGridColumn6";
            // 
            // bandedGridColumn5
            // 
            this.bandedGridColumn5.AutoFillDown = true;
            this.bandedGridColumn5.Caption = "照片";
            this.bandedGridColumn5.FieldName = "照片";
            this.bandedGridColumn5.Name = "bandedGridColumn5";
            this.bandedGridColumn5.Visible = true;
            this.bandedGridColumn5.Width = 123;
            // 
            // gridViewFace
            // 
            this.gridViewFace.GridControl = this.gridControlFace;
            this.gridViewFace.Name = "gridViewFace";
            this.gridViewFace.OptionsBehavior.AllowAddRows = DevExpress.Utils.DefaultBoolean.False;
            this.gridViewFace.OptionsBehavior.AllowDeleteRows = DevExpress.Utils.DefaultBoolean.False;
            this.gridViewFace.OptionsBehavior.Editable = false;
            this.gridViewFace.OptionsBehavior.ReadOnly = true;
            this.gridViewFace.OptionsSelection.EnableAppearanceHideSelection = false;
            this.gridViewFace.OptionsSelection.InvertSelection = true;
            this.gridViewFace.OptionsView.RowAutoHeight = true;
            this.gridViewFace.OptionsView.ShowGroupPanel = false;
            // 
            // splitContainerControl4
            // 
            this.splitContainerControl4.Dock = System.Windows.Forms.DockStyle.Fill;
            this.splitContainerControl4.Location = new System.Drawing.Point(0, 0);
            this.splitContainerControl4.Name = "splitContainerControl4";
            this.splitContainerControl4.Panel1.Controls.Add(this.pictureEditFace);
            this.splitContainerControl4.Panel1.Text = "Panel1";
            this.splitContainerControl4.Panel2.Controls.Add(this.splitContainerControlFaceVideo);
            this.splitContainerControl4.Panel2.Text = "Panel2";
            this.splitContainerControl4.Size = new System.Drawing.Size(545, 202);
            this.splitContainerControl4.SplitterPosition = 291;
            this.splitContainerControl4.TabIndex = 0;
            this.splitContainerControl4.Text = "splitContainerControl4";
            // 
            // pictureEditFace
            // 
            this.pictureEditFace.Dock = System.Windows.Forms.DockStyle.Fill;
            this.pictureEditFace.Location = new System.Drawing.Point(0, 0);
            this.pictureEditFace.MenuManager = this.barManager1;
            this.pictureEditFace.Name = "pictureEditFace";
            this.pictureEditFace.Properties.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.NoBorder;
            this.pictureEditFace.Properties.SizeMode = DevExpress.XtraEditors.Controls.PictureSizeMode.Zoom;
            this.pictureEditFace.Size = new System.Drawing.Size(291, 202);
            this.pictureEditFace.TabIndex = 0;
            // 
            // splitContainerControlFaceVideo
            // 
            this.splitContainerControlFaceVideo.Dock = System.Windows.Forms.DockStyle.Fill;
            this.splitContainerControlFaceVideo.Horizontal = false;
            this.splitContainerControlFaceVideo.Location = new System.Drawing.Point(0, 0);
            this.splitContainerControlFaceVideo.Name = "splitContainerControlFaceVideo";
            this.splitContainerControlFaceVideo.Panel1.AppearanceCaption.ForeColor = System.Drawing.Color.Red;
            this.splitContainerControlFaceVideo.Panel1.AppearanceCaption.Options.UseForeColor = true;
            this.splitContainerControlFaceVideo.Panel1.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.Default;
            this.splitContainerControlFaceVideo.Panel2.Controls.Add(this.layoutControl1);
            this.splitContainerControlFaceVideo.Panel2.Text = "Panel2";
            this.splitContainerControlFaceVideo.Panel2.SizeChanged += new System.EventHandler(this.splitContainerControl2_Panel2_SizeChanged);
            this.splitContainerControlFaceVideo.Size = new System.Drawing.Size(249, 202);
            this.splitContainerControlFaceVideo.SplitterPosition = 171;
            this.splitContainerControlFaceVideo.TabIndex = 0;
            this.splitContainerControlFaceVideo.Text = "splitContainerControl2";
            // 
            // panelControl6
            // 
            this.panelControl6.Controls.Add(this.lblFaceCurrentPage);
            this.panelControl6.Controls.Add(this.label3);
            this.panelControl6.Controls.Add(this.label4);
            this.panelControl6.Controls.Add(this.cbeFaceNumberPerPage);
            this.panelControl6.Controls.Add(this.btnFaceLastPage);
            this.panelControl6.Controls.Add(this.btnFaceNextPage);
            this.panelControl6.Controls.Add(this.btnFacePrePage);
            this.panelControl6.Controls.Add(this.btnFaceFirstPage);
            this.panelControl6.Controls.Add(this.btnQueryFace);
            this.panelControl6.Controls.Add(this.lblStartTime);
            this.panelControl6.Controls.Add(this.lblEndTime);
            this.panelControl6.Controls.Add(this.teStartTimeFace);
            this.panelControl6.Controls.Add(this.teEndTimeFace);
            this.panelControl6.Controls.Add(this.checkedComboBoxEditFaceCamera);
            this.panelControl6.Controls.Add(this.labelControl1);
            this.panelControl6.Controls.Add(this.radioGroupFace);
            this.panelControl6.Dock = System.Windows.Forms.DockStyle.Top;
            this.panelControl6.Location = new System.Drawing.Point(0, 0);
            this.panelControl6.Name = "panelControl6";
            this.panelControl6.Size = new System.Drawing.Size(868, 52);
            this.panelControl6.TabIndex = 2;
            // 
            // lblFaceCurrentPage
            // 
            this.lblFaceCurrentPage.Location = new System.Drawing.Point(311, 33);
            this.lblFaceCurrentPage.Name = "lblFaceCurrentPage";
            this.lblFaceCurrentPage.Size = new System.Drawing.Size(67, 14);
            this.lblFaceCurrentPage.TabIndex = 32;
            this.lblFaceCurrentPage.Text = "当前：1/1页";
            // 
            // label3
            // 
            this.label3.Location = new System.Drawing.Point(183, 33);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(24, 14);
            this.label3.TabIndex = 29;
            this.label3.Text = "每页";
            // 
            // label4
            // 
            this.label4.Location = new System.Drawing.Point(297, 33);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(12, 14);
            this.label4.TabIndex = 30;
            this.label4.Text = "项";
            // 
            // cbeFaceNumberPerPage
            // 
            this.cbeFaceNumberPerPage.EditValue = "20";
            this.cbeFaceNumberPerPage.Location = new System.Drawing.Point(211, 27);
            this.cbeFaceNumberPerPage.Name = "cbeFaceNumberPerPage";
            this.cbeFaceNumberPerPage.Properties.Buttons.AddRange(new DevExpress.XtraEditors.Controls.EditorButton[] {
            new DevExpress.XtraEditors.Controls.EditorButton(DevExpress.XtraEditors.Controls.ButtonPredefines.Combo)});
            this.cbeFaceNumberPerPage.Properties.Items.AddRange(new object[] {
            "5",
            "10",
            "20",
            "50",
            "100",
            "200"});
            this.cbeFaceNumberPerPage.Properties.TextEditStyle = DevExpress.XtraEditors.Controls.TextEditStyles.DisableTextEditor;
            this.cbeFaceNumberPerPage.Size = new System.Drawing.Size(79, 21);
            this.cbeFaceNumberPerPage.TabIndex = 31;
            this.cbeFaceNumberPerPage.SelectedValueChanged += new System.EventHandler(this.cbeFaceNumberPerPage_SelectedValueChanged);
            // 
            // btnFaceLastPage
            // 
            this.btnFaceLastPage.Location = new System.Drawing.Point(150, 25);
            this.btnFaceLastPage.Name = "btnFaceLastPage";
            this.btnFaceLastPage.Size = new System.Drawing.Size(26, 24);
            this.btnFaceLastPage.TabIndex = 27;
            this.btnFaceLastPage.Text = ">|";
            this.btnFaceLastPage.Click += new System.EventHandler(this.btnFaceLastPage_Click);
            // 
            // btnFaceNextPage
            // 
            this.btnFaceNextPage.Location = new System.Drawing.Point(120, 25);
            this.btnFaceNextPage.Name = "btnFaceNextPage";
            this.btnFaceNextPage.Size = new System.Drawing.Size(26, 24);
            this.btnFaceNextPage.TabIndex = 26;
            this.btnFaceNextPage.Text = ">";
            this.btnFaceNextPage.Click += new System.EventHandler(this.btnFaceNextPage_Click);
            // 
            // btnFacePrePage
            // 
            this.btnFacePrePage.Location = new System.Drawing.Point(90, 25);
            this.btnFacePrePage.Name = "btnFacePrePage";
            this.btnFacePrePage.Size = new System.Drawing.Size(26, 24);
            this.btnFacePrePage.TabIndex = 25;
            this.btnFacePrePage.Text = "<";
            this.btnFacePrePage.Click += new System.EventHandler(this.btnFacePrePage_Click);
            // 
            // btnFaceFirstPage
            // 
            this.btnFaceFirstPage.Location = new System.Drawing.Point(60, 25);
            this.btnFaceFirstPage.Name = "btnFaceFirstPage";
            this.btnFaceFirstPage.Size = new System.Drawing.Size(26, 24);
            this.btnFaceFirstPage.TabIndex = 28;
            this.btnFaceFirstPage.Text = "|<";
            this.btnFaceFirstPage.Click += new System.EventHandler(this.btnFaceFirstPage_Click);
            // 
            // btnQueryFace
            // 
            this.btnQueryFace.Appearance.Font = new System.Drawing.Font("Tahoma", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnQueryFace.Appearance.Options.UseFont = true;
            this.btnQueryFace.Dock = System.Windows.Forms.DockStyle.Right;
            this.btnQueryFace.Enabled = false;
            this.btnQueryFace.ImeMode = System.Windows.Forms.ImeMode.Alpha;
            this.btnQueryFace.Location = new System.Drawing.Point(806, 2);
            this.btnQueryFace.Name = "btnQueryFace";
            this.btnQueryFace.Size = new System.Drawing.Size(60, 48);
            this.btnQueryFace.TabIndex = 24;
            this.btnQueryFace.Text = "查询";
            this.btnQueryFace.Click += new System.EventHandler(this.btnQueryFace_Click);
            // 
            // lblStartTime
            // 
            this.lblStartTime.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.NoBorder;
            this.lblStartTime.Location = new System.Drawing.Point(271, 6);
            this.lblStartTime.Name = "lblStartTime";
            this.lblStartTime.Size = new System.Drawing.Size(60, 14);
            this.lblStartTime.TabIndex = 20;
            this.lblStartTime.Text = "开始时间：";
            // 
            // lblEndTime
            // 
            this.lblEndTime.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.NoBorder;
            this.lblEndTime.Location = new System.Drawing.Point(506, 6);
            this.lblEndTime.Name = "lblEndTime";
            this.lblEndTime.Size = new System.Drawing.Size(60, 14);
            this.lblEndTime.TabIndex = 21;
            this.lblEndTime.Text = "结束时间：";
            // 
            // teStartTimeFace
            // 
            this.teStartTimeFace.EditValue = new System.DateTime(2010, 10, 30, 11, 0, 0, 0);
            this.teStartTimeFace.Enabled = false;
            this.teStartTimeFace.Location = new System.Drawing.Point(337, 3);
            this.teStartTimeFace.Name = "teStartTimeFace";
            this.teStartTimeFace.Properties.Buttons.AddRange(new DevExpress.XtraEditors.Controls.EditorButton[] {
            new DevExpress.XtraEditors.Controls.EditorButton()});
            this.teStartTimeFace.Properties.Mask.EditMask = "G";
            this.teStartTimeFace.Size = new System.Drawing.Size(145, 21);
            this.teStartTimeFace.TabIndex = 22;
            // 
            // teEndTimeFace
            // 
            this.teEndTimeFace.EditValue = new System.DateTime(2010, 1, 11, 10, 0, 0, 0);
            this.teEndTimeFace.Enabled = false;
            this.teEndTimeFace.Location = new System.Drawing.Point(572, 3);
            this.teEndTimeFace.Name = "teEndTimeFace";
            this.teEndTimeFace.Properties.Buttons.AddRange(new DevExpress.XtraEditors.Controls.EditorButton[] {
            new DevExpress.XtraEditors.Controls.EditorButton()});
            this.teEndTimeFace.Properties.Mask.EditMask = "G";
            this.teEndTimeFace.Size = new System.Drawing.Size(138, 21);
            this.teEndTimeFace.TabIndex = 23;
            // 
            // checkedComboBoxEditFaceCamera
            // 
            this.checkedComboBoxEditFaceCamera.Location = new System.Drawing.Point(111, 3);
            this.checkedComboBoxEditFaceCamera.MenuManager = this.barManager1;
            this.checkedComboBoxEditFaceCamera.Name = "checkedComboBoxEditFaceCamera";
            this.checkedComboBoxEditFaceCamera.Properties.Buttons.AddRange(new DevExpress.XtraEditors.Controls.EditorButton[] {
            new DevExpress.XtraEditors.Controls.EditorButton(DevExpress.XtraEditors.Controls.ButtonPredefines.Combo)});
            this.checkedComboBoxEditFaceCamera.Size = new System.Drawing.Size(117, 21);
            this.checkedComboBoxEditFaceCamera.TabIndex = 2;
            // 
            // labelControl1
            // 
            this.labelControl1.Location = new System.Drawing.Point(65, 6);
            this.labelControl1.Name = "labelControl1";
            this.labelControl1.Size = new System.Drawing.Size(40, 14);
            this.labelControl1.TabIndex = 1;
            this.labelControl1.Text = "摄像头:";
            // 
            // radioGroupFace
            // 
            this.radioGroupFace.Dock = System.Windows.Forms.DockStyle.Left;
            this.radioGroupFace.Location = new System.Drawing.Point(2, 2);
            this.radioGroupFace.MenuManager = this.barManager1;
            this.radioGroupFace.Name = "radioGroupFace";
            this.radioGroupFace.Properties.Items.AddRange(new DevExpress.XtraEditors.Controls.RadioGroupItem[] {
            new DevExpress.XtraEditors.Controls.RadioGroupItem(null, "实时"),
            new DevExpress.XtraEditors.Controls.RadioGroupItem(null, "历史")});
            this.radioGroupFace.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.radioGroupFace.Size = new System.Drawing.Size(57, 48);
            this.radioGroupFace.TabIndex = 0;
            this.radioGroupFace.SelectedIndexChanged += new System.EventHandler(this.radioGroupFace_SelectedIndexChanged);
            // 
            // barButtonItem1
            // 
            this.barButtonItem1.Caption = "系统配置(&S)";
            this.barButtonItem1.Id = 0;
            this.barButtonItem1.Name = "barButtonItem1";
            this.barButtonItem1.ItemClick += new DevExpress.XtraBars.ItemClickEventHandler(this.barButtonItem1_ItemClick);
            // 
            // barButtonItem2
            // 
            this.barButtonItem2.Caption = "视图(&V)";
            this.barButtonItem2.Id = 1;
            this.barButtonItem2.Name = "barButtonItem2";
            // 
            // barButtonItem4
            // 
            this.barButtonItem4.Caption = "查询(&Q)";
            this.barButtonItem4.Id = 3;
            this.barButtonItem4.Name = "barButtonItem4";
            // 
            // barbtnClose
            // 
            this.barbtnClose.Caption = "退出系统";
            this.barbtnClose.Id = 5;
            this.barbtnClose.Name = "barbtnClose";
            this.barbtnClose.ItemClick += new DevExpress.XtraBars.ItemClickEventHandler(this.barbtnClose_ItemClick);
            // 
            // barButtonItem6
            // 
            this.barButtonItem6.Caption = "关于";
            this.barButtonItem6.Id = 6;
            this.barButtonItem6.Name = "barButtonItem6";
            // 
            // barSubItem3
            // 
            this.barSubItem3.Caption = "barSubItem3";
            this.barSubItem3.Id = 11;
            this.barSubItem3.Name = "barSubItem3";
            // 
            // barStaticItem2
            // 
            this.barStaticItem2.Caption = "解码器数:";
            this.barStaticItem2.Id = 23;
            this.barStaticItem2.Name = "barStaticItem2";
            this.barStaticItem2.TextAlignment = System.Drawing.StringAlignment.Near;
            // 
            // barStaticItem6
            // 
            this.barStaticItem6.Caption = "正常";
            this.barStaticItem6.Id = 28;
            this.barStaticItem6.Name = "barStaticItem6";
            this.barStaticItem6.TextAlignment = System.Drawing.StringAlignment.Near;
            // 
            // mainMultiplexer
            // 
            this.mainMultiplexer.CellHeight = 288;
            this.mainMultiplexer.CellWidth = 352;
            this.mainMultiplexer.Cols = 4;
            this.mainMultiplexer.Dock = System.Windows.Forms.DockStyle.Fill;
            this.mainMultiplexer.Location = new System.Drawing.Point(200, 55);
            this.mainMultiplexer.Name = "mainMultiplexer";
            this.mainMultiplexer.Rows = 4;
            this.mainMultiplexer.Size = new System.Drawing.Size(886, 356);
            this.mainMultiplexer.TabIndex = 5;
            this.mainMultiplexer.DoubleCamera += new CameraViewer.Multiplexer.MyCurrentCamera(this.multiplexer1_DoubleCamera);
            // 
            // cmIcon
            // 
            this.cmIcon.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.删除ToolStripMenuItem});
            this.cmIcon.Name = "cmIcon";
            this.cmIcon.ShowImageMargin = false;
            this.cmIcon.Size = new System.Drawing.Size(76, 26);
            // 
            // 删除ToolStripMenuItem
            // 
            this.删除ToolStripMenuItem.Name = "删除ToolStripMenuItem";
            this.删除ToolStripMenuItem.Size = new System.Drawing.Size(75, 22);
            this.删除ToolStripMenuItem.Text = "删除";
            this.删除ToolStripMenuItem.Click += new System.EventHandler(this.删除ToolStripMenuItem_Click);
            // 
            // timerCheckAlarmSites
            // 
            this.timerCheckAlarmSites.Enabled = true;
            this.timerCheckAlarmSites.Interval = 10;
            this.timerCheckAlarmSites.Tick += new System.EventHandler(this.timerCheckAlarmSites_Tick);
            // 
            // timerUpdateIcon
            // 
            this.timerUpdateIcon.Enabled = true;
            this.timerUpdateIcon.Interval = 400;
            // 
            // bar2
            // 
            this.bar2.BarName = "Main menu";
            this.bar2.DockCol = 0;
            this.bar2.DockRow = 0;
            this.bar2.DockStyle = DevExpress.XtraBars.BarDockStyle.Top;
            this.bar2.LinksPersistInfo.AddRange(new DevExpress.XtraBars.LinkPersistInfo[] {
            new DevExpress.XtraBars.LinkPersistInfo(this.barButtonItem1),
            new DevExpress.XtraBars.LinkPersistInfo(this.barButtonItem2),
            new DevExpress.XtraBars.LinkPersistInfo(this.barButtonItem4),
            new DevExpress.XtraBars.LinkPersistInfo(this.barButtonItem6)});
            this.bar2.OptionsBar.DisableClose = true;
            this.bar2.OptionsBar.DrawDragBorder = false;
            this.bar2.OptionsBar.MultiLine = true;
            this.bar2.OptionsBar.UseWholeRow = true;
            this.bar2.Text = "Main menu";
            // 
            // timerCurretnTime
            // 
            this.timerCurretnTime.Enabled = true;
            this.timerCurretnTime.Interval = 500;
            this.timerCurretnTime.Tick += new System.EventHandler(this.timerCurretnTime_Tick);
            // 
            // timerTest
            // 
            this.timerTest.Enabled = true;
            this.timerTest.Tick += new System.EventHandler(this.timerTest_Tick);
            // 
            // MainForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 14F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1251, 752);
            this.Controls.Add(this.mainMultiplexer);
            this.Controls.Add(this.dockPanelAlarm);
            this.Controls.Add(this.dockPanel1);
            this.Controls.Add(this.dockPanelResult);
            this.Controls.Add(this.barDockControlLeft);
            this.Controls.Add(this.barDockControlRight);
            this.Controls.Add(this.barDockControlBottom);
            this.Controls.Add(this.barDockControlTop);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.IsMdiContainer = true;
            this.KeyPreview = true;
            this.Name = "MainForm";
            this.Text = "智能视频监控平台V1.0 Build110220";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.Load += new System.EventHandler(this.frmMain_Win_Load);
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.frmMain_Win_FormClosing);
            this.Resize += new System.EventHandler(this.frmMain_Win_Resize);
            this.KeyDown += new System.Windows.Forms.KeyEventHandler(this.frmMain_Win_KeyDown);
            ((System.ComponentModel.ISupportInitialize)(this.barManager1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.barAndDockingController1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dockManager1)).EndInit();
            this.dockPanelResult.ResumeLayout(false);
            this.dockPanel1.ResumeLayout(false);
            this.dockPanel1_Container.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.splitContainerControl1)).EndInit();
            this.splitContainerControl1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.splitContainerControl2)).EndInit();
            this.splitContainerControl2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.pictureEdit1.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.layoutControl2)).EndInit();
            this.layoutControl2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.layoutControlGroup2)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.layoutControlItem4)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.layoutControlItem5)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.layoutControlItem6)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.layoutControlItem7)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.layoutControlItem8)).EndInit();
            this.dockPanelAlarm.ResumeLayout(false);
            this.dockPanel3_Container.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.pcBottom)).EndInit();
            this.pcBottom.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.xtraTabControlResult)).EndInit();
            this.xtraTabControlResult.ResumeLayout(false);
            this.xtraTabPageEvent.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.panelControl2)).EndInit();
            this.panelControl2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.splitContainerControl7)).EndInit();
            this.splitContainerControl7.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.gridControlEvent)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.advBandedGridViewEvent)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.splitContainerControl8)).EndInit();
            this.splitContainerControl8.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.pictureEditEvent.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.splitContainerControlEventVideo)).EndInit();
            this.splitContainerControlEventVideo.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.layoutControl1)).EndInit();
            this.layoutControl1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.layoutControlGroup1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.layoutControlItem1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.layoutControlItem2)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.layoutControlItem3)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.panelControl1)).EndInit();
            this.panelControl1.ResumeLayout(false);
            this.panelControl1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.checkedComboBoxEditUserSelection.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.cbeEventNumberPerPage.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.teStartTimeEvent.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.teEndTimeEvent.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.checkedComboBoxEditEventCamera.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.radioGroupEvent.Properties)).EndInit();
            this.xtraTabPageVehicle.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.panelControl3)).EndInit();
            this.panelControl3.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.splitContainerControl5)).EndInit();
            this.splitContainerControl5.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.gridControlVehicle)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.advBandedGridViewVehicle)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.splitContainerControl6)).EndInit();
            this.splitContainerControl6.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.pictureEditVehicle.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.splitContainerControlVideoVehicle)).EndInit();
            this.splitContainerControlVideoVehicle.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.panelControl4)).EndInit();
            this.panelControl4.ResumeLayout(false);
            this.panelControl4.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.comboBoxEdit1.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.textEdit1.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.teStartTimeVehicle.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.teEndTimeVehicle.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.checkedComboBoxEditVehicleCamera.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.radioGroupVehicle.Properties)).EndInit();
            this.xtraTabPageFace.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.splitContainerControl3)).EndInit();
            this.splitContainerControl3.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.gridControlFace)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.advBandedGridViewFace)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.gridViewFace)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.splitContainerControl4)).EndInit();
            this.splitContainerControl4.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.pictureEditFace.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.splitContainerControlFaceVideo)).EndInit();
            this.splitContainerControlFaceVideo.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.panelControl6)).EndInit();
            this.panelControl6.ResumeLayout(false);
            this.panelControl6.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.cbeFaceNumberPerPage.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.teStartTimeFace.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.teEndTimeFace.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.checkedComboBoxEditFaceCamera.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.radioGroupFace.Properties)).EndInit();
            this.cmIcon.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private DevExpress.XtraBars.BarManager barManager1;
        private DevExpress.XtraBars.BarButtonItem barButtonItem1;
        private DevExpress.XtraBars.BarButtonItem barButtonItem2;
        private DevExpress.XtraBars.BarButtonItem barButtonItem4;
        private DevExpress.XtraBars.BarDockControl barDockControlTop;
        private DevExpress.XtraBars.BarDockControl barDockControlBottom;
        private DevExpress.XtraBars.BarDockControl barDockControlLeft;
        private DevExpress.XtraBars.BarDockControl barDockControlRight;
        private CameraViewer.Controls.CameraView cameraView1;
        private DevExpress.XtraBars.BarButtonItem barbtnClose;
        private DevExpress.XtraBars.BarButtonItem barButtonItem6;
        private Multiplexer mainMultiplexer;
        private DevExpress.XtraEditors.PanelControl pcBottom;
        private System.Windows.Forms.ContextMenuStrip cmIcon;
        private System.Windows.Forms.ToolStripMenuItem 删除ToolStripMenuItem;
        private Timer timerCheckAlarmSites;
        private Timer timerUpdateIcon;
        private DevExpress.XtraBars.BarAndDockingController barAndDockingController1;
        private DevExpress.XtraBars.Docking.DockManager dockManager1;
        private DevExpress.XtraBars.Docking.DockPanel dockPanelAlarm;
        private DevExpress.XtraBars.Docking.ControlContainer dockPanel3_Container;
        private DevExpress.XtraBars.Docking.DockPanel dockPanel1;
        private DevExpress.XtraBars.Docking.ControlContainer dockPanel1_Container;
        private DevExpress.XtraBars.Docking.DockPanel dockPanelResult;
        private DevExpress.XtraBars.Docking.ControlContainer dockPanel2_Container;
        private DevExpress.XtraBars.Bar barMenu;
        private DevExpress.XtraBars.Bar bar3;
        private DevExpress.XtraBars.Bar bar4;
        private DevExpress.XtraBars.Bar bar2;
        private DevExpress.XtraBars.BarSubItem barSubItemMenuSystem;
        private DevExpress.XtraBars.BarSubItem barSubItemMenuView;
        private DevExpress.XtraBars.BarSubItem barSubItem3;
        private DevExpress.XtraBars.BarSubItem barSubItemMenuQuery;
        private DevExpress.XtraBars.BarSubItem barSubItem1;
        private DevExpress.XtraBars.BarButtonItem barButtonItem3;
        private DevExpress.XtraBars.BarButtonItem barButtonItem5;
        private DevExpress.XtraBars.BarButtonItem barButtonItem7;
        private DevExpress.XtraBars.BarButtonItem barButtonItemResultView;
        private DevExpress.XtraBars.BarButtonItem barButtonItemAlarmView;
        private DevExpress.XtraBars.BarStaticItem barStaticItem1;
        private DevExpress.XtraBars.BarStaticItem barStaticItemCurrentUser;
        private DevExpress.XtraBars.BarStaticItem barStaticItem3;
        private DevExpress.XtraBars.BarStaticItem barStaticItemCameraNo;
        private DevExpress.XtraBars.BarStaticItem barStaticItem2;
        private DevExpress.XtraBars.BarStaticItem barStaticItemDecoderNo;
        private DevExpress.XtraBars.BarStaticItem barStaticItem4;
        private DevExpress.XtraBars.BarStaticItem barStaticItemCurrentTime;
        private Timer timerCurretnTime;
        private DevExpress.XtraBars.BarStaticItem barStaticItem5;
        private DevExpress.XtraBars.BarStaticItem barStaticItemNetStatus;
        private DevExpress.XtraBars.BarStaticItem barStaticItem6;
        private DevExpress.XtraBars.BarButtonItem barButtonItem8;
        private DevExpress.XtraBars.BarButtonItem barButtonItem9;
        private DevExpress.XtraBars.BarButtonItem barButtonItem10;
        private DevExpress.XtraBars.BarButtonItem barButtonItem11;
        private DevExpress.XtraBars.BarButtonItem barButtonItem12;
        private Timer timerTest;
        private DevExpress.XtraEditors.SplitContainerControl splitContainerControl1;
        private DevExpress.XtraEditors.SimpleButton simpleButton5;
        private DevExpress.XtraEditors.SimpleButton simpleButton4;
        private DevExpress.XtraEditors.SimpleButton simpleButton3;
        private DevExpress.XtraEditors.SimpleButton simpleButton2;
        private DevExpress.XtraEditors.SimpleButton simpleButton1;
        private DevExpress.XtraBars.BarButtonItem barButtonItem13;
        private DevExpress.XtraBars.BarButtonItem barButtonItemGetPics;
        private DevExpress.XtraTab.XtraTabControl xtraTabControlResult;
        private DevExpress.XtraTab.XtraTabPage xtraTabPageEvent;
        private DevExpress.XtraTab.XtraTabPage xtraTabPageVehicle;
        private DevExpress.XtraTab.XtraTabPage xtraTabPageFace;
        private DevExpress.XtraEditors.PanelControl panelControl1;
        private DevExpress.XtraEditors.PanelControl panelControl2;
        private DevExpress.XtraEditors.PanelControl panelControl3;
        private DevExpress.XtraEditors.PanelControl panelControl4;
        private DevExpress.XtraEditors.PanelControl panelControl6;
        private DevExpress.XtraEditors.RadioGroup radioGroupFace;
        private DevExpress.XtraEditors.LabelControl labelControl1;
        private DevExpress.XtraEditors.LabelControl lblStartTime;
        private DevExpress.XtraEditors.LabelControl lblEndTime;
        private DevExpress.XtraEditors.TimeEdit teStartTimeFace;
        private DevExpress.XtraEditors.TimeEdit teEndTimeFace;
        private DevExpress.XtraEditors.CheckedComboBoxEdit checkedComboBoxEditFaceCamera;
        private DevExpress.XtraEditors.SimpleButton btnQueryFace;
        private DevExpress.XtraEditors.TextEdit textEdit1;
        private DevExpress.XtraEditors.LabelControl labelControl2;
        private DevExpress.XtraEditors.SimpleButton btnQueryVehicle;
        private DevExpress.XtraEditors.LabelControl labelControl3;
        private DevExpress.XtraEditors.LabelControl labelControl4;
        private DevExpress.XtraEditors.TimeEdit teStartTimeVehicle;
        private DevExpress.XtraEditors.TimeEdit teEndTimeVehicle;
        private DevExpress.XtraEditors.CheckedComboBoxEdit checkedComboBoxEditVehicleCamera;
        private DevExpress.XtraEditors.LabelControl labelControl5;
        private DevExpress.XtraEditors.RadioGroup radioGroupVehicle;
        private DevExpress.XtraGrid.GridControl gridControlFace;
        private DevExpress.XtraGrid.Views.Grid.GridView gridViewFace;
        private DevExpress.XtraGrid.Views.BandedGrid.AdvBandedGridView advBandedGridViewFace;
        private DevExpress.XtraGrid.Views.BandedGrid.BandedGridColumn bandedGridColumn1;
        private DevExpress.XtraGrid.Views.BandedGrid.BandedGridColumn bandedGridColumn2;
        private DevExpress.XtraGrid.Views.BandedGrid.BandedGridColumn bandedGridColumn3;
        private DevExpress.XtraGrid.Views.BandedGrid.BandedGridColumn bandedGridColumn4;
        private DevExpress.XtraGrid.Views.BandedGrid.BandedGridColumn bandedGridColumn5;
        private DevExpress.XtraGrid.Views.BandedGrid.BandedGridColumn bandedGridColumn6;
        private DevExpress.XtraGrid.Views.BandedGrid.GridBand gridBand1;
        private DevExpress.XtraGrid.Views.BandedGrid.GridBand gridBand2;
        private DevExpress.XtraEditors.PictureEdit pictureEditFace;
        private DevExpress.XtraBars.BarButtonItem barButtonItem14;
        private DevExpress.XtraEditors.SplitContainerControl splitContainerControlFaceVideo;
        private DevExpress.XtraEditors.SimpleButton simpleButton9;
        private DevExpress.XtraEditors.SimpleButton simpleButton8;
        private DevExpress.XtraEditors.SimpleButton simpleButton7;
        private DevExpress.XtraEditors.SplitContainerControl splitContainerControl3;
        private DevExpress.XtraEditors.SplitContainerControl splitContainerControl4;
        private DevExpress.XtraEditors.SimpleButton btnFaceLastPage;
        private DevExpress.XtraEditors.SimpleButton btnFaceNextPage;
        private DevExpress.XtraEditors.SimpleButton btnFacePrePage;
        private DevExpress.XtraEditors.SimpleButton btnFaceFirstPage;
        private DevExpress.XtraEditors.LabelControl lblFaceCurrentPage;
        private DevExpress.XtraEditors.LabelControl label3;
        private DevExpress.XtraEditors.LabelControl label4;
        private DevExpress.XtraEditors.ComboBoxEdit cbeFaceNumberPerPage;
        private DevExpress.XtraEditors.PictureEdit pictureEdit1;
        private DevExpress.XtraEditors.SplitContainerControl splitContainerControl2;
        private DevExpress.XtraLayout.LayoutControl layoutControl1;
        private DevExpress.XtraLayout.LayoutControlGroup layoutControlGroup1;
        private DevExpress.XtraLayout.LayoutControlItem layoutControlItem1;
        private DevExpress.XtraLayout.LayoutControlItem layoutControlItem2;
        private DevExpress.XtraLayout.LayoutControlItem layoutControlItem3;
        private DevExpress.XtraLayout.LayoutControl layoutControl2;
        private DevExpress.XtraLayout.LayoutControlGroup layoutControlGroup2;
        private DevExpress.XtraLayout.LayoutControlItem layoutControlItem4;
        private DevExpress.XtraLayout.LayoutControlItem layoutControlItem5;
        private DevExpress.XtraLayout.LayoutControlItem layoutControlItem6;
        private DevExpress.XtraLayout.LayoutControlItem layoutControlItem7;
        private DevExpress.XtraLayout.LayoutControlItem layoutControlItem8;
        private DevExpress.XtraEditors.SimpleButton btnVehicleLastPage;
        private DevExpress.XtraEditors.SimpleButton btnVehicleNextPage;
        private DevExpress.XtraEditors.SimpleButton btnVehiclePrePage;
        private DevExpress.XtraEditors.SimpleButton btnVehicleFirstPage;
        private DevExpress.XtraEditors.ComboBoxEdit comboBoxEdit1;
        private DevExpress.XtraEditors.LabelControl labelControl6;
        private DevExpress.XtraEditors.LabelControl labelControl8;
        private DevExpress.XtraEditors.LabelControl lblVehicleCurrentPage;
        private DevExpress.XtraEditors.SplitContainerControl splitContainerControl5;
        private DevExpress.XtraGrid.GridControl gridControlVehicle;
        private DevExpress.XtraEditors.SplitContainerControl splitContainerControl6;
        private DevExpress.XtraEditors.PictureEdit pictureEditVehicle;
        private DevExpress.XtraEditors.SplitContainerControl splitContainerControlVideoVehicle;
        private DevExpress.XtraEditors.SimpleButton simpleButton10;
        private DevExpress.XtraEditors.SimpleButton simpleButton11;
        private DevExpress.XtraEditors.SimpleButton simpleButton12;
        private DevExpress.XtraGrid.Views.BandedGrid.AdvBandedGridView advBandedGridViewVehicle;
        private DevExpress.XtraGrid.Views.BandedGrid.BandedGridColumn bandedGridColumn7;
        private DevExpress.XtraGrid.Views.BandedGrid.BandedGridColumn bandedGridColumn10;
        private DevExpress.XtraGrid.Views.BandedGrid.BandedGridColumn bandedGridColumn9;
        private DevExpress.XtraGrid.Views.BandedGrid.BandedGridColumn bandedGridColumn8;
        private DevExpress.XtraGrid.Views.BandedGrid.BandedGridColumn bandedGridColumn11;
        private DevExpress.XtraEditors.LabelControl lblEventCurrentPage;
        private DevExpress.XtraEditors.LabelControl labelControl9;
        private DevExpress.XtraEditors.LabelControl labelControl10;
        private DevExpress.XtraEditors.ComboBoxEdit cbeEventNumberPerPage;
        private DevExpress.XtraEditors.SimpleButton btnEventLastPage;
        private DevExpress.XtraEditors.SimpleButton btnEventNextPage;
        private DevExpress.XtraEditors.SimpleButton btnEventPrevPage;
        private DevExpress.XtraEditors.SimpleButton btnEventFirstPage;
        private DevExpress.XtraEditors.SimpleButton btnQueryEvent;
        private DevExpress.XtraEditors.LabelControl labelControl11;
        private DevExpress.XtraEditors.LabelControl labelControl12;
        private DevExpress.XtraEditors.TimeEdit teStartTimeEvent;
        private DevExpress.XtraEditors.TimeEdit teEndTimeEvent;
        private DevExpress.XtraEditors.CheckedComboBoxEdit checkedComboBoxEditEventCamera;
        private DevExpress.XtraEditors.LabelControl labelControl13;
        private DevExpress.XtraEditors.RadioGroup radioGroupEvent;
        private DevExpress.XtraEditors.SplitContainerControl splitContainerControl7;
        private DevExpress.XtraGrid.GridControl gridControlEvent;
        private DevExpress.XtraEditors.SplitContainerControl splitContainerControl8;
        private DevExpress.XtraEditors.PictureEdit pictureEditEvent;
        private DevExpress.XtraEditors.SplitContainerControl splitContainerControlEventVideo;
        private DevExpress.XtraEditors.SimpleButton simpleButton6;
        private DevExpress.XtraEditors.SimpleButton simpleButtonPlay;
        private DevExpress.XtraEditors.SimpleButton simpleButton14;
        private DevExpress.XtraGrid.Views.BandedGrid.AdvBandedGridView advBandedGridViewEvent;
        private DevExpress.XtraGrid.Views.BandedGrid.BandedGridColumn bandedGridColumn12;
        private DevExpress.XtraGrid.Views.BandedGrid.BandedGridColumn bandedGridColumn14;
        private DevExpress.XtraGrid.Views.BandedGrid.BandedGridColumn bandedGridColumn15;
        private DevExpress.XtraGrid.Views.BandedGrid.BandedGridColumn bandedGridColumn13;
        private DevExpress.XtraGrid.Views.BandedGrid.BandedGridColumn bandedGridColumn17;
        private DevExpress.XtraGrid.Views.BandedGrid.BandedGridColumn bandedGridColumn18;
        private DevExpress.XtraGrid.Views.BandedGrid.BandedGridColumn bandedGridColumn19;
        private DevExpress.XtraGrid.Views.BandedGrid.BandedGridColumn bandedGridColumn20;
        private DevExpress.XtraGrid.Views.BandedGrid.BandedGridColumn bandedGridColumn21;
        private DevExpress.XtraGrid.Views.BandedGrid.BandedGridColumn bandedGridColumn22;
        private DevExpress.XtraGrid.Views.BandedGrid.BandedGridColumn bandedGridColumn23;
        private DevExpress.XtraGrid.Views.BandedGrid.GridBand gridBand3;
        private DevExpress.XtraGrid.Views.BandedGrid.GridBand gridBand4;
        private DevExpress.XtraEditors.LabelControl labelControl7;
        private DevExpress.XtraEditors.CheckedComboBoxEdit checkedComboBoxEditUserSelection;
        private DevExpress.XtraGrid.Views.BandedGrid.GridBand gridBand5;
        private DevExpress.XtraGrid.Views.BandedGrid.GridBand gridBand7;
        private DevExpress.XtraGrid.Views.BandedGrid.GridBand gridBand8;
        
    }
}