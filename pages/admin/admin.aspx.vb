
Partial Class pages_admin_admin
    Inherits System.Web.UI.Page



    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If User.Identity.IsAuthenticated And (User.IsInRole("Admin")) Then

        Else
            'Response.Redirect("~/default.aspx")
        End If
    End Sub
End Class
