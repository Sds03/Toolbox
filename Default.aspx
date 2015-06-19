<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DayPilot" Namespace="DayPilot.Web.Ui" TagPrefix="DayPilot" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <div class="col-md-4" style="position:relative;float:left">
            <h2>Daten und Tools </h2>
            <p>
                <asp:Hyperlink ID="ImageButton2" runat="server" NavigateUrl="~/pages/admin/admin.aspx" ImageUrl="~/images/tools.png" />
           
            </p>
        </div>
        <div class="col-md-4" style="position:relative;float:left">
            <h2>Mitarbeiterkalendar 
            </h2>
            <p>
                <asp:Hyperlink ID="ImageButton3" runat="server" NavigateUrl="~/Contact" ImageUrl="~/images/calendar.png" />

                &nbsp;</p>
        </div>
        
        <div class="col-md-4">
            <h2>Medizinische Bibliothek
            </h2>
            <p>
                
                <asp:Hyperlink runat="server" ImageUrl="~/images/books.png" NavigateUrl="pages/library/library.aspx" Target="_self" />

                
            </p>
           
        </div>
        <div class="col-md-4">
            <h2>Internes Intranet 
            </h2>
            <p>
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/intra.png" />
                Hier könnte ein HPK - Intranet sein...<asp:HyperLink ID="HyperLink1" runat="server" Target="_blank" NavigateUrl="https://hpkmail.gutesicht-rendsburg.de/home/urlaub@gutesicht-rendsburg.de/Calendar.html">Urlaubkalendar</asp:HyperLink>
            </p>
            <p>
                &nbsp;
            </p>
        </div>
    </div>

</asp:Content>
