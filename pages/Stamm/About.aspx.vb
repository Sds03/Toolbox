Imports System.Net.Http
Imports Newtonsoft.Json
Imports System.Collections.Generic
Imports System.Web.Security
Imports Microsoft.AspNet.Identity
Imports Microsoft.AspNet.Identity.EntityFramework
Imports System.Linq
Imports System.Web
Imports System.Data.SqlClient
Imports System.Data
Imports DayPilot.Web.Ui.Data
Imports DayPilot.Web.Ui.Enums
Imports DayPilot.Web.Ui.Events.Scheduler
Imports DayPilot.Web.Ui.Events
Imports Class1



Partial Class About
    Inherits Page
    Protected btn_showModal As Button

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If User.Identity.IsAuthenticated And (User.IsInRole("Admin") Or User.IsInRole("Gruppe")) Then

        Else
            Response.Redirect("~/default.aspx")
        End If
        GridView1.SelectedIndex = 1
    End Sub

    Protected Sub FormView1_ItemDeleted(sender As Object, e As FormViewDeletedEventArgs) Handles FormView1.ItemDeleted
        GridView1.DataBind()
    End Sub

    Protected Sub FormView1_ItemInserted(sender As Object, e As FormViewInsertedEventArgs) Handles FormView1.ItemInserted
        ' Access the application context and create result variables.
        Dim context As ApplicationDbContext = New ApplicationDbContext()
        Dim IdRoleResult As IdentityResult
        Dim IdUserResult As IdentityResult

        Dim uRole As RadioButtonList = FormView1.FindControl("rb_role")
        'Standard=1
        If uRole Is Nothing Then uRole.Text = 1

        ' Create a RoleStore object by using the ApplicationDbContext object. 
        ' The RoleStore is only allowed to contain IdentityRole objects.
        Dim roleStore = New RoleStore(Of IdentityRole)(context)
        ' Create a RoleManager object that is only allowed to contain IdentityRole objects.
        ' When creating the RoleManager object, you pass in (as a parameter) a new RoleStore object. 
        Dim roleMgr = New RoleManager(Of IdentityRole)(roleStore)
        ' Then, you create the "Admin" role if it doesn't already exist.
        If Not roleMgr.RoleExists("Admin") Then
            IdRoleResult = roleMgr.Create(New IdentityRole() With {.Name = "Admin"})
        End If
        If Not roleMgr.RoleExists("Standard") Then
            IdRoleResult = roleMgr.Create(New IdentityRole() With {.Name = "Standard"})
        End If
        If Not roleMgr.RoleExists("Gruppe") Then
            IdRoleResult = roleMgr.Create(New IdentityRole() With {.Name = "Gruppe"})
        End If
        Dim userMgr = New UserManager(Of ApplicationUser)(New UserStore(Of ApplicationUser)(context))
        Dim appUser = New ApplicationUser() With {.UserName = Left(e.Values.Item("vname"), 1) & e.Values.Item("name"), .Email = Left(e.Values.Item("vname"), 1) & e.Values.Item("name") & "@gutesicht-rendsburg.de", .EmailConfirmed = True}
        IdUserResult = userMgr.Create(appUser, "HPpassword")
        ' If the new "Admin" user was successfully created, 
        ' add the "Admin" user to the "Admin" role. 
        If Not userMgr.IsInRole(userMgr.FindByEmail(appUser.UserName & "@gutesicht-rendsburg.de").Id, uRole.SelectedItem.Text) Then
            IdUserResult = userMgr.AddToRole(userMgr.FindByEmail(appUser.UserName & "@gutesicht-rendsburg.de").Id, uRole.SelectedItem.Text)
        End If
        GridView1.DataBind()

    End Sub

    Protected Sub FormView1_ItemUpdated(sender As Object, e As FormViewUpdatedEventArgs) Handles FormView1.ItemUpdated
        GridView1.DataBind()

    End Sub

    'new user
    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        FormView1.ChangeMode(FormViewMode.Insert)
    End Sub

    '------------------------------- User Authentication ---------------------------------


    Function Register(email As String, password As String) As String

        Dim registerModel As New Object
        With registerModel
            .email = email
            .password = password
            .ConfirmPassword = password
        End With

        Dim client = New HttpClient()
        With client
            Dim Response =
                client.PostAsJsonAsync(
                "http://localhost:62069/api/Account/Register",
                registerModel).Result
            Register = Response.StatusCode.ToString()
        End With
    End Function


    Function GetToken(userName As String, password As String) As String

        Dim pairs As New List(Of KeyValuePair(Of String, String))

        pairs.Add(New KeyValuePair(Of String, String)("grant_type", "password"))
        pairs.Add(New KeyValuePair(Of String, String)("username", "userName"))
        pairs.Add(New KeyValuePair(Of String, String)("Password", "password"))

        Dim content = New FormUrlEncodedContent(pairs)
        Dim client As New HttpClient
        With client
            Dim Response =
                  client.PostAsync("http://localhost:62069/Token", content).Result()
            GetToken = Response.Content.ReadAsStringAsync().Result()
        End With

    End Function
    Protected Sub ButtonCreateCancel_Click(sender As Object, e As EventArgs) Handles ButtonCreateSave.Click
        MPU1.Hide()
    End Sub


    Protected Sub ButtonCreateSave_Click(sender As Object, e As EventArgs) Handles ButtonCreateSave.Click
        Dim pid As String

        'update vacation stats from modal window
        pid = Session("pid")
        Dim cmd As String = "Update  Stats SET udaysinyear=" & Session("gesamt") & ", uleftover=" & Session("rest") & " WHERE pid=" & pid
        Session("gesamt") = TB_Gesamt.Text
        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("toolboxConnectionString").ConnectionString)
        Dim dt As New DataTable
        Dim da As New SqlDataAdapter
        Dim sqlcmd = New SqlCommand
        con.Open()
        sqlcmd.CommandText = cmd
        sqlcmd.Connection = con
        da.UpdateCommand = sqlcmd
        da.UpdateCommand.ExecuteNonQuery()
        con.Close()
        MPU1.Hide()
    End Sub

    Protected Sub SqlDataSource2_Inserted(sender As Object, e As SqlDataSourceStatusEventArgs) Handles SqlDataSource2.Inserted
        Dim statsID As Integer = e.Command.Parameters("@id").Value

        SqlDataSource3.InsertParameters("pid").DefaultValue = statsID
        SqlDataSource3.InsertParameters("year").DefaultValue = Now.Year
        SqlDataSource3.Insert()
    End Sub

    Protected Sub SqlDataSource2_Inserting(sender As Object, e As SqlDataSourceCommandEventArgs) Handles SqlDataSource2.Inserting
        e.Command.Parameters("@uname").Value = Left(e.Command.Parameters("@vname").Value, 1) & e.Command.Parameters("@name").Value


    End Sub

    Protected Sub showDaysBtn_Click(sender As Object, e As EventArgs)

        ' MPU1.Show()
    End Sub

    Protected Sub GridView1_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles GridView1.RowCommand
        Dim gvr As GridViewRow
        Dim tb As New TextBox
        Dim gesamt, rest, taken As Integer
        If e.CommandName = "Go" Then
            Dim id = e.CommandArgument
            gvr = DirectCast(GridView1.Rows.Item(id), GridViewRow)
            tb = MPU1.FindControl("TB_MPU_ID")
            tb.Text = gvr.Cells(1).Text
            Session("pid") = tb.Text

            'get  Urlaubsstats
            Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("toolboxConnectionString").ConnectionString)
            Dim dt As New DataTable
            Dim da As New SqlDataAdapter("select * From Stats Where pid=" & tb.Text & " AND year=" & Year(Now), con)

            da.Fill(dt)
            For Each r As DataRow In dt.Rows
                gesamt = DirectCast(r("udaysinyear"), Integer)
                taken = DirectCast(r("utaken"), Integer)
                rest = DirectCast(r("uleftover"), Integer)
            Next r
            TB_Gesamt.Text = gesamt
            Session("gesamt") = gesamt
            TB_genommen.Text = taken
            TB_Resturlaub.Text = rest
            Session("rest") = rest
            MPU1.Show()
            UpdatePanelCreate.Update()
            con.Close()
        End If
    End Sub

    Protected Sub TB_Gesamt_TextChanged(sender As Object, e As EventArgs) Handles TB_Gesamt.TextChanged
        Session("gesamt") = TB_Gesamt.Text
    End Sub

    Protected Sub TB_Resturlaub_TextChanged(sender As Object, e As EventArgs) Handles TB_Resturlaub.TextChanged
        Session("rest") = TB_Resturlaub.Text
    End Sub

    Protected Sub showyears_Click(sender As Object, e As EventArgs)
        If Me.Visible Then

        End If
    End Sub

    'Password Reset 
    Protected Sub Button3_Click(sender As Object, e As EventArgs)
        Dim ApplicationDbContext As ApplicationDbContext = New ApplicationDbContext()
        Dim umgr As New UserManager

        Dim newPassword As String = "HPpassword"
        Dim tb As TextBox = FormView1.FindControl("tb_uname")
        Dim cUser As ApplicationUser = umgr.FindByName(tb.Text)
        Dim hashedNewPassword As String = umgr.PasswordHasher.HashPassword(newPassword)
        Dim store As UserStore(Of ApplicationUser) = New UserStore(Of ApplicationUser)
        store.SetPasswordHashAsync(cUser, hashedNewPassword)


    End Sub

    Protected Sub FormView1_ItemUpdating(sender As Object, e As FormViewUpdateEventArgs) Handles FormView1.ItemUpdating
        Dim context As ApplicationDbContext = New ApplicationDbContext()
        Dim uRole As RadioButtonList = FormView1.FindControl("rb_role")
        Dim tb As TextBox = FormView1.FindControl("tb_uname")
        Dim umgr = New UserManager(Of ApplicationUser)(New UserStore(Of ApplicationUser)(context))
        Dim cUser As ApplicationUser = umgr.FindByName(tb.Text)
        Dim store As UserStore(Of ApplicationUser) = New UserStore(Of ApplicationUser)

        If umgr.IsInRole(cUser.Id, uRole.Text) Then
        Else
            Select Case uRole.Text
                Case "2" : store.AddToRoleAsync(cUser, "Admin")
                Case "3" : store.AddToRoleAsync(cUser, "Gruppe")
            End Select

        End If
    End Sub
End Class