<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Tasks.aspx.vb" Inherits="Inventar_Tasks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:toolboxConnectionString %>" SelectCommand="SELECT ClientsDB.DNSName, ClientsDB.Task, Abteilungen.Abteilung FROM ClientsDB INNER JOIN Abteilungen ON ClientsDB.Abteilungsnummer = Abteilungen.Abteilungsnummer WHERE (ClientsDB.Abteilungsnummer = @Abteilungsnr) ORDER BY ClientsDB.Abteilungsnummer, ClientsDB.DNSName">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="Abteilungsnr" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:toolboxConnectionString %>" SelectCommand="SELECT [Abteilung], [id] FROM [Abteilungen]"></asp:SqlDataSource>
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="Abteilung" DataValueField="id" AutoPostBack="True">
            </asp:DropDownList>


            <asp:GridView ID="GridView1" runat="server" AllowSorting="True" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="DNSName" HeaderText="DNSName" SortExpression="DNSName" />
                    <asp:BoundField DataField="Task" HeaderText="Task" SortExpression="Task" />
                    <asp:BoundField DataField="Abteilung" HeaderText="Abteilung" SortExpression="Abteilung" />
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#CCCCCC" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

