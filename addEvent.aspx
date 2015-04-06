<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="addEvent.aspx.vb" Inherits="addEvent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" Height="50px" Width="125px">
        <Fields>
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="pid" HeaderText="pid" SortExpression="pid" />
            <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
            <asp:BoundField DataField="vname" HeaderText="vname" SortExpression="vname" />
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:toolboxConnectionString %>" DeleteCommand="DELETE FROM [Person] WHERE [Id] = @original_Id AND [pid] = @original_pid AND [name] = @original_name AND [vname] = @original_vname" InsertCommand="INSERT INTO [Person] ([pid], [name], [vname]) VALUES (@pid, @name, @vname)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Person]" UpdateCommand="UPDATE [Person] SET [pid] = @pid, [name] = @name, [vname] = @vname WHERE [Id] = @original_Id AND [pid] = @original_pid AND [name] = @original_name AND [vname] = @original_vname">
        <DeleteParameters>
            <asp:Parameter Name="original_Id" Type="Int32" />
            <asp:Parameter Name="original_pid" Type="Int32" />
            <asp:Parameter Name="original_name" Type="String" />
            <asp:Parameter Name="original_vname" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="pid" Type="Int32" />
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="vname" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="pid" Type="Int32" />
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="vname" Type="String" />
            <asp:Parameter Name="original_Id" Type="Int32" />
            <asp:Parameter Name="original_pid" Type="Int32" />
            <asp:Parameter Name="original_name" Type="String" />
            <asp:Parameter Name="original_vname" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

