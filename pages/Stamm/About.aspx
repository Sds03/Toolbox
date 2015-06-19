<%@ Page Title="About" Language="VB" MasterPageFile="~/pages/Stamm/Stamm.Master" AutoEventWireup="true" CodeFile="About.aspx.vb" Inherits="About" %>

<%@ Register Assembly="DayPilot" Namespace="DayPilot.Web.Ui" TagPrefix="DayPilot" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href='css/main.css' type="text/css" rel="stylesheet" />
    <script src="../../Scripts/daypilot-modal-2.1.js"></script>
    <script type="text/javascript">


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
    </script>

    <script type="text/javascript">

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
    </script>

    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:toolboxConnectionString %>" DeleteCommand="DELETE FROM [Stats] WHERE [id] = @original_id AND [pid] = @original_pid AND (([udaysinyear] = @original_udaysinyear) OR ([udaysinyear] IS NULL AND @original_udaysinyear IS NULL)) AND (([utaken] = @original_utaken) OR ([utaken] IS NULL AND @original_utaken IS NULL)) AND (([uleftover] = @original_uleftover) OR ([uleftover] IS NULL AND @original_uleftover IS NULL)) AND (([year] = @original_year) OR ([year] IS NULL AND @original_year IS NULL))" InsertCommand="INSERT INTO [Stats] ( [pid], [udaysinyear], [utaken], [uleftover], [year]) VALUES ( @pid, @udaysinyear, @utaken, @uleftover, @year)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Stats]" UpdateCommand="UPDATE [Stats] SET [pid] = @pid, [udaysinyear] = @udaysinyear, [utaken] = @utaken, [uleftover] = @uleftover, [year] = @year WHERE [id] = @original_id AND [pid] = @original_pid AND (([udaysinyear] = @original_udaysinyear) OR ([udaysinyear] IS NULL AND @original_udaysinyear IS NULL)) AND (([utaken] = @original_utaken) OR ([utaken] IS NULL AND @original_utaken IS NULL)) AND (([uleftover] = @original_uleftover) OR ([uleftover] IS NULL AND @original_uleftover IS NULL)) AND (([year] = @original_year) OR ([year] IS NULL AND @original_year IS NULL))">
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


    <h2>Stammdaten Personal
                                          <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                              <ContentTemplate>
                                                  <table class="nav-justified" style="background-color: #ffffff; background-image: inherit;">
                                                      <tr>
                                                          <td style="width: 433px">
                                                              <asp:Button ID="Button1" runat="server" BorderStyle="Outset" Text="Neu" Height="30px" Width="57px" Font-Size="Small" />

                                                              &nbsp;<asp:DropDownList ID="DropDownList4" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource4" DataTextField="Abteilung" DataValueField="Abteilungsnummer" Font-Size="Medium">
                                                              </asp:DropDownList>
                                                              <asp:CheckBox ID="InaktivMA" runat="server" Font-Size="Small" Text="Inaktive" AutoPostBack="true" />
                                                          </td>
                                                      </tr>
                                                      <tr>
                                                          <td style="width: 433px; vertical-align: top; height: 50px;">
                                                              <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="1" DataKeyNames="id" DataSourceID="SqlDataSource1" Font-Size="Medium" ForeColor="#333333" GridLines="None" Height="205px">
                                                                  <AlternatingRowStyle BackColor="White" />
                                                                  <Columns>
                                                                      <asp:CommandField ShowDeleteButton="False" ShowSelectButton="True" />
                                                                      <asp:BoundField DataField="id" HeaderText="Persoid" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                                                                      <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
                                                                      <asp:BoundField DataField="vname" HeaderText="Vorname" SortExpression="vname" />
                                                                      <asp:ButtonField ButtonType="Image" CommandName="Go" ImageUrl="~/content/clock.jpg" Text="Go" />
                                                                  </Columns>
                                                                  <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                  <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                                                  <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                                                  <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                                                  <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                                              </asp:GridView>
                                                          </td>
                                                          <td style="width: 471px; vertical-align: top; height: 50px;">
                                                              <h5 style="margin: 2px"><strong>Mitarbeiterdaten</strong></h5>
                                                              
                                                                  <asp:FormView ID="FormView1" runat="server" BorderStyle="Solid" CssClass="PersoDataPopup" DataKeyNames="id" DataSourceID="SqlDataSource2" Font-Size="Medium" Height="177px" Width="271px">
                                                                      <EditItemTemplate>
                                                                          id:
                                                                          <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
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
                                                                                      <asp:TextBox ID="gebdatTextBox2" runat="server" Text='<%# Bind("gebdat") %>' />
                                                                                      <ajaxToolkit:CalendarExtender ID="gebdatTextBox_CalendarExtender" runat="server" Format="yyyy-MM-dd" TargetControlID="gebdatTextBox2">
                                                                                      </ajaxToolkit:CalendarExtender>
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
                                                                                  <td>Inaktiv</td>
                                                                                  <td>
                                                                                      <asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Bind("status") %>' />
                                                                                  </td>
                                                                              </tr>
                                                                              <tr>
                                                                                  <td>Azubi</td>
                                                                                  <td>
                                                                                      <asp:CheckBox ID="CheckBox4" runat="server" Checked='<%# Bind("azubi") %>' />
                                                                                  </td>
                                                                              </tr>
                                                                              <tr>
                                                                                  <td>Role</td>
                                                                                  <td>
                                                                                      <asp:RadioButtonList ID="RadioButtonList2" runat="server" RepeatDirection="Horizontal" SelectedValue='<%# Bind("role")%>'>
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
                                                                                          <asp:ListItem Value="0">aktiv</asp:ListItem>
                                                                                          <asp:ListItem Value="1">ehemaliger</asp:ListItem>
                                                                                      </asp:DropDownList>
                                                                                  </td>
                                                                              </tr>
                                                                              <tr>
                                                                                  <td>Azubi</td>
                                                                                  <td>
                                                                                      <asp:CheckBox ID="CheckBox5" runat="server" Checked='<%# Bind("status")%>' />
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
                                                                          <table class="nav-justified">
                                                                              <thead>
                                                                                  <asp:Label ID="unameTextBox" runat="server" BackColor="LightGray" CssClass="alignright" Text='<%# Eval("uname")%>' />
                                                                              </thead>
                                                                              <tr>
                                                                                  <td class="label-default">id: </td>
                                                                                  <td class="label-default">
                                                                                      <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                                                                                  </td>
                                                                              </tr>
                                                                              <tr>
                                                                                  <td>&nbsp;</td>
                                                                                  <td colspan="2">&nbsp;</td>
                                                                              </tr>
                                                                              <tr>
                                                                                  <td>Name</td>
                                                                                  <td>
                                                                                      <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name")%>' />
                                                                                  </td>
                                                                                  <td>
                                                                                      <asp:Button ID="Button3" runat="server" Height="24px" OnClick="Button3_Click" Text="PW Reset" />
                                                                                  </td>
                                                                              </tr>
                                                                              <tr>
                                                                                  <td>Vorname</td>
                                                                                  <td colspan="2">
                                                                                      <asp:Label ID="vnameLabel" runat="server" Text='<%# Eval("vname")%>' />
                                                                                  </td>
                                                                              </tr>
                                                                              <tr>
                                                                                  <td>Gebdat</td>
                                                                                  <td colspan="2">
                                                                                      <asp:Label ID="gebdatLabel" runat="server" ReadOnly="true" Text='<%# Eval("gebdat")%>' />
                                                                                  </td>
                                                                              </tr>
                                                                              <tr>
                                                                                  <td>Abteilung</td>
                                                                                  <td colspan="2">
                                                                                      <asp:Label ID="Label1" runat="server" Text='<%# Bind("Abteilung")%>'></asp:Label>
                                                                                  </td>
                                                                              </tr>
                                                                              <tr>
                                                                                  <td>Username</td>
                                                                                  <td colspan="2">
                                                                                      <asp:Label ID="unameLabel" runat="server" Text='<%# Eval("uname")%>' />
                                                                                  </td>
                                                                              </tr>
                                                                              <tr>
                                                                                  <td>Inaktiv</td>
                                                                                  <td colspan="2">
                                                                                      <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Eval("status")%>' Enabled="false" />
                                                                                  </td>
                                                                              </tr>
                                                                              <tr>
                                                                                  <td>Azubi</td>
                                                                                  <td colspan="2">
                                                                                      <asp:CheckBox ID="CheckBox3" runat="server" Checked='<%# Eval("azubi")%>' Enabled="false" />
                                                                                  </td>
                                                                              </tr>
                                                                              <tr>
                                                                                  <td>Rolle</td>
                                                                                  <td colspan="2">
                                                                                      <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" SelectedValue='<%# Eval("role") %>'>
                                                                                          <asp:ListItem Selected="True" Value="1">standard</asp:ListItem>
                                                                                          <asp:ListItem Value="2">admin</asp:ListItem>
                                                                                          <asp:ListItem Value="3">gruppe</asp:ListItem>
                                                                                      </asp:RadioButtonList>
                                                                                  </td>
                                                                              </tr>
                                                                          </table>
                                                                          <br />
                                                                          <br />
                                                                          &nbsp;<asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                                                                      </ItemTemplate>
                                                                  </asp:FormView>
                                                              
                                                          </td>
                                                          <td style="width: 391px; vertical-align: top; height: 50px;"></td>
                                                          <td style="vertical-align: top; width: 162px; height: 50px;">
                                                              <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:toolboxConnectionString %>" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT Personal.id, Personal.name, Personal.vname, Personal.gebdat, Personal.uname, Personal.department, Personal.role, Personal.status, Personal.azubi, Abteilungen.Abteilung FROM Personal INNER JOIN Abteilungen ON Personal.department = Abteilungen.id WHERE (Personal.department=@department) AND (Personal.status = @aktiv)">
                                                                  <SelectParameters>
                                                                      <asp:ControlParameter ControlID="DropDownList4" Name="department" PropertyName="SelectedValue" />
                                                                      <asp:ControlParameter ControlID="InaktivMA" Name="aktiv" PropertyName="Checked" />
                                                                  </SelectParameters>
                                                              </asp:SqlDataSource>
                                                          </td>
                                                          <td style="vertical-align: top; height: 50px;">
                                                              <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:toolboxConnectionString %>"
                                                                  SelectCommand="SELECT * FROM [Abteilungen]"></asp:SqlDataSource>
                                                          </td>
                                                      </tr>

                                                      <tr>

                                                          <td style="width: 433px; vertical-align: top; height: 378px;">

                                                              &nbsp;<td style="width: 471px; vertical-align: top; height: 378px;">
                                                                  &nbsp;<td style="width: 391px; vertical-align: top; height: 378px;">
                                                                      &nbsp;</td>
                                                              </td>
                                                          </td>
                                                          <td style="vertical-align: top; width: 162px; height: 378px;">
                                                              <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:toolboxConnectionString %>" DeleteCommand="DELETE FROM [Personal] WHERE [id] = @original_id AND (([name] = @original_name) OR ([name] IS NULL AND @original_name IS NULL)) AND (([vname] = @original_vname) OR ([vname] IS NULL AND @original_vname IS NULL)) AND (([gebdat] = @original_gebdat) OR ([gebdat] IS NULL AND @original_gebdat IS NULL)) AND (([uname] = @original_uname) OR ([uname] IS NULL AND @original_uname IS NULL)) AND (([department] = @original_department) OR ([department] IS NULL AND @original_department IS NULL)) AND (([role] = @original_role) OR ([role] IS NULL AND @original_role IS NULL)) AND (([status] = @original_status) OR ([status] IS NULL AND @original_status IS NULL)) AND (([azubi] = @original_azubi) OR ([azubi] IS NULL AND @original_azubi IS NULL))"
                                                                  InsertCommand="AddPerson" OldValuesParameterFormatString="original_{0}"
                                                                  SelectCommand="SELECT Personal.id, Personal.name, Personal.vname, Personal.gebdat, Personal.uname, Personal.department, Personal.role, Personal.status, Personal.azubi, Abteilungen.Abteilung FROM Personal INNER JOIN Abteilungen ON Personal.department = Abteilungen.id WHERE (Personal.id = @id)"
                                                                  UpdateCommand="UPDATE [Personal] SET [name] = @name, [vname] = @vname, [gebdat] = @gebdat, [uname] = @uname, [department] = @department, [role] = @role, [status] = @status, [azubi] = @azubi WHERE [id] = @original_id" ConflictDetection="CompareAllValues" InsertCommandType="StoredProcedure">
                                                                  <DeleteParameters>
                                                                      <asp:Parameter Name="original_id" Type="Int32" />
                                                                      <asp:Parameter Name="original_name" Type="String" />
                                                                      <asp:Parameter Name="original_vname" Type="String" />
                                                                      <asp:Parameter DbType="Date" Name="original_gebdat" />
                                                                      <asp:Parameter Name="original_uname" Type="String" />
                                                                      <asp:Parameter Name="original_department" Type="Int32" />
                                                                      <asp:Parameter Name="original_role" Type="Int32" />
                                                                      <asp:Parameter Name="original_status" Type="Int32" />
                                                                      <asp:Parameter Name="original_azubi" Type="Boolean" />
                                                                  </DeleteParameters>
                                                                  <UpdateParameters>
                                                                      <asp:Parameter Name="name" Type="String" />
                                                                      <asp:Parameter Name="vname" Type="String" />
                                                                      <asp:Parameter Name="gebdat" DbType="Date" />
                                                                      <asp:Parameter Name="uname" Type="String" />
                                                                      <asp:Parameter Name="department" Type="Int32" />
                                                                      <asp:Parameter Name="role" Type="Int32" />
                                                                      <asp:Parameter Name="status" Type="Int32" />

                                                                      <asp:Parameter Name="azubi" Type="Boolean" />
                                                                      <asp:Parameter Name="original_id" Type="Int32" />

                                                                  </UpdateParameters>
                                                                  <InsertParameters>
                                                                      <asp:Parameter Name="vname" Type="String" />
                                                                      <asp:Parameter Name="name" Type="String" />
                                                                      <asp:Parameter DbType="Date" Name="gebdat" />
                                                                      <asp:Parameter Name="uname" Type="String" />
                                                                      <asp:Parameter Name="role" Type="Int32" />
                                                                      <asp:Parameter Name="department" Type="Int32" />
                                                                      <asp:Parameter Name="status" Type="Int32" />
                                                                      <asp:Parameter Name="azubi" Type="Boolean"  DefaultValue="False"/>
                                                                      <asp:Parameter Name="id" Type="Int32" Direction="InputOutput" />
                                                                  </InsertParameters>
                                                                  <SelectParameters>
                                                                      <asp:ControlParameter ControlID="GridView1" Name="id" PropertyName="SelectedValue" Type="Int32" />
                                                                  </SelectParameters>
                                                              </asp:SqlDataSource>
                                                          </td>
                                                          <td style="vertical-align: top; height: 378px;"></td>
                                                      </tr>

                                                      <tr>
                                                          <td style="width: 433px; vertical-align: top; height: 378px;">&nbsp;</td>
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
        <asp:Panel ID="PanelPopupCreate" runat="server" CssClass="" Style="display: none" Width="350px">
            <asp:UpdatePanel ID="UpdatePanelCreate" class="PersoDataPopup" runat="server" UpdateMode="Conditional">
                <ContentTemplate>

                    <h2>Urlaubstage</h2>
                   <div>
                       Personal ID:
                       <asp:TextBox ID="TB_MPU_ID" runat="server" ReadOnly="true" Width="58"></asp:TextBox>
                   </div>
                    <div>
                        Gesamttage: <br />
                        <asp:TextBox ID="TB_Gesamt" runat="server" Width="35"></asp:TextBox>
                    </div>

                    <div >
                        Resturlaub :
                    <br />
                        <asp:TextBox ID="TB_Resturlaub" runat="server" Width="35"></asp:TextBox>
                        <asp:RegularExpressionValidator runat="server" RegularExpressionValidator="^[0-9]*$" Width="35" ControlToValidate="TB_Resturlaub"></asp:RegularExpressionValidator>
                    </div>

                    <div >
                      genommene
                    
                        <asp:TextBox ID="TB_genommen" runat="server" Width="35" ReadOnly="true"></asp:TextBox>
                    </div>
                    <asp:GridView ID="history" runat="server" DataSourceID="SqlDataSource5" Visible="false"></asp:GridView>
                    <asp:Button ID="showyears" runat="server" Text="Historie" OnClick="showyears_Click" />
                    <asp:Button ID="ButtonCreateSave" runat="server" Text="Save" OnClick="ButtonCreateSave_Click" />
                    <asp:LinkButton ID="ButtonCreateCancel" runat="server" Text="Cancel" OnClick="ButtonCreateCancel_Click" />

                </ContentTemplate>
            </asp:UpdatePanel>
        </asp:Panel>
        <p>
            <asp:SqlDataSource runat="server" ID="SQLDataSource5" ConnectionString="<%$ ConnectionStrings:toolboxConnectionString %>" SelectCommand="SELECT [udaysinyear], [utaken], [uleftover], [year] FROM [Stats] WHERE ([pid] = @pid) ORDER BY [year]">
                <SelectParameters>
                    <asp:SessionParameter Name="pid" SessionField="pid" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            &nbsp;
        </p>
        <p>&nbsp;</p>
</asp:Content>
