
Partial Class pages_library_books
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        FormView1.ChangeMode(FormViewMode.Insert)
    End Sub
End Class
