using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EventManagement.Event
{
    public partial class AddEvents : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string EventName=txtEventName.Text;
            string EventCode=txtEventCode.Text;
            string EventDate=txtEventDate.Text;
            string StartTime=txtStartTime.Text;
            string EndTime=txtEndTime.Text;
            string Description=txtDescription.Text;
            try {
                SqlConnection con = new SqlConnection("Data Source=REJECTEDPIECE06;Initial Catalog=Events;Persist Security Info=True;User ID=Sa;Password=123;Encrypt=False");
                SqlCommand cmd = new SqlCommand("sp_InsetEvent", con);
                con.Open();
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("EventName", EventName);
                cmd.Parameters.AddWithValue("EventCode", EventCode);
                cmd.Parameters.AddWithValue("EventDate", EventDate);
                cmd.Parameters.AddWithValue("StartTime", StartTime);
                cmd.Parameters.AddWithValue("EndTime", EndTime);
                cmd.Parameters.AddWithValue("Description", Description);
                int count = cmd.ExecuteNonQuery();

                if (count > 0)
                {
                    Response.Write("<Script>alert('SuceesFull')</Script>");
                    Response.Redirect("~/Event/EventList.aspx");
                }
                else
                {
                    Response.Write("<Script>alert('Failed!')</Script>");
                }
            }
            catch(Exception )
            {
                Response.Write("<Script>alert('Event Code Should not be Same!')</Script>");

            }
            


            
        }
    }
}