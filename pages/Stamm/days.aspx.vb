
Partial Class days
    Inherits System.Web.UI.Page

    Protected Sub ButtonOK_Click(sender As Object, e As EventArgs) Handles ButtonOK.Click
        Util.Modal.Close(Me, "OK")
    End Sub

    Protected Sub ButtonCancel_Click(sender As Object, e As EventArgs) Handles ButtonCancel.Click

    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            TextBoxId.Text = Request.QueryString("id")
            TextBoxName.Focus()
             End If
    End Sub
End Class
