<%@ Page Title="" Language="VB" MasterPageFile="~/pages/Stamm/Stamm.master" AutoEventWireup="false" CodeFile="Times.aspx.vb" Inherits="pages_Stamm_Times" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:toolboxConnectionString %>" DeleteCommand="DELETE FROM [times] WHERE [id] = @original_id AND (([day] = @original_day) OR ([day] IS NULL AND @original_day IS NULL)) AND (([dayname] = @original_dayname) OR ([dayname] IS NULL AND @original_dayname IS NULL)) AND (([variable] = @original_variable) OR ([variable] IS NULL AND @original_variable IS NULL))" InsertCommand="INSERT INTO [times] ([day], [dayname], [variable]) VALUES (@day, @dayname, @variable)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT id, day, dayname, variable, vacationvalue FROM times" UpdateCommand="UPDATE [times] SET [day] = @day, [dayname] = @dayname, [variable] = @variable WHERE [id] = @original_id AND (([day] = @original_day) OR ([day] IS NULL AND @original_day IS NULL)) AND (([dayname] = @original_dayname) OR ([dayname] IS NULL AND @original_dayname IS NULL)) AND (([variable] = @original_variable) OR ([variable] IS NULL AND @original_variable IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_id" Type="Int32" />
            <asp:Parameter DbType="Date" Name="original_day" />
            <asp:Parameter Name="original_dayname" Type="String" />
            <asp:Parameter Name="original_variable" Type="Boolean" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter DbType="Date" Name="day" />
            <asp:Parameter Name="dayname" Type="String" />
            <asp:Parameter Name="variable" Type="Boolean" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter DbType="Date" Name="day" />
            <asp:Parameter Name="dayname" Type="String" />
            <asp:Parameter Name="variable" Type="Boolean" />
            <asp:Parameter Name="original_id" Type="Int32" />
            <asp:Parameter DbType="Date" Name="original_day" />
            <asp:Parameter Name="original_dayname" Type="String" />
            <asp:Parameter Name="original_variable" Type="Boolean" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <table class="nav-justified">
                <tr>
                    <td style="width: 528px">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 528px">


                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:CommandField ShowDeleteButton="True" ShowSelectButton="True" />
                                <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" InsertVisible="False" ReadOnly="True" />
                                <asp:BoundField DataField="day" HeaderText="day" SortExpression="day" />
                                <asp:BoundField DataField="dayname" HeaderText="dayname" SortExpression="dayname" />
                                <asp:CheckBoxField DataField="variable" HeaderText="variable" SortExpression="variable" />
                                <asp:BoundField DataField="vacationvalue" HeaderText="vacationvalue" SortExpression="vacationvalue" />
                            </Columns>
                            <EditRowStyle BackColor="#999999" />
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#cccccc" Font-Bold="True" ForeColor="Black" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#E9E7E2" />
                            <SortedAscendingHeaderStyle BackColor="#506C8C" />
                            <SortedDescendingCellStyle BackColor="#FFFDF8" />
                            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                        </asp:GridView>
                    </td>
                    <td>
                        <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataKeyNames="id" DataSourceID="SqlDataSource2" BorderStyle="Solid">
                            <Fields>
                                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                                <asp:TemplateField HeaderText="Datum" SortExpression="day">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("day") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("day") %>'></asp:TextBox>
                                        <ajaxToolkit:CalendarExtender ID="TextBox1_CalendarExtender" runat="server"  Format="dd-MM-yyyy" TargetControlID="TextBox1">
                                        </ajaxToolkit:CalendarExtender>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("day") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="dayname" HeaderText="Feiertag" SortExpression="dayname" />
                                <asp:CheckBoxField DataField="variable" HeaderText="variable" SortExpression="variable" />
                                <asp:BoundField DataField="vacationvalue" HeaderText="Urlaubswert" SortExpression="vacationvalue" />
                                <asp:CommandField ShowEditButton="True" ShowInsertButton="True" />
                            </Fields>
                        </asp:DetailsView>

                    </td>
                </tr>
                <tr>
                    <td style="width: 528px">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:toolboxConnectionString %>" DeleteCommand="DELETE FROM [times] WHERE [id] = @original_id AND (([day] = @original_day) OR ([day] IS NULL AND @original_day IS NULL)) AND (([dayname] = @original_dayname) OR ([dayname] IS NULL AND @original_dayname IS NULL)) AND (([variable] = @original_variable) OR ([variable] IS NULL AND @original_variable IS NULL)) AND (([vacationvalue] = @original_vacationvalue) OR ([vacationvalue] IS NULL AND @original_vacationvalue IS NULL))" InsertCommand="INSERT INTO [times] ([day], [dayname], [variable], [vacationvalue]) VALUES (@day, @dayname, @variable, @vacationvalue)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT id, day, dayname, variable, vacationvalue FROM times WHERE (id = @id)" UpdateCommand="UPDATE [times] SET [day] = @day, [dayname] = @dayname, [variable] = @variable, [vacationvalue] = @vacationvalue WHERE [id] = @original_id AND (([day] = @original_day) OR ([day] IS NULL AND @original_day IS NULL)) AND (([dayname] = @original_dayname) OR ([dayname] IS NULL AND @original_dayname IS NULL)) AND (([variable] = @original_variable) OR ([variable] IS NULL AND @original_variable IS NULL)) AND (([vacationvalue] = @original_vacationvalue) OR ([vacationvalue] IS NULL AND @original_vacationvalue IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_id" Type="Int32" />
            <asp:Parameter DbType="Date" Name="original_day" />
            <asp:Parameter Name="original_dayname" Type="String" />
            <asp:Parameter Name="original_variable" Type="Boolean" />
            <asp:Parameter Name="original_vacationvalue" Type="Double" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter DbType="Date" Name="day" />
            <asp:Parameter Name="dayname" Type="String" />
            <asp:Parameter Name="variable" Type="Boolean" />
            <asp:Parameter Name="vacationvalue" Type="Double" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="id" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter DbType="Date" Name="day" />
            <asp:Parameter Name="dayname" Type="String" />
            <asp:Parameter Name="variable" Type="Boolean" />
            <asp:Parameter Name="vacationvalue" Type="Double" />
            <asp:Parameter Name="original_id" Type="Int32" />
            <asp:Parameter DbType="Date" Name="original_day" />
            <asp:Parameter Name="original_dayname" Type="String" />
            <asp:Parameter Name="original_variable" Type="Boolean" />
            <asp:Parameter Name="original_vacationvalue" Type="Double" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

