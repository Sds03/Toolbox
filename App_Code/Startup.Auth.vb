Imports Owin
Imports Microsoft.Owin.Security.Cookies
Imports Microsoft.Owin.Security.Google
Imports Microsoft.Owin

Partial Public Class Startup
    ' Weitere Informationen zum Konfigurieren der Authentifizierung finden Sie unter "http://go.microsoft.com/fwlink/?LinkId=301883".
    Public Sub ConfigureAuth(app As IAppBuilder)
        ' Anwendung für die Verwendung eines Cookies zum Speichern von Informationen für den angemeldeten Benutzer aktivieren
        ' und außerdem Informationen zu einem Benutzer speichern, der sich mit dem Anmeldeanbieter eines Drittanbieters anmeldet.
        ' Dies ist erforderlich, wenn Ihre Anwendung Benutzern die Anmeldung erlaubt
        app.UseCookieAuthentication(New CookieAuthenticationOptions() With {
        .AuthenticationType = DefaultAuthenticationTypes.ApplicationCookie,
        .LoginPath = New PathString("/Account/Login")})
        app.UseExternalSignInCookie(DefaultAuthenticationTypes.ExternalCookie)

        ' Auskommentierung der folgenden Zeilen aufheben, um die Anmeldung mit Anmeldeanbietern von Drittanbietern zu ermöglichen
        'app.UseMicrosoftAccountAuthentication(
        '    clientId:= "",
        '    clientSecret:= "")

        'app.UseTwitterAuthentication(
        '   consumerKey:= "",
        '   consumerSecret:= "")

        'app.UseFacebookAuthentication(
        '   appId:= "",
        '   appSecret:= "")

        'app.UseGoogleAuthentication(New GoogleOAuth2AuthenticationOptions() With {
        '   .ClientId = "",
        '   .ClientSecret = ""})
    End Sub
End Class
