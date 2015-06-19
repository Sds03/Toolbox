
Partial Class SiteMaster
    Inherits System.Web.UI.MasterPage

<<<<<<< HEAD
    Protected Sub Unnamed_LoggingOut(sender As Object, e As LoginCancelEventArgs)
        Context.GetOwinContext().Authentication.SignOut()
=======
    Protected Sub Unnamed_LoggingOut()
        Context.GetOwinContext().Authentication.SignOut()

>>>>>>> origin/master
    End Sub

End Class

