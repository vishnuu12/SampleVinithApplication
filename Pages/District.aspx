<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/Common.master" CodeBehind="District.aspx.cs" Inherits="SampleVinithApplication.District" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        body {
            font: 12px verdana;
        }

        table#ContentPlaceHolder1_gvDistrict {
            border-collapse: collapse;
            width: 100%;
        }

            table#ContentPlaceHolder1_gvDistrict tr th {
                padding: 8px;
                color: white;
                border: 1px solid black;
            }


            table#ContentPlaceHolder1_gvDistrict tr:nth-child(even) {
                background-color: white;
            }

            table#ContentPlaceHolder1_gvDistrict tr:nth-child(odd) {
                background-color: #618685;
            }

            table#ContentPlaceHolder1_gvDistrict td {
                border: 1px solid black;
                padding: 8px;
            }

            table#ContentPlaceHolder1_gvDistrict tr:last-child td {
            }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
    <script type="text/javascript">
        function deleteConfirm(Id) {
            swal({
                title: "Are you sure?",
                text: "If Yes, the District will be deleted permanently",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "Yes, Delete it!",
                closeOnConfirm: false
            }, function () {
                //showLoader();
                __doPostBack('deletegvDistrict', Id);
            });
            return false;
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <contenttemplate>
            <div class="card-container">
                <div id="divAdd" runat="server">
                    <div class="text-center" style="float: right;">
                        <asp:LinkButton ID="btnAddNew" runat="server" Text="Add New" OnClick="btnAddNew_Click"
                            CssClass="btn btn-success add-emp"></asp:LinkButton>
                    </div>
                </div>

                <div id="divInput" runat="server">
                    <div class="ip-div text-center">

                        <div class="col-sm-12 p-t-10">
                            <div class="col-sm-2">
                            </div>
                            <div class="col-sm-4 text-right">
                                <div class="text-left">
                                    <label class="form-label mandatorylbl">
                                        Name</label>
                                </div>
                                <div>
                                    <asp:TextBox ID="txtName" runat="server" Width="70%" CssClass="form-control mandatoryfield"
                                        ToolTip="Enter District Name" AutoComplete="off" placeholder="Enter District Name">
                                    </asp:TextBox>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="text-left">
                                    <label class="form-label">
                                        Pincode</label>
                                </div>
                                <div>
                                    <asp:TextBox runat="server" ID="txtPincode" AutoComplete="off" CssClass="form-control"
                                        Width="70%" placeholder="Enter Pincode" />
                                </div>
                            </div>
                            <div class="col-sm-2">
                            </div>
                        </div>

                        <div class="col-sm-12 p-t-20">
                            <asp:LinkButton ID="btnSave" runat="server" Text="Save" CssClass="btn btn-cons btn-save AlignTop"
                              OnClick="btnSave_Click"></asp:LinkButton>
                            <asp:LinkButton ID="btnCancel" runat="server" Text="Cancel"
                                CssClass="btn btn-cons btn-danger AlignTop"  OnClick="btnCancel_Click"></asp:LinkButton>
                        </div>
                    </div>
                </div>
                <div id="divOutput" class="output_section" runat="server">
                    <div class="page-container" style="float: left; width: 100%">
                        <div class="main-card">
                            <div class="card-body">
                                <div class="col-md-12 row">
                                    <div class="col-md-6">
                                        <p class="h-style">
                                            <asp:Label ID="lbltitle" runat="server" Text="District Details"></asp:Label>
                                        </p>
                                    </div>
                                </div>
                                <div class="col-sm-12 p-t-10">

                                    <asp:GridView ID="gvDistrict" runat="server" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True"
                                        EmptyDataText="No Records Found" CssClass="table table-hover table-bordered medium"
                                        HeaderStyle-HorizontalAlign="Center" OnRowCommand="gvDistrict_RowCommand" DataKeyNames="Id">
                                        <Columns>
                                            <asp:TemplateField HeaderText="S.No" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSno" runat="server" Text=' <%# Container.DataItemIndex + 1 %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="District Name" ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-left">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Pincode" ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-left">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblPincode" runat="server" Text='<%# Eval("Pincode")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Edit" ItemStyle-CssClass="text-center">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lbtnEdit" runat="server" CommandName="EditDistrictDetails" CommandArgument='<%#((GridViewRow) Container).RowIndex %>'>
                                                            Edit</asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Delete" ItemStyle-CssClass="text-center">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lbtnDelete" runat="server" OnClientClick='<%# string.Format("return deleteConfirm({0});",Eval("Id")) %>'>
                                                            Delete</asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <asp:HiddenField ID="hdnDistrictID" Value="0" runat="server" />
        </contenttemplate>
    </div>
</asp:Content>
