using System;
using System.IO;
using System.Windows.Forms;

namespace BasicRenamer
{
	public partial class frmMain : Form
	{
        private string selectedPath = null;
        
        public frmMain()
		{
			InitializeComponent();
		}

		private void btnFolder_Click(object sender, EventArgs e)
		{
            if (!String.IsNullOrWhiteSpace(selectedPath))
                dlgFolder.SelectedPath = selectedPath;
            
            if (dlgFolder.ShowDialog() == DialogResult.OK)
			{
				lbxFiles.Items.Clear();
				
				string[] files = Directory.GetFiles(dlgFolder.SelectedPath, "*.jpg");
				Array.Sort(files);

				lbxFiles.Items.AddRange(files);

                selectedPath = dlgFolder.SelectedPath;
			}
		}

		private void btnRename_Click(object sender, EventArgs e)
		{
			if ((lbxFiles.Items.Count > 0) && (lbxFiles.Items.Count < 1000))
			{
				for (int i = 0; i < lbxFiles.Items.Count; i++)
				{
					string Source = lbxFiles.Items[i].ToString();
					string Target =
						Path.Combine(
							Path.GetDirectoryName(Source),
							String.Format("{0}.jpg", (i + 1).ToString("000"))
							);

					File.Move(Source, Target);
				}

				lbxFiles.Items.Clear();
			}
		}
	}
}
