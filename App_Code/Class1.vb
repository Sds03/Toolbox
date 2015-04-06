Imports Microsoft.VisualBasic
Imports System.Web.UI

Public Class Class1


    ''' <summary>
    ''' ASP.NET JavaScript message box class
    ''' </summary>
    Public Sub ShowMessage(ByVal MessageText As String, ByVal MyPage As Page)

        MyPage.ClientScript.RegisterStartupScript(MyPage.GetType(), _
            "MessageBox", "alert('" & MessageText.Replace("'", "\'") & "');", True)
    End Sub

End Class

