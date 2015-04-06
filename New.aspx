<%@ Page Language="vb" AutoEventWireup="true" CodeFile="New.aspx.vb" Inherits="New" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
	<title>New event</title>
	<link href='css/main.css' type="text/css" rel="stylesheet" /> 
    <script type="text/javascript">
        function closewindow() {
            window.close();
        }

    </script>
</head>
<body class="dialog">
	<form id="form1" runat="server">
        <div style="margin-bottom: 5px;">
	Termintyp:
		<asp:DropDownList ID="DropDownListFilter" runat="server">
		<asp:ListItem Text="Krank" Value="1"></asp:ListItem>
		<asp:ListItem Text="Ü-frei" Value="2"></asp:ListItem>
		<asp:ListItem Text="Urlaub" Value="3"></asp:ListItem>
		<asp:ListItem Text="Urlaub/2" Value="4"></asp:ListItem>
        <asp:ListItem Text="Termin" Value="5"></asp:ListItem>
		</asp:DropDownList>
	</div>
	<div>
		<table border="0" cellspacing="4" cellpadding="0">
			<tr>
				<td align="right"></td>
				<td>
					<div class="header">New Termin</div>
				</td>
			</tr>
            <tr>
				<td align="right">Eventname</td>
				<td><asp:TextBox ID="TextBoxEventname" runat="server"></asp:TextBox></td>
			</tr>
			<tr>
				<td align="right">Start:</td>
				<td><asp:TextBox ID="TextBoxStart" runat="server"></asp:TextBox></td>
			</tr>
			<tr>
				<td align="right">End:</td>
				<td><asp:TextBox ID="TextBoxEnd" runat="server"></asp:TextBox></td>
			</tr>
			<tr>
				<td align="right"></td>
				<td><asp:TextBox ID="TextBoxName" runat="server" Visible="false"></asp:TextBox></td>
			</tr>
			<tr>
				<td align="right"></td>
				<td><asp:TextBox ID="TextBoxResource" runat="server" Visible="false"></asp:TextBox></td>
			</tr>
            <tr>
            <td colspan="2"><asp:Label ID="Lbl_Msg" CssClass="userMSG" runat="server" Text=""></asp:Label></td>
            </tr>
			<tr>
				<td align="right"></td>
				<td>
					<asp:Button ID="ButtonOK" runat="server"  OnClick="ButtonOK_Click" Text="OK" />
					<asp:Button ID="ButtonCancel" runat="server" Text="Cancel" OnClick="ButtonCancel_Click" />
				</td>
			</tr>
            <tr>
<td><asp:Panel ID="errors" runat="server" CssClass="userMSG" Visible="false" ></asp:Panel></td>
            </tr>
		</table>

		</div>
	</form>
</body>
</html>