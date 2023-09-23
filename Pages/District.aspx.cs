using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Configuration;

namespace SampleVinithApplication
{
    public partial class District : System.Web.UI.Page
    {
        #region"Page Load"
        protected void Page_Load(object sender, EventArgs e)
        {
            string target = Request["__EVENTTARGET"];
            string arg = Request["__EVENTARGUMENT"];
            try
            {
                if (IsPostBack == false)
                {
                    ShowHideControls("view");
                    GetDistrictRecords();
                }
                else
                {
                    if (target == "deletegvDistrict")
                    {
                        CommonDAL dal = new CommonDAL();

                        dal.Id = Convert.ToInt32(arg);
                        DataSet ds = dal.DeleteDistrictById();

                        if (ds.Tables[0].Rows[0]["Message"].ToString() == "Deleted")
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "Delete", "SuccessMessage('Success','Supplier Name Deleted successfully');", true);
                        else
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "Delete", "SuccessMessage('Success','" + ds.Tables[0].Rows[0]["Message"].ToString() + "');", true);

                        GetDistrictRecords();
                        ShowHideControls("view");
                    }
                }
            }
            catch
            {
                //error code here
            }
        }

        #endregion

        #region"Button Events"
        protected void btnAddNew_Click(object sender, EventArgs e)
        {
            ShowHideControls("add");
            hdnDistrictID.Value = "0";
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            ShowHideControls("view");
            ClearValues();
            hdnDistrictID.Value = "0";
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            DataSet ds = new DataSet();
            CommonDAL dal = new CommonDAL();

            try
            {

                dal.Id = Convert.ToInt32(hdnDistrictID.Value);
                dal.Name = txtName.Text;
                dal.Pincode = Convert.ToInt32(txtPincode.Text);

                ds = dal.InsertDistrict();

                if (ds.Tables[0].Rows[0]["Message"].ToString() == "Added")
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Success", "SuccessMessage('Success','Supplier Name Saved Successfully');hideLoader();", true);

                else if (ds.Tables[0].Rows[0]["Message"].ToString() == "Updated")
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Success", "SuccessMessage('Success','Supplier Name Updated Successfully');hideLoader();", true);

                else if (ds.Tables[0].Rows[0]["Message"].ToString() == "AE")
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Info", "InfoMessage('Information','Supplier Name Already Exists');hideLoader();", true);

                ShowHideControls("view");
                ClearValues();
                GetDistrictRecords();

            }
            catch (Exception ex)
            {
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "Success", "ErrorMessage('Error','Error Occured');hideLoader();", true);
                //Log.Message(ex.ToString());
            }
        }

        #endregion

        #region"GridView Events"

        protected void gvDistrict_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            DataSet ds = new DataSet();
            CommonDAL dal = new CommonDAL();
            int index;
            try
            {
                index = Convert.ToInt32(e.CommandArgument.ToString());

                hdnDistrictID.Value = gvDistrict.DataKeys[index].Values[0].ToString();
                dal.Id = Convert.ToInt32(hdnDistrictID.Value);
                ds = dal.GetDistrictById();

                if (e.CommandName.ToString() == "EditDistrictDetails")
                {
                    txtName.Text = ds.Tables[0].Rows[0]["Name"].ToString();
                    txtPincode.Text = ds.Tables[0].Rows[0]["Pincode"].ToString();
                    ShowHideControls("add");
                }
            }
            catch (Exception ex)
            {
                //Log.Message(ex.ToString());
            }
        }

        #endregion

        #region"Common Methods"
        private void GetDistrictRecords()
        {
            DataSet ds = new DataSet();
            CommonDAL dB = new CommonDAL();
            try
            {
                ds = dB.GetDistrict();

                if (ds.Tables[0].Rows.Count > 0)
                {
                    gvDistrict.DataSource = ds.Tables[0];
                    gvDistrict.DataBind();
                }
                else
                {
                    gvDistrict.DataSource = "";
                    gvDistrict.DataBind();
                }

            }
            catch (Exception ex)
            {
                //Log.Message(ex.ToString());
            }
        }

        private void ShowHideControls(string mode)
        {
            try
            {
                divAdd.Visible = divInput.Visible = divOutput.Visible = false;

                switch (mode.ToLower())
                {
                    case "add":
                        divInput.Visible = true;
                        txtName.Focus();
                        break;
                    case "edit":
                        divInput.Visible = true;
                        txtName.Focus();
                        break;
                    case "view":
                        divAdd.Visible = divOutput.Visible = true;
                        break;
                }
            }
            catch (Exception ex)
            {
                //Log.Message(ex.ToString());
            }
        }
        private void ClearValues()
        {
            hdnDistrictID.Value = "0";
            txtName.Text = "";
            txtPincode.Text = "";
        }


        #endregion
    }
}