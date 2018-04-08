using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NV.VideoRental.Admin
{
    public partial class Movies : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            StreamReader csvreader = new StreamReader(fuMovies.FileContent);

            string line = csvreader.ReadLine();
            string[] values = line.Split(',');

            if (values.Length != 15)
            {
                lblMessage.Text = "CSV File is not in the correct format";
            }
            else
            {
                StringBuilder sb = new StringBuilder();

                while (!csvreader.EndOfStream)
                {
                    line = csvreader.ReadLine();
                    values = line.Split(',');

                    try
                    {
                        using (LacklusterEntities entity = new LacklusterEntities())
                        {
                            video vid = new video();
                            vid.title = values[0];
                            vid.studio = values[1];

                            if (String.IsNullOrWhiteSpace(values[2]))
                                vid.released = null;
                            else
                            {
                                DateTime release;
                                if (DateTime.TryParse(values[2], out release))
                                    vid.released = release;
                                else
                                    vid.released = null;          
                            }
                                

                            vid.status = values[3];
                            vid.sound = values[4];
                            vid.versions = values[5];

                            if (String.IsNullOrWhiteSpace(values[6]))
                                vid.price = null;
                            else
                            {
                                decimal prc;
                                if (Decimal.TryParse(values[6], out prc))
                                    vid.price = prc;
                                else
                                    vid.price = null;
                            }

                            vid.rating = values[7];
                            vid.year = values[8];
                            vid.genre = values[9];
                            vid.aspect = values[10];
                            vid.UPC = values[11];

                            if (String.IsNullOrWhiteSpace(values[12]))
                                vid.releaseDate = null;
                            else
                            {
                                DateTime release;
                                if (DateTime.TryParse(values[12], out release))
                                    vid.releaseDate = release;
                                else
                                    vid.releaseDate = null;
                            }

                            entity.videos.Add(vid);

                            entity.SaveChanges();
                        }
                    }
                    catch (Exception ex)
                    {
                        line += "," + ex.Message.ToString();
                        sb.AppendLine(line);
                        continue;
                    }
                }

                    Response.Clear();
                    Response.Buffer = true;
                    Response.AddHeader("content-disposition", "attachment;filename=UploadErrors.csv");
                    Response.Charset = "";
                    Response.ContentType = "application/text";
                    Response.Output.Write(sb.ToString());
                    Response.Flush();
                    Response.End();
            }
        }
    }
}