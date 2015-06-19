' Copyright � 2005 - 2014 Annpoint, s.r.o.
'   Use of this software is subject to license terms. 
'   http://www.daypilot.org/
'
'   If you have purchased a DayPilot Pro license, you are allowed to use this 
'   code under the conditions of DayPilot Pro License Agreement:
'
'   http://www.daypilot.org/files/LicenseAgreement.pdf
'
'   Otherwise, you are allowed to use it for evaluation purposes only under 
'   the conditions of DayPilot Pro Trial License Agreement:
'   
'   http://www.daypilot.org/files/LicenseAgreementTrial.pdf
'   
'
Imports Class1
Imports System
Imports System.Configuration
Imports System.Data
Imports System.Data.SqlClient
Imports System.Drawing
Imports DayPilot.Web.Ui
Imports DayPilot.Web.Ui.Data
Imports DayPilot.Web.Ui.Enums
Imports DayPilot.Web.Ui.Events.Scheduler
Imports DayPilot.Web.Ui.Events
Imports System.Web.HttpContext



Partial Public Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
        Dim msg As New Class1

        'show page only if authenticated
        If User.Identity.IsAuthenticated Then
        Else
            msg.ShowMessage("Um den Persönlichen Kalendar zu verwenden, müssen Sie sich zuerst anmelden!", Me.Page)
            Response.Redirect("~/default.aspx")
        End If

        ' prevent invalid ViewState errors in Firefox
        If Request.Browser.Browser = "Firefox" Then
            Response.Cache.SetNoStore()
        End If

        DayPilotScheduler1.Separators.Clear()
        DayPilotScheduler1.Separators.Add(Date.Today, Color.Red)
        'lbl_ErrorMsg.Text = ""
        'lbl_ErrorMsg.Visible = True
        'Btn_ErrMsg.Visible = False

        If Not IsPostBack Then

            DayPilotScheduler1.StartDate = New Date(Date.Today.Year, 1, 1)
            LoadResourcesAndEvents()

            ' scroll to this month
            Dim firstOfMonth As New Date(Date.Today.Year, Date.Today.Month, 1)
            DayPilotScheduler1.SetScrollX(firstOfMonth)
        End If
    End Sub

    Private Function dbGetEvents(ByVal start As Date, ByVal days As Integer) As DataTable
        Dim da As New SqlDataAdapter("SELECT * FROM [Events] ", ConfigurationManager.ConnectionStrings("toolboxConnectionString").ConnectionString)
        da.SelectCommand.Parameters.AddWithValue("eventstart", start)
        da.SelectCommand.Parameters.AddWithValue("eventend", start.AddDays(days))
        Dim dt As New DataTable()
        da.Fill(dt)
        Return dt
    End Function

    Private Sub LoadResources()
        Dim appUser = New ApplicationUser()
        Dim currentUserName As String = Current.User.Identity.Name
        Dim id As Int32
        Dim dt, dtstats As New DataTable()
        Dim da As New SqlDataAdapter("SELECT name, uname, role, department, personal.id, stats.udaysinyear, stats.utaken  FROM [personal] JOIN Stats ON personal.id=stats.pid WHERE uname=@uname", ConfigurationManager.ConnectionStrings("toolboxConnectionString").ConnectionString)
        Dim dastats As New SqlDataAdapter("SELECT * FROM [Stats]", ConfigurationManager.ConnectionStrings("toolboxConnectionString").ConnectionString)
        Dim mode, Abteilung As Integer


        'get Userrights whether admin or group
        If currentUserName Is Nothing Or currentUserName = "" Then

             Else
            da.SelectCommand.Parameters.AddWithValue("uname", currentUserName)
            da.Fill(dt)
            For Each r As DataRow In dt.Rows
                mode = DirectCast(r("role"), Integer)
                Abteilung = DirectCast(r("department"), Integer)
            Next r
            DayPilotScheduler1.Resources.Clear()

            'now get the corresponding user(s) single or group
            Select Case mode
                Case 1 : da.Fill(dtstats)
                Case 2 : da.SelectCommand.CommandText = "SELECT name, personal.id, stats.udaysinyear, stats.utaken  FROM [personal] JOIN Stats ON personal.id=stats.pid"
                    da.Fill(dtstats)
                Case 3 : da.SelectCommand.CommandText = "SELECT name, personal.id, stats.udaysinyear, stats.utaken FROM [personal] JOIN Stats ON personal.id=stats.pid WHERE department=@Abteilung"
                    da.SelectCommand.Parameters.AddWithValue("Abteilung", Abteilung)
                    da.Fill(dtstats)
            End Select

            For Each r1 As DataRow In dtstats.Rows
                Dim name As String = DirectCast(r1("Name"), String)
                id = DirectCast(r1("id"), Integer)
                Dim urlaub As Integer
                Dim utaken As Integer
                If Not IsDBNull(r1("utaken")) Then
                    utaken = DirectCast(r1("utaken"), Integer)
                Else
                    utaken = 0
                End If

                If Not IsDBNull(r1("udaysinyear")) Then
                    urlaub = DirectCast(r1("udaysinyear"), Integer)
                Else
                    urlaub = 0
                End If

                Dim res As New Resource(name, id)

                DayPilotScheduler1.Resources.Add(res)
                res.DataItem = r1
                res.Columns.Add(New ResourceColumn(urlaub))
                res.Columns.Add(New ResourceColumn(utaken))
                'Now add the vacation days as a resource
                ' dastats.SelectCommand.CommandText = "SELECT * FROM [Stats] WHERE pid=" & id
                ' dastats.Fill(dtstats)
                ' For Each rstats As DataRow In dtstats.Rows
                'Dim vacdays As Integer = DirectCast(rstats("udaysinyear"), Integer)
                'Dim resstats As New Resource(vacdays, id)
                'DayPilotScheduler1.Resources.Add(resstats)
                'Next rstats
            Next r1

        End If

    End Sub

    Protected Sub DayPilotScheduler1_Command(ByVal sender As Object, ByVal e As DayPilot.Web.Ui.Events.CommandEventArgs)
        Select Case e.Command
            Case "refresh"
                LoadResourcesAndEvents()
            Case "filter"
                LoadResourcesAndEvents()
            Case "navigate"
                Dim start As Date = e.Data("start")
                Dim ende As Date = e.Data("end")
                DayPilotScheduler1.StartDate = start
                LoadResourcesAndEvents()
                DayPilotScheduler1.DataBind()
                DayPilotScheduler1.Update()
            Case "Delete"
                Response.Write("Delete Me")
            Case "Genehmigen"
                Response.Write("Oh ja - Du  kannst")
        End Select
    End Sub

    Private Sub LoadResourcesAndEvents()
        LoadResources()
        DayPilotScheduler1.DataSource = dbGetEvents(DayPilotScheduler1.StartDate, DayPilotScheduler1.Days)
        DayPilotScheduler1.DataBind()
        DayPilotScheduler1.Update()

    End Sub

    Private Function dbGetResources() As DataTable
        Dim da As New SqlDataAdapter("SELECT * FROM [EventTyp]", ConfigurationManager.ConnectionStrings("toolboxConnectionString").ConnectionString)
        Dim dt As New DataTable()
        da.Fill(dt)

        Return dt
    End Function

    Protected Sub DayPilotScheduler1_BeforeEventRender(sender As Object, e As BeforeEventRenderEventArgs) Handles DayPilotScheduler1.BeforeEventRender
        e.EventMoveVerticalEnabled = False
        Select Case DirectCast(e.DataItem("eventstatus"), Integer)
            Case 1 : e.DurationBarColor = "#F00"
            Case 2 : e.DurationBarColor = "#0F0"
            Case 3 : e.DurationBarColor = "#00F"
            Case 4 : e.DurationBarColor = "#0FF"
            Case 5 : e.DurationBarColor = "#87A"
            Case 31 : e.DurationBarColor = "#24C566"
        End Select
    End Sub

    Protected Sub DayPilotScheduler1_Command1(sender As Object, e As CommandEventArgs) Handles DayPilotScheduler1.Command

    End Sub

    Protected Sub DayPilotScheduler1_EventClick(sender As Object, e As EventClickEventArgs) Handles DayPilotScheduler1.EventClick
        TextBoxEditName.Text = e.Text
        TextBoxEditStart.Text = e.Start.ToString("M/d/yyyy HH:mm")
        TextBoxEditEnd.Text = e.End.ToString("M/d/yyyy HH:mm")
        UpdatePanelEdit.Update()
        ModalPopupEdit.Show()
    End Sub

    Protected Sub DayPilotScheduler1_EventMenuClick(sender As Object, e As EventMenuClickEventArgs) Handles DayPilotScheduler1.EventMenuClick
        If e.Command = "Delete" Then
            ' delete the event in the database
            Dim id As Integer = e.ResourceId
            Using con As New SqlConnection(ConfigurationManager.ConnectionStrings("toolboxConnectionString").ConnectionString)
                con.Open()
                Dim cmd As New SqlCommand("Delete FROM [Events] WHERE ((resource_id=@id) AND (eventstart=@eventstart));", con)
                cmd.Parameters.AddWithValue("@id", id)
                cmd.Parameters.AddWithValue("@eventstart", e.Start)
                cmd.ExecuteNonQuery()
            End Using
            'UpdatePanelScheduler.Update()
            Response.Redirect("contact.aspx")

        ElseIf e.Command = "New" Then
            ' populate the fields

        End If
    End Sub

    Protected Sub DayPilotScheduler1_TimeRangeSelected(sender As Object, e As Events.TimeRangeSelectedEventArgs) Handles DayPilotScheduler1.TimeRangeSelected

        Response.Write("it comes, it goes ...")
    End Sub


    Protected Sub ButtonEditSave_Click(sender As Object, e As EventArgs) Handles ButtonEditSave.Click

    End Sub

    Protected Sub ButtonEditCancel_Click(sender As Object, e As EventArgs) Handles ButtonEditCancel.Click
        ModalPopupEdit.Hide()
    End Sub

    Protected Sub PublishErrorMsg(ByVal msg As String)
        lbl_ErrorMsg.Text = msg
        lbl_ErrorMsg.Visible = True
        Btn_ErrMsg.Visible = True
    End Sub

    Protected Sub Btn_ErrMsg_Click(sender As Object, e As EventArgs) Handles Btn_ErrMsg.Click
        lbl_ErrorMsg.Text = ""
        lbl_ErrorMsg.Visible = False
        Me.Visible = False
        Page.Response.Redirect("http://localhost/toolbox")
    End Sub
End Class
