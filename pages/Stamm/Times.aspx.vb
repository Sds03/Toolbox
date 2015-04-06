
Partial Class pages_Stamm_Times
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        DetailsView1.ChangeMode(DetailsViewMode.Insert)
    End Sub

    Protected Sub DetailsView1_ItemInserted(sender As Object, e As DetailsViewInsertedEventArgs) Handles DetailsView1.ItemInserted
        GridView1.DataBind()
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged
        DetailsView1.ChangeMode(DetailsViewMode.Edit)
    End Sub

    
    Protected Sub DetailsView1_ItemUpdating(sender As Object, e As DetailsViewUpdateEventArgs) Handles DetailsView1.ItemUpdating
        DetailsView1.ChangeMode(DetailsViewMode.Edit)
    End Sub
End Class
