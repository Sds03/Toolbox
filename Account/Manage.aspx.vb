Imports Microsoft.AspNet.Identity
Imports Microsoft.AspNet.Identity.EntityFramework
Imports System
Imports System.Collections.Generic

Public Partial Class Account_Manage
    Inherits System.Web.UI.Page
    Protected Property SuccessMessageText() As String
        Get
            Return m_SuccessMessage
        End Get
        Private Set(value As String)
            m_SuccessMessage = value
        End Set
    End Property
    Private m_SuccessMessage As String

    Protected Property CanRemoveExternalLogins() As Boolean
        Get
            Return m_CanRemoveExternalLogins
        End Get
        Private Set(value As Boolean)
            m_CanRemoveExternalLogins = value
        End Set
    End Property
    Private m_CanRemoveExternalLogins As Boolean

    Private Function HasPassword(manager As UserManager) As Boolean
        Dim appUser = manager.FindById(User.Identity.GetUserId())
        Return (appUser IsNot Nothing AndAlso appUser.PasswordHash IsNot Nothing)
    End Function

    Protected Sub Page_Load() Handles Me.Load
        If Not IsPostBack Then
            ' Zu rendernde Abschnitte ermitteln
            Dim manager = New UserManager()
            If HasPassword(manager) Then
                changePasswordHolder.Visible = True
            Else
                setPassword.Visible = True
                changePasswordHolder.Visible = False
            End If
            CanRemoveExternalLogins = manager.GetLogins(User.Identity.GetUserId()).Count() > 1

            ' Rendererfolgsmeldung
            Dim message = Request.QueryString("m")
            If message IsNot Nothing Then
                ' Abfragezeichenfolge aus der Aktion entfernen
                Form.Action = ResolveUrl("~/Account/Manage")
                SuccessMessageText = If(message = "ChangePwdSuccess", "Ihr Kennwort wurde geändert.", If(message = "SetPwdSuccess", "Ihr Kennwort wurde festgelegt.", If(message = "RemoveLoginSuccess", "Das Konto wurde entfernt.", [String].Empty)))
                successMessage.Visible = Not [String].IsNullOrEmpty(SuccessMessageText)
            End If
        End If
    End Sub

    Protected Sub ChangePassword_Click(sender As Object, e As EventArgs)
        If IsValid Then
            Dim manager = New UserManager()
            Dim result As IdentityResult = manager.ChangePassword(User.Identity.GetUserId(), CurrentPassword.Text, NewPassword.Text)
            If result.Succeeded Then
                Dim userInfo = manager.FindById(User.Identity.GetUserId())
                IdentityHelper.SignIn(manager, userInfo, isPersistent:=False)
                Response.Redirect("~/Account/Manage?m=ChangePwdSuccess")
            Else
                AddErrors(result)
            End If
        End If
    End Sub

    Protected Sub SetPassword_Click(sender As Object, e As EventArgs)
        If IsValid Then
            ' Lokale Anmeldeinformationen erstellen und das lokale Konto mit dem Benutzer verknüpfen
            Dim manager = New UserManager()
            Dim result As IdentityResult = manager.AddPassword(User.Identity.GetUserId(), password.Text)
            If result.Succeeded Then
                Response.Redirect("~/Account/Manage?m=SetPwdSuccess")
            Else
                AddErrors(result)
            End If
        End If
    End Sub

    Public Function GetLogins() As IEnumerable(Of UserLoginInfo)
        Dim manager = New UserManager()
        Dim accounts = manager.GetLogins(User.Identity.GetUserId())
        CanRemoveExternalLogins = accounts.Count() > 1 Or HasPassword(manager)
        Return accounts
    End Function

    Public Sub RemoveLogin(loginProvider As String, providerKey As String)
        Dim manager = New UserManager()
        Dim result = manager.RemoveLogin(User.Identity.GetUserId(), New UserLoginInfo(loginProvider, providerKey))
        Dim msg As String = String.Empty
        If result.Succeeded Then
            Dim userInfo = manager.FindById(User.Identity.GetUserId())
            IdentityHelper.SignIn(manager, userInfo, isPersistent:=False)
            msg = "?m=RemoveLoginSuccess"
        End If
        Response.Redirect("~/Account/Manage" & msg)
    End Sub

    Private Sub AddErrors(result As IdentityResult)
        For Each [error] As String In result.Errors
            ModelState.AddModelError("", [error])
        Next
    End Sub
End Class
