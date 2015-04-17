
Partial Class pages_library_library
    Inherits System.Web.UI.Page

    Protected Sub btnSearch_Click(sender As Object, e As EventArgs)
       
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        FormView1.ChangeMode(FormViewMode.Insert)
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs)
        If FormView1.CurrentMode = FormViewMode.Insert Then
        Else
            FormView1.ChangeMode(FormViewMode.Insert)
        End If
    End Sub
End Class
