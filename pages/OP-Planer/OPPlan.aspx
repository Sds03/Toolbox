<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="OPPlan.aspx.vb" Inherits="pages_OP_Planer_OPPlan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:Panel runat="server" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="8px" Direction="LeftToRight" HorizontalAlign="Justify">
        <p>
            <strong>OP-Datum:&nbsp; </strong>&nbsp;<asp:TextBox ID="TB_OPDate" runat="server"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="TB_OPDate" Format="dd-MM-yyyy"></ajaxToolkit:CalendarExtender>
           
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           
        </p>
        <p>
            <strong>Termindatei:<asp:FileUpload ID="FileUpload1" runat="server" />
            <asp:Button ID="Button1" runat="server" Text="Datei Upload" />
            &nbsp;</strong></p>
        <p>
            <strong>Ort</strong>:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="DropDownList1" runat="server">
                <asp:ListItem>Rendsburg OP 1.OG</asp:ListItem>
                <asp:ListItem>NMS OP 2.OG</asp:ListItem>
            </asp:DropDownList>
            &nbsp;&nbsp;&nbsp;&nbsp;
        </p>
        <p>
            <strong>Anästhesie</strong>:
            <asp:TextBox ID="TextBox1" runat="server" Height="16px" Width="247px"></asp:TextBox>
        </p>
        <p>
            <strong>2.Assistenz</strong>:
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        </p>
        <p>
            <strong>Raum:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            </strong>
        </p>
    </asp:Panel>

</asp:Content>

