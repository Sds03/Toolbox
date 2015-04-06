<%@ Page Language="VB" AutoEventWireup="false" CodeFile="days.aspx.vb" Inherits="days" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
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
	<form id="form2" runat="server">
        <div style="margin-bottom: 5px;">
	</div>
	<div>
		<table border="0" cellspacing="4" cellpadding="0">
			<tr>
				<td align="right"></td>
				<td>
					<div class="header">Urlaubstage</div>
				</td>
			</tr>
            <tr>
				<td align="right">Id:</td>
				<td><asp:TextBox ID="TextBoxId" runat="server"></asp:TextBox></td>
			</tr>
			<tr>
				<td align="right">&nbsp;</td>
				<td><asp:TextBox ID="TextBoxStart" runat="server"></asp:TextBox></td>
			</tr>
			<tr>
				<td align="right">&nbsp;</td>
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
                  id:
                <asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>' />
                <br />
                pid:
                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("pid") %>' />
                <br />
                udaysinyear:
                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("udaysinyear") %>' />
                <br />
                utaken:
                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("utaken") %>' />
                <br />
                uleftover:
                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("uleftover") %>' />
                <br />
                year:
                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("year") %>' />
                <br />
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


   
        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:toolboxConnectionString %>" DeleteCommand="DELETE FROM [Stats] WHERE [id] = @original_id AND (([pid] = @original_pid) OR ([pid] IS NULL AND @original_pid IS NULL)) AND (([udaysinyear] = @original_udaysinyear) OR ([udaysinyear] IS NULL AND @original_udaysinyear IS NULL)) AND (([utaken] = @original_utaken) OR ([utaken] IS NULL AND @original_utaken IS NULL)) AND (([uleftover] = @original_uleftover) OR ([uleftover] IS NULL AND @original_uleftover IS NULL)) AND (([year] = @original_year) OR ([year] IS NULL AND @original_year IS NULL))" InsertCommand="INSERT INTO [Stats] ([pid], [udaysinyear], [utaken], [uleftover], [year]) VALUES (@pid, @udaysinyear, @utaken, @uleftover, @year)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [id], [pid], [udaysinyear], [utaken], [uleftover], [year] FROM [Stats] WHERE ([pid] = @pid)" UpdateCommand="UPDATE [Stats] SET [pid] = @pid, [udaysinyear] = @udaysinyear, [utaken] = @utaken, [uleftover] = @uleftover, [year] = @year WHERE [id] = @original_id AND (([pid] = @original_pid) OR ([pid] IS NULL AND @original_pid IS NULL)) AND (([udaysinyear] = @original_udaysinyear) OR ([udaysinyear] IS NULL AND @original_udaysinyear IS NULL)) AND (([utaken] = @original_utaken) OR ([utaken] IS NULL AND @original_utaken IS NULL)) AND (([uleftover] = @original_uleftover) OR ([uleftover] IS NULL AND @original_uleftover IS NULL)) AND (([year] = @original_year) OR ([year] IS NULL AND @original_year IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_id" Type="Int32" />
                <asp:Parameter Name="original_pid" Type="Int32" />
                <asp:Parameter Name="original_udaysinyear" Type="Int32" />
                <asp:Parameter Name="original_utaken" Type="Int32" />
                <asp:Parameter Name="original_uleftover" Type="Int32" />
                <asp:Parameter Name="original_year" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="pid" Type="Int32" />
                <asp:Parameter Name="udaysinyear" Type="Int32" />
                <asp:Parameter Name="utaken" Type="Int32" />
                <asp:Parameter Name="uleftover" Type="Int32" />
                <asp:Parameter Name="year" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:QueryStringParameter Name="pid" QueryStringField="pid" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="pid" Type="Int32" />
                <asp:Parameter Name="udaysinyear" Type="Int32" />
                <asp:Parameter Name="utaken" Type="Int32" />
                <asp:Parameter Name="uleftover" Type="Int32" />
                <asp:Parameter Name="year" Type="Int32" />
                <asp:Parameter Name="original_id" Type="Int32" />
                <asp:Parameter Name="original_pid" Type="Int32" />
                <asp:Parameter Name="original_udaysinyear" Type="Int32" />
                <asp:Parameter Name="original_utaken" Type="Int32" />
                <asp:Parameter Name="original_uleftover" Type="Int32" />
                <asp:Parameter Name="original_year" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
   
   
</body>
</html>
