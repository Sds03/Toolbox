
Partial Class SiteMaster
    Inherits System.Web.UI.MasterPage

    Protected Sub Unnamed_LoggingOut()
        Context.GetOwinContext().Authentication.SignOut()

    End Sub
End Class

