' Copyright © 2005 - 2013 Annpoint, s.r.o.
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

Imports System
Imports System.Configuration
Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.UI
Imports Class1


Partial Public Class [New]
    Inherits Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
        Lbl_Msg.Text = ""

        If Not IsPostBack Then
            TextBoxStart.Text = Convert.ToDateTime(Request.QueryString("start")).ToShortDateString()
            TextBoxEnd.Text = Convert.ToDateTime(Request.QueryString("end")).ToShortDateString()
            TextBoxResource.Text = Request.QueryString("r")
            TextBoxName.Focus()
            Session("ErrorMsg") = False
        End If
    End Sub
    Protected Sub ButtonOK_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim start As Date = Convert.ToDateTime(TextBoxStart.Text)
        Dim [end] As Date = Convert.ToDateTime(TextBoxEnd.Text)
        Dim resource As String = TextBoxResource.Text
        Dim status As String = DropDownListFilter.SelectedValue
        Dim eventname As String = TextBoxEventname.Text

        Select Case status
            Case 1 : TextBoxName.Text = "Krank"
            Case 2 : TextBoxName.Text = "Ü-Std frei"
            Case 3 : TextBoxName.Text = "Urlaub"
            Case 4 : TextBoxName.Text = "Urlaub/2"
            Case 5 : TextBoxName.Text = TextBoxEventname.Text

        End Select
        If dbInsertEvent(start, [end], TextBoxName.Text, resource, DropDownListFilter.SelectedValue, eventname) Then
            Util.Modal.Close(Me, "OK")
        Else
            If Session("ErrorMsg") Then
                Lbl_Msg.Text = ""
                Util.Modal.Close(Me, "OK")
            Else
                Dim msg As Class1
                msg.ShowMessage("Es sind nicht genügend Urlaubstage vorhanden", Me.Page)
            End If
        End If
    End Sub

    Protected Sub ShowMsg(ByVal msg As String)
        Lbl_Msg.Text = msg
    End Sub
    Private Function dbGetResources() As DataTable
        Dim da As New SqlDataAdapter("SELECT [Id], [typ] FROM [eventTyp]", ConfigurationManager.ConnectionStrings("toolboxConnectionString").ConnectionString)
        Dim dt As New DataTable()
        da.Fill(dt)

        Return dt
    End Function

    Function getNumberOfVacationDays(ByVal start As Date, ByVal ende As Date) As Integer
        Dim res, count As Integer
        Dim workDt As Date = start


        res = DateDiff(DateInterval.Day, start, ende) + 1
        count = res
        For i = 1 To res
            If (workDt.DayOfWeek = DayOfWeek.Saturday) Or (workDt.DayOfWeek = DayOfWeek.Sunday) Then count = count - 1
            workDt = DateAdd(DateInterval.Day, 1, workDt)
        Next
        Return count
    End Function

    Private Function dbInsertEvent(ByVal start As Date, ByVal [end] As Date, ByVal name As String, ByVal resource As String, ByVal status As Integer, ByVal eventname As String) As Boolean
        Using con As New SqlConnection(ConfigurationManager.ConnectionStrings("toolboxConnectionString").ConnectionString)
            con.Open()

            'determine whether there is enough Urlaub days
            Dim dt As New DataTable
            Dim da As New SqlDataAdapter("SELECT * FROM STATS WHERE pid=" & resource & " AND year=" & start.Year, con)
            Dim vacationAccepted As Boolean = False
            da.Fill(dt)
            For Each r As DataRow In dt.Rows
                If (DirectCast(r("udaysinyear"), Integer) - DirectCast(r("utaken"), Integer) + DirectCast(r("uleftover"), Integer) - getNumberOfVacationDays(start, [end])) > 0 Then
                    vacationAccepted = True
                    status = 31
                End If

            Next

            If vacationAccepted Then
                'Apply events to calendar
                Dim cmd As SqlCommand = New SqlCommand("INSERT INTO [Events] (eventstart, eventEnd,eventname, resource_id, eventStatus) VALUES(@eventstart, @eventend, @eventname, @resource, @status)", con)

                'cmd.Parameters.AddWithValue("id", ID)
                cmd.Parameters.AddWithValue("eventstart", start)
                cmd.Parameters.AddWithValue("eventend", [end])
                cmd.Parameters.AddWithValue("eventname", name)
                cmd.Parameters.AddWithValue("resource", resource)
                cmd.Parameters.AddWithValue("status", status)
                cmd.ExecuteNonQuery()
                Return True
            Else
                Return False
            End If
        End Using
    End Function

    Protected Sub ButtonCancel_Click(ByVal sender As Object, ByVal e As EventArgs)
        Util.Modal.Close(Me, "Cancel")
    End Sub
End Class
