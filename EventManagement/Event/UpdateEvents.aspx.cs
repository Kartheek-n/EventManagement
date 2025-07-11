using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EventManagement.Event
{
    public partial class UpdateEvents : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int EventId = Convert.ToInt32(Request.QueryString["EventId"]);
                GetEventById(EventId);
            }
            
        }
        protected void GetEventById(int EventId)
        {
            
            SqlConnection Con = new SqlConnection("Data Source=REJECTEDPIECE06;Initial Catalog=Events;Persist Security Info=True;User ID=Sa;Password=123;Encrypt=False");
            SqlDataAdapter da = new SqlDataAdapter("sp_GetEventsById", Con);
            da.SelectCommand.CommandType = System.Data.CommandType.StoredProcedure;
           da.SelectCommand.Parameters.AddWithValue("@EventId",EventId);
            Con.Open();
            DataTable dt=new DataTable();
            da.Fill(dt);
            if(dt.Rows.Count>0)
            {
                txtUEventid.Text = dt.Rows[0]["EventId"].ToString();
                txtUEventName.Text = dt.Rows[0]["EventName"].ToString();
                txtUEventCode.Text = dt.Rows[0]["EventCode"].ToString();
                txtUEventDate.Text = dt.Rows[0]["EventDate"].ToString();
                txtUstartTime.Text = dt.Rows[0]["StartTime"].ToString();
                txtUEndTime.Text = dt.Rows[0]["EndTime"].ToString();
                txtUDescription.Text=dt.Rows[0]["Description"].ToString();
                ViewState["EventId"] = EventId;
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string EventId=txtUEventid.Text;
            string EventName=txtUEventName.Text;
            string EventCode=txtUEventCode.Text;
            string EventDate=txtUEventDate.Text;
            string StartTime=txtUstartTime.Text;
            string EndTime=txtUEndTime.Text;
            string Description=txtUDescription.Text;
            try 
            {
                SqlConnection Con = new SqlConnection("Data Source=REJECTEDPIECE06;Initial Catalog=Events;Persist Security Info=True;User ID=Sa;Password=123;Encrypt=False");
                SqlCommand cmd = new SqlCommand("sp_UpdateEvent", Con);
                Con.Open();
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("EventId", EventId);
                cmd.Parameters.AddWithValue("EventName", EventName);
                cmd.Parameters.AddWithValue("EventCode", EventCode);
                cmd.Parameters.AddWithValue("EventDate", EventDate);
                cmd.Parameters.AddWithValue("StartTime", StartTime);
                cmd.Parameters.AddWithValue("EndTime", EndTime);
                cmd.Parameters.AddWithValue("Description", Description);
                int count = cmd.ExecuteNonQuery();

                if (count > 0)
                {
                    Response.Write("<Script>alert('Update Successfull')</Script>");
                    Response.Redirect("~/Event/EventList.aspx");

                }
                else
                {
                    Response.Write("<Script>alert('Failed!')</Script>");
                }
            }
            catch(Exception)
            {
                Response.Write("<Script>alert('Event Code Should not be Same!')</Script>");
            }
            
            
        }

    }
}