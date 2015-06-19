<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="admin.aspx.vb" Inherits="pages_admin_admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="row">
        <div class="col-md-4" style="position: relative; float: left">
            <h2>Inventar </h2>
            <p>
                <asp:HyperLink ID="Inventar" runat="server" NavigateUrl="http://edv1/inventar/inventar/inventory.aspx" ImageUrl="~/images/tools.png" />
            </p>
        </div>
        &nbsp;
        <div class="col-md-4" style="position: relative; float: left">
            <h2>Inventar </h2>
            <p>
                <asp:HyperLink ID="Stamm" runat="server" NavigateUrl="http://edv1/toolbox/pages/stamm/about.aspx" ImageUrl="~/images/daten.png" />
            </p>
        </div>
         <div class="col-md-4" style="position: relative; float: left">
             <h2>Problem Mgmt </h2>
             <p>
                 <asp:HyperLink ID="HelpDesk" runat="server" NavigateUrl="http://edv1/inventar/problem/problem.aspx" ImageUrl="~/images/helpdesk.png" />
             </p>
         </div>
    </div>
</asp:Content>
