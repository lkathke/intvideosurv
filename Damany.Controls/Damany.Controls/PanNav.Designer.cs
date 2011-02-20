namespace Damany.Controls
{
    partial class PanNav
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

        #region Component Designer generated code

        /// <summary> 
        /// Required method for Designer support - do not modify 
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.btnDefaultPos = new DevExpress.XtraEditors.SimpleButton();
            this.up = new DevExpress.XtraEditors.SimpleButton();
            this.leftUp = new DevExpress.XtraEditors.SimpleButton();
            this.rightUp = new DevExpress.XtraEditors.SimpleButton();
            this.left = new DevExpress.XtraEditors.SimpleButton();
            this.center = new DevExpress.XtraEditors.SimpleButton();
            this.right = new DevExpress.XtraEditors.SimpleButton();
            this.leftDown = new DevExpress.XtraEditors.SimpleButton();
            this.Down = new DevExpress.XtraEditors.SimpleButton();
            this.Rightdown = new DevExpress.XtraEditors.SimpleButton();
            this.toolTip1 = new System.Windows.Forms.ToolTip(this.components);
            this.SuspendLayout();
            // 
            // btnDefaultPos
            // 
            this.btnDefaultPos.Location = new System.Drawing.Point(5, 119);
            this.btnDefaultPos.LookAndFeel.SkinName = "Black";
            this.btnDefaultPos.Name = "btnDefaultPos";
            this.btnDefaultPos.Size = new System.Drawing.Size(129, 23);
            this.btnDefaultPos.TabIndex = 5;
            this.btnDefaultPos.Text = "����Ԥ��λ��";
            // 
            // up
            // 
            this.up.Image = global::Damany.Controls.Properties.Resources.Up;
            this.up.Location = new System.Drawing.Point(52, 2);
            this.up.Name = "up";
            this.up.Size = new System.Drawing.Size(38, 33);
            this.up.TabIndex = 4;
            this.up.Text = "�۽�-";
            this.up.ToolTip = "��̨����";
            // 
            // leftUp
            // 
            this.leftUp.Image = global::Damany.Controls.Properties.Resources.LeftUp;
            this.leftUp.Location = new System.Drawing.Point(5, 2);
            this.leftUp.Name = "leftUp";
            this.leftUp.Size = new System.Drawing.Size(41, 33);
            this.leftUp.TabIndex = 3;
            this.leftUp.Text = "�۽�+";
            this.leftUp.ToolTip = "����";
            // 
            // rightUp
            // 
            this.rightUp.Image = global::Damany.Controls.Properties.Resources.RightUp;
            this.rightUp.Location = new System.Drawing.Point(96, 2);
            this.rightUp.Name = "rightUp";
            this.rightUp.Size = new System.Drawing.Size(38, 33);
            this.rightUp.TabIndex = 4;
            this.rightUp.Text = "��̨����λ���ƶ�";
            // 
            // left
            // 
            this.left.Image = global::Damany.Controls.Properties.Resources.left;
            this.left.Location = new System.Drawing.Point(5, 41);
            this.left.Name = "left";
            this.left.Size = new System.Drawing.Size(41, 33);
            this.left.TabIndex = 3;
            this.left.Text = "�۽�+";
            this.left.ToolTip = "��̨�����ƶ�";
            // 
            // center
            // 
            this.center.Image = global::Damany.Controls.Properties.Resources.Stop;
            this.center.Location = new System.Drawing.Point(52, 41);
            this.center.Name = "center";
            this.center.Size = new System.Drawing.Size(38, 33);
            this.center.TabIndex = 4;
            this.center.Text = "�۽�-";
            this.center.ToolTip = "���ص�Ԥ��λ��";
            // 
            // right
            // 
            this.right.Image = global::Damany.Controls.Properties.Resources.Right;
            this.right.Location = new System.Drawing.Point(96, 41);
            this.right.Name = "right";
            this.right.Size = new System.Drawing.Size(38, 33);
            this.right.TabIndex = 4;
            this.right.Text = "�۽�-";
            this.right.ToolTip = "��̨�����ƶ�";
            // 
            // leftDown
            // 
            this.leftDown.Image = global::Damany.Controls.Properties.Resources.LeftDown;
            this.leftDown.Location = new System.Drawing.Point(5, 80);
            this.leftDown.Name = "leftDown";
            this.leftDown.Size = new System.Drawing.Size(41, 33);
            this.leftDown.TabIndex = 3;
            this.leftDown.Text = "�۽�+";
            this.leftDown.ToolTip = "��̨�����ƶ�";
            // 
            // Down
            // 
            this.Down.Image = global::Damany.Controls.Properties.Resources.Down;
            this.Down.Location = new System.Drawing.Point(52, 80);
            this.Down.Name = "Down";
            this.Down.Size = new System.Drawing.Size(38, 33);
            this.Down.TabIndex = 4;
            this.Down.Text = "��̨�����ƶ�";
            // 
            // Rightdown
            // 
            this.Rightdown.Image = global::Damany.Controls.Properties.Resources.RightDown;
            this.Rightdown.Location = new System.Drawing.Point(96, 80);
            this.Rightdown.Name = "Rightdown";
            this.Rightdown.Size = new System.Drawing.Size(38, 33);
            this.Rightdown.TabIndex = 4;
            this.Rightdown.Text = "��̨�����ƶ�";
            // 
            // PanNav
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.btnDefaultPos);
            this.Controls.Add(this.Rightdown);
            this.Controls.Add(this.right);
            this.Controls.Add(this.rightUp);
            this.Controls.Add(this.Down);
            this.Controls.Add(this.leftDown);
            this.Controls.Add(this.center);
            this.Controls.Add(this.left);
            this.Controls.Add(this.up);
            this.Controls.Add(this.leftUp);
            this.Name = "PanNav";
            this.Size = new System.Drawing.Size(145, 150);
            this.ResumeLayout(false);

        }

        #endregion

        public DevExpress.XtraEditors.SimpleButton btnDefaultPos;
        public DevExpress.XtraEditors.SimpleButton up;
        public DevExpress.XtraEditors.SimpleButton leftUp;
        public DevExpress.XtraEditors.SimpleButton rightUp;
        public DevExpress.XtraEditors.SimpleButton left;
        public DevExpress.XtraEditors.SimpleButton center;
        public DevExpress.XtraEditors.SimpleButton right;
        public DevExpress.XtraEditors.SimpleButton leftDown;
        public DevExpress.XtraEditors.SimpleButton Down;
        public DevExpress.XtraEditors.SimpleButton Rightdown;
        private System.Windows.Forms.ToolTip toolTip1;
    }
}
