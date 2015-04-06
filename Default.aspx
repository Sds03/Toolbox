<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register assembly="DayPilot" namespace="DayPilot.Web.Ui" tagprefix="DayPilot" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <div class="col-md-4">
            <h2>Stammdatenpflege</h2>
            <p>
                Hier geht&#39;s zum Anlegen und Ändern der Mitarbeiterdaten&nbsp;
            </p>
            <p>
                <a class="btn btn-default" href="pages/Stamm/about.aspx">los geht&#39;s &raquo;</a>
                <a class="btn btn-default" href="http://edv1/inventar/problem/problem.aspx">Problem Mgmt&#39;s &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Mitarbeiterkalendar.
            </h2>
            <p>
                <a class="btn btn-default" href="contact.aspx">los geht&#39;s &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Internes Intranet</h2>
            <p>
                Hier könnte ein HPK - Intranet sein...<asp:HyperLink ID="HyperLink1" runat="server" Target="_blank" NavigateUrl="https://hpkmail.gutesicht-rendsburg.de/home/urlaub@gutesicht-rendsburg.de/Calendar.html">Urlaubkalendar</asp:HyperLink>
            </p>
            <p>
                &nbsp;</p>
        </div>
    </div>

</asp:Content>
