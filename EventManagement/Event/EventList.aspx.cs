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
    public partial class EventList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           if(!IsPostBack)
                GetEvents();
        }
        public void GetEvents()
        {
            SqlConnection con = new SqlConnection("Data Source=REJECTEDPIECE06;Initial Catalog=Events;Persist Security Info=True;User ID=Sa;Password=123;Encrypt=False");
            SqlCommand cmd = new SqlCommand("sp_GetEvents", con);
            con.Open();
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader dr = cmd.ExecuteReader();
            EventGrid1.DataSource = dr;
            EventGrid1.DataBind();
            con.Close();



        }
        protected void GridEvent_RowCommand(object sender,GridViewCommandEventArgs e)
        {
           if(e.CommandName=="Edit")
            {
                int EventId=Convert.ToInt32(e.CommandArgument);
                Response.Redirect("~/Event/UpdateEvents.aspx?EventId=" + EventId);
            }
           if(e.CommandName== "CustomDelete")
            {
                int EventId=Convert.ToInt32(e.CommandArgument);
                SqlConnection Con = new SqlConnection("Data Source=REJECTEDPIECE06;Initial Catalog=Events;Persist Security Info=True;User ID=Sa;Password=123;Encrypt=False");
                SqlCommand cmd = new SqlCommand("sp_DeleteEvent",Con);
                cmd.CommandType=CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@EventId", EventId);
                Con.Open();
                int count = cmd.ExecuteNonQuery();
                if(count>0)
                {
                    Response.Write("<Script>alert('Delete Successfull')</Script>");
                    GetEvents();
                }
                else
                {
                    Response.Write("<Script>alert('Failed!')</Script>");
                }
            }
        }
        protected void GrideEvent_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            LinkButton linkButton = (LinkButton)e.Row.FindControl("linkbtnDelete");
            if (linkButton != null)
            {
                linkButton.OnClientClick = "return confirm('Are you sure you want to delete this event?');";
            }
        }
    }
    

}