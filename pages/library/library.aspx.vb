
Partial Class pages_library_library
    Inherits System.Web.UI.Page

    Protected Sub btnSearch_Click(sender As Object, e As EventArgs) Handles btnSearch.Click
        Session("sqlSearch") = tbSearch.Text
        GridView1.DataBind()

    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        ' FormView1.ChangeMode(FormViewMode.Insert)
        Session("sqlSearch") = "[a-z]%"
        Session("FilterLend") = False
        'Page.Form.Attributes.Add("enctype", "multipart/form-data")
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs)
        If FormView1.CurrentMode = FormViewMode.Insert Then
        Else
            FormView1.ChangeMode(FormViewMode.Insert)
        End If
    End Sub

    Protected Sub UploadButton_Click(sender As Object, e As EventArgs)
        Dim fuc As FileUpload = FormView1.FindControl("FileUpload1")
        Dim sl As Label = FormView1.FindControl("StatusLabel")
        Dim tbURL As TextBox = FormView1.FindControl("TextBox1")
        If (fuc.HasFile) Then
            Try
                Dim filename As String = fuc.FileName
                fuc.SaveAs(Server.MapPath("~/images/") + filename)
                sl.Text = "Upload status: File uploaded!" + Server.MapPath("~/") + filename
                tbURL.Text = "~/images/" + filename
            Catch ex As Exception
                sl.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message
            End Try

        End If
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Session("sqlSearch") = "[a-z]%"
        GridView1.DataBind()
    End Sub

    Protected Sub GridView1_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GridView1.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            If e.Row.Cells.Item(1).Text = "NMS" Then
                e.Row.Cells.Item(1).BackColor = Drawing.Color.Aqua
            End If

        End If
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged
        FormView1.ChangeMode(FormViewMode.Edit)

    End Sub

    Protected Sub FormView1_ItemCommand(sender As Object, e As FormViewCommandEventArgs) Handles FormView1.ItemCommand
        ' If e.CommandName = "Update" Then FormView1.ChangeMode(FormViewMode.Edit)
    End Sub

    Protected Sub FormView1_ItemDeleted(sender As Object, e As FormViewDeletedEventArgs) Handles FormView1.ItemDeleted
        GridView1.DataBind()
    End Sub

    Protected Sub FormView1_ItemInserted(sender As Object, e As FormViewInsertedEventArgs) Handles FormView1.ItemInserted
        GridView1.DataBind()
    End Sub

    Protected Sub DropDownList3_SelectedIndexChanged(sender As Object, e As EventArgs)
        Dim lent As CheckBox = FormView1.FindControl("CBLent")
        Dim ddl As DropDownList = FormView1.FindControl("DropDownList3")
        If ddl.Text = "1082" Then
            lent.Checked = False
        Else : lent.Checked = True
        End If

    End Sub

    Protected Sub FormView1_ItemUpdated(sender As Object, e As FormViewUpdatedEventArgs) Handles FormView1.ItemUpdated
        GridView1.DataBind()
    End Sub

    Protected Sub FormView1_ItemUpdating(sender As Object, e As FormViewUpdateEventArgs) Handles FormView1.ItemUpdating
        Dim tst As FormViewUpdateEventArgs = e
        Label3.Text = e.NewValues.Item("picPath")
        Label4.Text = e.OldValues("picPath")


    End Sub
End Class
