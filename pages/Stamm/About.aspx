<%@ Page Title="About" Language="VB" MasterPageFile="~/pages/Stamm/Stamm.Master" AutoEventWireup="true" CodeFile="About.aspx.vb" Inherits="About" %>

<%@ Register Assembly="DayPilot" Namespace="DayPilot.Web.Ui" TagPrefix="DayPilot" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    .<link href='css/main.css' type="text/css" rel="stylesheet" /><script src="../../Scripts/daypilot-modal-2.1.js"></script><script type="text/javascript">


        function modalDays(id) {
            var modal = new DayPilot.Modal();
            modal.top = 60;
            modal.width = 300;
            modal.opacity = 100;
            modal.border = "10px solid #d0d0d0";
            modal.showUrl("Days.aspx?id=" + id);
            modal.closed = function () {
                if (this.result == "OK") {
                    //DayPilotScheduler.commandCallBack('refresh');
                    document.location.reload();
                    //DayPilotScheduler.clearSelection();
                }

            }
        }
    </script><script type="text/javascript">

        function getPersonalInfo() {
            var modal = new DayPilotScheduler.Modal();
            alert('hallo oscar');
            modal.top = 60;
            modal.width = 300;
            modal.opacity = 70;
            modal.border = "10px solid #d0d0d0";
            modal.showUrl("tools.aspx?start=");
            modal.closed = function () {
                if (this.result == "OK") {
                    //DayPilotScheduler.commandCallBack('refresh');
                    document.location.reload();
                }
                //DayPilotScheduler.clearSelection();
            };
        }
    </script><asp:SqlDataSource ID="SqlDataSource3" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:toolboxConnectionString %>" DeleteCommand="DELETE FROM [Stats] WHERE [id] = @original_id AND [pid] = @original_pid AND (([udaysinyear] = @original_udaysinyear) OR ([udaysinyear] IS NULL AND @original_udaysinyear IS NULL)) AND (([utaken] = @original_utaken) OR ([utaken] IS NULL AND @original_utaken IS NULL)) AND (([uleftover] = @original_uleftover) OR ([uleftover] IS NULL AND @original_uleftover IS NULL)) AND (([year] = @original_year) OR ([year] IS NULL AND @original_year IS NULL))" InsertCommand="INSERT INTO [Stats] ( [pid], [udaysinyear], [utaken], [uleftover], [year]) VALUES ( @pid, @udaysinyear, @utaken, @uleftover, @year)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Stats]" UpdateCommand="UPDATE [Stats] SET [pid] = @pid, [udaysinyear] = @udaysinyear, [utaken] = @utaken, [uleftover] = @uleftover, [year] = @year WHERE [id] = @original_id AND [pid] = @original_pid AND (([udaysinyear] = @original_udaysinyear) OR ([udaysinyear] IS NULL AND @original_udaysinyear IS NULL)) AND (([utaken] = @original_utaken) OR ([utaken] IS NULL AND @original_utaken IS NULL)) AND (([uleftover] = @original_uleftover) OR ([uleftover] IS NULL AND @original_uleftover IS NULL)) AND (([year] = @original_year) OR ([year] IS NULL AND @original_year IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_id" Type="Int32" />
            <asp:Parameter Name="original_pid" Type="Int32" />
            <asp:Parameter Name="original_udaysinyear" Type="Int32" />
            <asp:Parameter Name="original_utaken" Type="Int32" />
            <asp:Parameter Name="original_uleftover" Type="Int32" />
            <asp:Parameter Name="original_year" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="pid" Type="Int32" />
            <asp:Parameter Name="udaysinyear" Type="Int32" DefaultValue="0" />
            <asp:Parameter Name="utaken" Type="Int32" DefaultValue="0" />
            <asp:Parameter Name="uleftover" Type="Int32" DefaultValue="0" />
            <asp:Parameter Name="year" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="pid" Type="Int32" />
            <asp:Parameter Name="udaysinyear" Type="Int32" />
            <asp:Parameter Name="utaken" Type="Int32" />
            <asp:Parameter Name="uleftover" Type="Int32" />
            <asp:Parameter Name="year" Type="Int32" />
            <asp:Parameter Name="original_id" Type="Int32" />
            <asp:Parameter Name="original_pid" Type="Int32" />
            <asp:Parameter Name="original_udaysinyear" Type="Int32" />
            <asp:Parameter Name="original_utaken" Type="Int32" />
            <asp:Parameter Name="original_uleftover" Type="Int32" />
            <asp:Parameter Name="original_year" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <h2>Stammdaten Personal
                 
                <table class="nav-justified" style="background-color: #ffffff; background-image: inherit;">
                    <tr>
                        <td>
                            <asp:Button ID="Button1" runat="server"  BorderStyle="Outset" Text="Neu" Height="30px" Width="57px" Font-Size="Small" />

                        </td>
                    </tr>
                    <tr>
                        <td style="width: 391px; vertical-align: top; height: 53px;"></td>
                        <td style="width: 471px; vertical-align: top; height: 53px;">&nbsp;</td>
                        <td style="width: 391px; vertical-align: top; height: 53px;">&nbsp;</td>
                        <td style="vertical-align: top; width: 162px; height: 53px;">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:toolboxConnectionString %>" DeleteCommand="DELETE FROM [Personal] WHERE [id] = @original_id " InsertCommand="INSERT INTO [Personal] ([name], [vname], [gebdat], [uname]) VALUES (@name, @vname, @gebdat, @uname)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Personal] ORDER BY [name]" UpdateCommand="UPDATE [Personal] SET [name] = @name, [vname] = @vname, [gebdat] = @gebdat, [uname] = @uname WHERE [id] = @original_id AND (([name] = @original_name) OR ([name] IS NULL AND @original_name IS NULL)) AND (([vname] = @original_vname) OR ([vname] IS NULL AND @original_vname IS NULL)) AND (([gebdat] = @original_gebdat) OR ([gebdat] IS NULL AND @original_gebdat IS NULL)) AND (([uname] = @original_uname) OR ([uname] IS NULL AND @original_uname IS NULL))">
                                <DeleteParameters>
                                    <asp:Parameter Name="original_id" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="name" Type="String" />
                                    <asp:Parameter Name="vname" Type="String" />
                                    <asp:Parameter Name="gebdat" DbType="Date"></asp:Parameter>
                                    <asp:Parameter Name="uname" Type="String" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="name" Type="String" />
                                    <asp:Parameter Name="vname" Type="String" />
                                    <asp:Parameter Name="gebdat" DbType="Date" />
                                    <asp:Parameter Name="uname" Type="String" />
                                    <asp:Parameter Name="original_id" Type="Int32" />
                                    <asp:Parameter Name="original_name" Type="String" />
                                    <asp:Parameter Name="original_vname" Type="String" />
                                    <asp:Parameter DbType="Date" Name="original_gebdat" />
                                    <asp:Parameter Name="original_uname" Type="String" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </td>
                        <td style="vertical-align: top; height: 53px;">
                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:toolboxConnectionString %>"
                                SelectCommand="SELECT * FROM [Abteilungen]"></asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 391px; vertical-align: top; height: 378px;">

                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Font-Size="Medium" Height="205px">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:CommandField ShowSelectButton="True" ShowDeleteButton="True" />
                                    <asp:BoundField DataField="id" HeaderText="Persoid" SortExpression="id" InsertVisible="False" ReadOnly="True" />
                                    <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
                                    <asp:BoundField DataField="vname" HeaderText="Vorname" SortExpression="vname" />
                                    <asp:ButtonField ButtonType="Image"  ImageUrl="~/content/clock.jpg" CommandName="Go" Text="Go"></asp:ButtonField>

                                </Columns>
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                <SortedDescendingHeaderStyle BackColor="#4870BE" />
                            </asp:GridView>
                            <td style="width: 471px; vertical-align: top; height: 378px;">&nbsp;<td style="width: 391px; vertical-align: top; height: 378px;">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:FormView ID="FormView1" runat="server" CssClass="PersoDataPopup" DataKeyNames="id" DataSourceID="SqlDataSource2" Font-Size="Medium" Height="177px" Width="271px">
                                    <EditItemTemplate>
                                        id:
                                            <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                                        <asp:TextBox ID="tb_uname" runat="server" Text='<%# Bind("uname") %>' Visible="False"></asp:TextBox>
                                        <table class="nav-justified">
                                            <tr>
                                                <td>Name</td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="nameTextBox" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                                                    <asp:TextBox ID="nameTextBox" runat="server" Text='<%# Bind("name") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Vorname</td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="vnameTextBox" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                                                    <asp:TextBox ID="vnameTextBox" runat="server" Text='<%# Bind("vname") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Gebdat</td>
                                                <td>
                                                    <asp:TextBox ID="gebdatTextBox" runat="server" Text='<%# Bind("gebdat") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Abteilung</td>
                                                <td>
                                                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource4" DataTextField="Abteilung" DataValueField="id" SelectedValue='<%# Bind("department") %>'>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                           
                                            <tr>
                                                <td>Status</td>
                                                <td>
                                                    <asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Bind("status") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Role</td>
                                                <td>
                                                    <asp:RadioButtonList ID="rb_role" runat="server" RepeatDirection="Horizontal" SelectedValue='<%# Bind("Role") %>'>
                                                        <asp:ListItem Value="1">Standard</asp:ListItem>
                                                        <asp:ListItem Value="2">Admin</asp:ListItem>
                                                        <asp:ListItem Value="3">Gruppe</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                        </table>
                                        <br />
                                        <br />
                                        &nbsp;<br />
                                        <br />
                                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Aktualisieren" />
                                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Abbrechen" />
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <table class="nav-justified">
                                            <tr>
                                                <td>Name</td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="nameTextBox" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                                                    <asp:TextBox ID="nameTextBox" runat="server" Text='<%# Bind("name") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Vorname</td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="vnameTextBox" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                                                    <asp:TextBox ID="vnameTextBox" runat="server" Text='<%# Bind("vname") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Gebdat</td>
                                                <td>
                                                    <asp:TextBox ID="gebdatTextBox" runat="server" Text='<%# Bind("gebdat") %>' />
                                                    <ajaxToolkit:CalendarExtender ID="gebdatTextBox_CalendarExtender" runat="server" Format="yyyy-MM-dd" TargetControlID="gebdatTextBox">
                                                    </ajaxToolkit:CalendarExtender>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Abteilung</td>
                                                <td>
                                                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource4" DataTextField="Abteilung" DataValueField="Abteilungsnummer" SelectedValue='<%# Bind("department") %>'>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Status</td>
                                                <td>
                                                    <asp:DropDownList ID="DropDownList3" runat="server" SelectedValue='<%# Bind("status") %>'>
                                                        <asp:ListItem Value="1">aktiv</asp:ListItem>
                                                        <asp:ListItem Value="0">ehemaliger</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Rolle</td>
                                                <td>
                                                    <asp:RadioButtonList ID="rb_role" runat="server" RepeatDirection="Horizontal" SelectedValue='<%# Bind("role") %>'>
                                                        <asp:ListItem Selected="True" Value="1">Standard</asp:ListItem>
                                                        <asp:ListItem Value="2">Admin</asp:ListItem>
                                                        <asp:ListItem Value="3">Gruppe</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                        </table>
                                        <br />
                                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Einfügen" />
                                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Abbrechen" />
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        id:
                            <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                                        &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:Button ID="Button3" runat="server" Height="19px" OnClick="Button3_Click" Text="PW" />
                                        <table class="nav-justified">
                                          <thead>
                                                <asp:Label ID="unameTextBox" runat="server"  BackColor="LightGray"  Text='<%# Eval("uname")%>' CssClass="alignright" />
                                            </thead>
                                            <tr> <td style="width: 110px">&nbsp;</td>
                                                <td style="width: 114px; margin-left: 40px">
                                                    <asp:TextBox ID="tb_uname" runat="server" Text='<%# Bind("uname") %>' Visible="False"></asp:TextBox>
                                                </td>
                                            </tr>
                                              <tr>
                                                  <td colspan="2">Name</td>
                                                  <td>
                                                      <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name")%>' />
                                                  </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">Vorname</td>
                                                <td>
                                                    <asp:Label ID="vnameLabel" runat="server" Text='<%# Eval("vname")%>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">Gebdat</td>
                                                <td>
                                                    <asp:Label ID="gebdatLabel" runat="server"  Text='<%# Eval("gebdat")%>'   ReadOnly="true"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">Abteilung</td>
                                                <td>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Abteilung")%>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">Username</td>
                                                <td>
                                                    <asp:Label ID="unameLabel" runat="server" Text='<%# Eval("uname")%>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">Status</td>
                                                <td>
                                                    <asp:CheckBox ID="CheckBox1" runat="server" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">Rolle</td>
                                                <td>
                                                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" SelectedValue='<%# Bind("role") %>'>
                                                        <asp:ListItem Selected="True" Value="1">standard</asp:ListItem>
                                                        <asp:ListItem Value="2">admin</asp:ListItem>
                                                        <asp:ListItem Value="3">gruppe</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                        </table>
                                        <br />
                                        <br />
                                        &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Löschen" />
                                        &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Neu" />
                                        &nbsp;<asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />

                                    </ItemTemplate>
                                </asp:FormView>
                            </td>
                            </td>
                        </td>
                        <td style="vertical-align: top; width: 162px; height: 378px;">
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:toolboxConnectionString %>" DeleteCommand="DELETE FROM [Personal] WHERE [id] = @original_id "
                                InsertCommand="AddPerson" OldValuesParameterFormatString="original_{0}"
                                SelectCommand="SELECT Personal.id, Personal.name, Personal.vname, Personal.gebdat, Personal.uname, Personal.department, Personal.role, Personal.status, Abteilungen.Abteilung FROM Personal INNER JOIN Abteilungen ON Personal.department = Abteilungen.id WHERE (Personal.id = @id)"
                                UpdateCommand="UPDATE Personal SET name =@name, vname= @vname, gebdat= @gebdat, department =@department, role =@role, status =@status WHERE (id=@original_id)" InsertCommandType="StoredProcedure">
                                <DeleteParameters>
                                    <asp:Parameter Name="original_id" Type="Int32" />
                                </DeleteParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="name" Type="String" />
                                    <asp:Parameter Name="vname" Type="String" />
                                    <asp:Parameter Name="gebdat" DbType="Date" />
                                    <asp:Parameter Name="department" Type="Int32" />
                                    <asp:Parameter Name="role" Type="Int32" />
                                    <asp:Parameter Name="status" Type="Int32" DefaultValue="1" />
                                    <asp:Parameter Name="original_id" Type="Int32" />

                                </UpdateParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="name" Type="String" />
                                    <asp:Parameter Name="vname" Type="String" />
                                    <asp:Parameter DbType="Date" Name="gebdat" />
                                    <asp:Parameter Name="uname" Type="String" />
                                    <asp:Parameter Name="status" Type="Int32" />
                                    <asp:Parameter Name="role" Type="Int32" />
                                    <asp:Parameter Name="department" Type="Int32" />
                                    <asp:Parameter Direction="InputOutput" Name="id" Type="Int32" />
                                    <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="GridView1" Name="id" PropertyName="SelectedValue" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                        <td style="vertical-align: top; height: 378px;"></td>
                    </tr>
                    <tr>
                        <td style="width: 391px; vertical-align: top; height: 378px;">&nbsp;</td>
                        <td style="vertical-align: top; width: 162px; height: 378px;">&nbsp;</td>
                        <td style="vertical-align: top; height: 378px;">&nbsp;</td>
                    </tr>
                </table>
        </ContentTemplate>
    </asp:UpdatePanel>

    <p>&nbsp;</p>
    <asp:Button ID="Button2" runat="server" Visible="True" />
    <ajaxToolkit:ModalPopupExtender ID="MPU1" runat="server" TargetControlID="Button2"
        PopupControlID="PanelPopupCreate" BackgroundCssClass="modalBackground" />
    <asp:Panel ID="PanelPopupCreate" runat="server" CssClass="modalPopup" Style="display: # none" Width="500px">
        <asp:UpdatePanel ID="UpdatePanelCreate" class="PersoDataPopup" runat="server" UpdateMode="Conditional">
            <ContentTemplate>

                <h2>Urlaubstage</h2>
                <div>
                    Personal ID:<br />
                    <asp:TextBox ID="TB_MPU_ID" runat="server" Width="35" ReadOnly="true"></asp:TextBox>
                </div>

                <div>
                    Gesamttage im Jahr:<br />
                    <asp:TextBox ID="TB_Gesamt" runat="server" Width="35"></asp:TextBox>
                </div>

                <div>
                    Resturlaub vom vorigen Jahr:
                    <br />
                    <asp:TextBox ID="TB_Resturlaub" runat="server" Width="35"></asp:TextBox>
                    <asp:RegularExpressionValidator runat="server" RegularExpressionValidator="^[0-9]*$" Width="35" ControlToValidate="TB_Resturlaub"></asp:RegularExpressionValidator>
                </div>

                <div>
                    bereits genommene Urlaubstage
                    <br />
                    <asp:TextBox ID="TB_genommen" runat="server" Width="35" ReadOnly="true"></asp:TextBox>
                </div>
                <asp:GridView ID="history" runat="server" DataSourceID="SqlDataSource5" Visible="false"></asp:GridView>
                <asp:Button ID="showyears" runat="server" Text="Historie" onClick="showyears_Click"/>
                <asp:Button ID="ButtonCreateSave" runat="server" Text="Save" OnClick="ButtonCreateSave_Click" />
                <asp:LinkButton ID="ButtonCreateCancel" runat="server" Text="Cancel" OnClick="ButtonCreateCancel_Click" />

            </ContentTemplate>
          </asp:UpdatePanel>
    </asp:Panel>
    <p> <asp:SqlDataSource runat="server" ID="SQLDataSource5"  ConnectionString="<%$ ConnectionStrings:toolboxConnectionString %>" SelectCommand="SELECT [udaysinyear], [utaken], [uleftover], [year] FROM [Stats] WHERE ([pid] = @pid) ORDER BY [year]">
        <SelectParameters>
            <asp:SessionParameter Name="pid" SessionField="pid" Type="Int32" />
        </SelectParameters>
        </asp:SqlDataSource>
        &nbsp;
    </p>
    <p>&nbsp;</p>

</asp:Content>
