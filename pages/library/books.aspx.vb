
Partial Class pages_library_books
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        FormView1.ChangeMode(FormViewMode.Insert)
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Session("sqlSearch") = tbSearch.Text
        GridView1.DataBind()
    End Sub

    Protected Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        Session("sqlSearch") = "[a-z]%"
        GridView1.DataBind()
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Session("sqlSearch") = "[a-z]%"
        Session("FilterLend") = False
    End Sub

    Protected Sub Button4_Click(sender As Object, e As EventArgs)
        Dim fuc As FileUpload = FormView1.FindControl("FileUpload1")
        Dim sl As Label = FormView1.FindControl("StatusLabel")
        Dim tbURL As TextBox = FormView1.FindControl("tbpicURL")
        If (fuc.HasFile) Then
            Try
                Dim filename As String = fuc.FileName
                fuc.SaveAs(Server.MapPath("~/Toolbox/images") + filename)
                sl.Text = "Upload status: File uploaded!" + Server.MapPath("~/") + filename
                tbURL.Text = "~\images" + filename
            Catch ex As Exception
                sl.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message
            End Try

        End If
    End Sub

    Protected Sub GridView1_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GridView1.RowDataBound
        FormView1.ChangeMode(FormViewMode.Edit)
    End Sub
End Class
