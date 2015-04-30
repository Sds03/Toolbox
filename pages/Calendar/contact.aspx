<%@ Page Language="vb" AutoEventWireup="true" CodeFile="contact.aspx.vb" Inherits="_Default" MasterPageFile="~/Site.master" Title="ial" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<%@ Register Assembly="DayPilot" Namespace="DayPilot.Web.Ui" TagPrefix="DayPilot" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <script src="Scripts/daypilot-modal-2.1.js"></script>
    <link href='css/main.css' type="text/css" rel="stylesheet" />
    <link href='Themes/scheduler_white.css' type="text/css" rel="stylesheet" />
    <script type="text/javascript">


        function timeRangeSelected(start, end, resource) {
            var modal = new DayPilot.Modal();

            modal.top = 60;
            modal.width = 300;
            modal.opacity = 70;
            modal.border = "10px solid #d0d0d0";
            modal.showUrl("New.aspx?start=" + start.toStringSortable() + "&end=" + end.toStringSortable() + "&r=" + resource);
            modal.closed = function () {
                if (this.result == "OK") {
                    //DayPilotScheduler.commandCallBack('refresh');
                    document.location.reload();
                    //DayPilotScheduler.clearSelection();
                }

            }
        }
            function createEvent(start, end, resource) {
                modal.height = 250;

                modal.showUrl("New.aspx?start=" + start.toStringSortable() + "&end=" + end.toStringSortable() + "&r=" + resource);
                location.reload()
            }

            function editEvent(id) {
                modal.height = 300;
                modal.showUrl("Edit.aspx?id=" + id);
            }

            function afterRender(data) {
            };

            function filter(property, value) {
                if (!dps.clientState.filter) {
                    dps.clientState.filter = {};
                }
                if (dps.clientState.filter[property] != value) { // only refresh when the value has changed
                    dps.clientState.filter[property] = value;
                    dps.commandCallBack('filter');
                }
            }
        
            function getVacationDays(pid) {
                var modal = new DayPilot.Modal();

                modal.top = 60;
                modal.width = 300;
                modal.opacity = 70;
                modal.border = "10px solid #d0d0d0";
                modal.showUrl("days.aspx?pid=" & pid);
                modal.closed = function () {
                    if (this.result == "OK") {
                        document.location.reload();
                    }
                }

            }
    </script>
    <style type="text/css">
        .scheduler_white_rowheader {
            background: -webkit-gradient(linear, left top, left bottom, from(#eeeeee), to(#dddddd));
            background: -moz-linear-gradient(top, #eeeeee 0%, #dddddd);
            background: -ms-linear-gradient(top, #eeeeee 0%, #dddddd);
            background: -webkit-linear-gradient(top, #eeeeee 0%, #dddddd);
            background: linear-gradient(top, #eeeeee 0%, #dddddd);
            filter: progid:DXImageTransform.Microsoft.gradient(startColorStr="#eeeeee", endColorStr="#dddddd");
        }

        .scheduler_white_rowheader_inner {
            border-right: 1px solid #ccc;
        }

        .scheduler_white_rowheadercol2 {
            background: White;
        }

            .scheduler_white_rowheadercol2 .scheduler_white_rowheader_inner {
                top: 2px;
                bottom: 2px;
                left: 2px;
                background-color: transparent;
                border-left: 5px solid #1a9d13;
                // green border-right: 0px none;
            }

        .status_dirty.scheduler_white_rowheadercol2 .scheduler_white_rowheader_inner {
            border-left: 5px solid #ea3624;
            // red;
        }

        .status_cleanup.scheduler_white_rowheadercol2 .scheduler_white_rowheader_inner {
            border-left: 5px solid #f9ba25;
            // orange;
        }
    </style>
</asp:Content>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
<asp:UpdatePanel runat="server" UpdateMode="Conditional">   
        <ContentTemplate>
            <div style="float: left; width=200px">
                <DayPilot:DayPilotNavigator runat="server"
                    ShowMonths="3"
                    BoundDayPilotID="DayPilotScheduler1"></DayPilot:DayPilotNavigator>
            </div>
            <div style="margin-left: 208px">
                <DayPilot:DayPilotScheduler
                    runat="server"
                    Scale="Day"
                    DataEndField="eventend"
                    DataStartField="eventstart"
                    DataTextField="eventname"
                    DataIdField="id"
                    DataResourceField="resource_id"
                    ID="DayPilotScheduler1"
                    AllowMultiSelect="true"
                    OnCommand="DayPilotScheduler1_Command"
                    ContextMenuID="DayPilotMenu1"
                    TimeRangeSelectedHandling="JavaScript"
                    TimeRangeSelectedJavaScript="timeRangeSelected(start,end,resource)"
                    OnTimeRangeSelected="DayPilotScheduler1_TimeRangeSelected"
                    OnEventClick="DayPilotScheduler1_EventClick" Days="30" EventEndSpec="Date" AutoRefreshEnabled="False" TimeRangeSelectingStartEndFormat="yyyy-MM-dd"
                    EventClickHandling="Postback">
                     <HeaderColumns>
                        <DayPilot:RowHeaderColumn Title="Mitarbeiter" Width="140" />
                        <DayPilot:RowHeaderColumn Title="Urlaub" Width="35" />
                        <DayPilot:RowHeaderColumn Title="genommen" Width="35" />
                      </HeaderColumns>
                    <TimeHeaders>
                        <DayPilot:TimeHeader GroupBy="Month" Format="MMMM yyyy" />

                        <DayPilot:TimeHeader GroupBy="Cell" />
                    </TimeHeaders>
                </DayPilot:DayPilotScheduler>
                <asp:Label ID="lbl_ErrorMsg" runat="server" BackColor="#FFCC99" Text="Hier die FM" Visible="False" Width="400px"></asp:Label>
                <asp:Button ID="Btn_ErrMsg" runat="server" Text="OK" Visible="false" />
            </div>
            <DayPilot:DayPilotMenu ID="DayPilotMenu1" runat="server" CssClassPrefix="menu_default">
                <DayPilot:MenuItem Text="Edit" Action="Postback" Command="Edit" />
                <DayPilot:MenuItem Text="Delete" Action="Postback" Command="Delete" />
                <DayPilot:MenuItem Text="Genehmigen" Action="PostBack" Command="Genehmigen" />
            </DayPilot:DayPilotMenu>
        </ContentTemplate>
 </asp:UpdatePanel>
    <asp:Button ID="ButtonDummyEdit" runat="server" Style="display: none" />
    <ajaxToolkit:ModalPopupExtender ID="ModalPopupEdit" runat="server" TargetControlID="ButtonDummyEdit"
        PopupControlID="PanelPopupEdit" BackgroundCssClass="modalPopup" />
    <asp:Panel ID="PanelPopupEdit" runat="server" CssClass="PersoDataPopup" Style="display: none" Width="500px">
        <asp:UpdatePanel ID="UpdatePanelEdit" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <h2>Edit Reservation</h2>

                <div>
                    <asp:TextBox ID="TextBoxEditName" runat="server"></asp:TextBox>
                </div>

                <div>
                    Resource:
                    <br />
                    <asp:DropDownList ID="DropDownEditResource" runat="server"></asp:DropDownList>
                </div>

                <div>
                    Start:<br />
                    <asp:TextBox ID="TextBoxEditStart" runat="server"></asp:TextBox>
                </div>

                <div>
                    End:<br />
                    <asp:TextBox ID="TextBoxEditEnd" runat="server"></asp:TextBox>
                </div>

                <asp:HiddenField ID="HiddenEditId" runat="server" />

                <asp:Button ID="ButtonEditSave" runat="server" Text="Save" OnClick="ButtonEditSave_Click" />
                <asp:LinkButton ID="ButtonEditCancel" runat="server" Text="Cancel" OnClick="ButtonEditCancel_Click" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>


</asp:Content>
