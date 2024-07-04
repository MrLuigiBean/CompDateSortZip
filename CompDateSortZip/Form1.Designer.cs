namespace CompDateSortZip
{
	partial class Form1
	{
		/// <summary>
		///  Required designer variable.
		/// </summary>
		private System.ComponentModel.IContainer components = null;

		/// <summary>
		///  Clean up any resources being used.
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
		///  Required method for Designer support - do not modify
		///  the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{
			Button1 = new Button();
			Button2 = new Button();
			TabControl1 = new TabControl();
			CompressTabPage = new TabPage();
			DateTabPage = new TabPage();
			SortTabPage = new TabPage();
			ZipTabPage = new TabPage();
			LabelHelloWorld = new Label();
			TabControl1.SuspendLayout();
			CompressTabPage.SuspendLayout();
			SuspendLayout();
			// 
			// Button1
			// 
			Button1.Location = new Point(43, 27);
			Button1.Name = "Button1";
			Button1.Size = new Size(75, 23);
			Button1.TabIndex = 0;
			Button1.Text = "button1";
			Button1.UseVisualStyleBackColor = true;
			// 
			// Button2
			// 
			Button2.Location = new Point(383, 418);
			Button2.Name = "Button2";
			Button2.Size = new Size(75, 23);
			Button2.TabIndex = 1;
			Button2.Text = "button2";
			Button2.UseVisualStyleBackColor = true;
			Button2.Click += Button2_Click;
			// 
			// TabControl1
			// 
			TabControl1.Controls.Add(CompressTabPage);
			TabControl1.Controls.Add(DateTabPage);
			TabControl1.Controls.Add(SortTabPage);
			TabControl1.Controls.Add(ZipTabPage);
			TabControl1.Location = new Point(12, 12);
			TabControl1.Name = "TabControl1";
			TabControl1.SelectedIndex = 0;
			TabControl1.Size = new Size(450, 100);
			TabControl1.TabIndex = 2;
			// 
			// CompressTabPage
			// 
			CompressTabPage.Controls.Add(Button1);
			CompressTabPage.Location = new Point(4, 24);
			CompressTabPage.Name = "CompressTabPage";
			CompressTabPage.Padding = new Padding(3);
			CompressTabPage.Size = new Size(442, 72);
			CompressTabPage.TabIndex = 0;
			CompressTabPage.Text = "Compress";
			CompressTabPage.UseVisualStyleBackColor = true;
			// 
			// DateTabPage
			// 
			DateTabPage.Location = new Point(4, 24);
			DateTabPage.Name = "DateTabPage";
			DateTabPage.Padding = new Padding(3);
			DateTabPage.Size = new Size(442, 72);
			DateTabPage.TabIndex = 1;
			DateTabPage.Text = "Date";
			DateTabPage.UseVisualStyleBackColor = true;
			// 
			// SortTabPage
			// 
			SortTabPage.Location = new Point(4, 24);
			SortTabPage.Name = "SortTabPage";
			SortTabPage.Padding = new Padding(3);
			SortTabPage.Size = new Size(442, 72);
			SortTabPage.TabIndex = 2;
			SortTabPage.Text = "Sort";
			SortTabPage.UseVisualStyleBackColor = true;
			// 
			// ZipTabPage
			// 
			ZipTabPage.Location = new Point(4, 24);
			ZipTabPage.Name = "ZipTabPage";
			ZipTabPage.Padding = new Padding(3);
			ZipTabPage.Size = new Size(442, 72);
			ZipTabPage.TabIndex = 3;
			ZipTabPage.Text = "Zip";
			ZipTabPage.UseVisualStyleBackColor = true;
			// 
			// LabelHelloWorld
			// 
			LabelHelloWorld.AutoSize = true;
			LabelHelloWorld.Location = new Point(240, 371);
			LabelHelloWorld.Name = "LabelHelloWorld";
			LabelHelloWorld.Size = new Size(38, 15);
			LabelHelloWorld.TabIndex = 3;
			LabelHelloWorld.Text = "label1";
			// 
			// Form1
			// 
			AutoScaleDimensions = new SizeF(7F, 15F);
			AutoScaleMode = AutoScaleMode.Font;
			ClientSize = new Size(491, 453);
			Controls.Add(LabelHelloWorld);
			Controls.Add(TabControl1);
			Controls.Add(Button2);
			MaximizeBox = false;
			Name = "Form1";
			Text = "The Window Title goes here";
			TabControl1.ResumeLayout(false);
			CompressTabPage.ResumeLayout(false);
			ResumeLayout(false);
			PerformLayout();
		}

		#endregion

		private Button Button1;
		private Button Button2;
		private TabControl TabControl1;
		private TabPage CompressTabPage;
		private TabPage DateTabPage;
		private TabPage SortTabPage;
		private TabPage ZipTabPage;
		private Label LabelHelloWorld;
	}
}
