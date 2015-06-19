<%@ Page Title="" Language="VB" MasterPageFile="~/site.master" AutoEventWireup="false" CodeFile="library.aspx.vb" Inherits="pages_library_library" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    
            <asp:Panel runat="server" CssClass="PersoDataPopup" Height="980px" Width="1173px" ScrollBars="Vertical">
                <asp:Label ID="Label1" runat="server" Font-Size="X-Large" Text="HPK Medizinische Bibliothek"></asp:Label>
                <br />
                <asp:TextBox runat="server" ID="tbSearch"></asp:TextBox><asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Suche" />
                <asp:Button ID="Button2" runat="server" Text="Alle" />
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Neu" />
                <asp:CheckBox ID="CBFilter" runat="server" Text="ausgeliehen" AutoPostBack="true" />
                <table class="nav-justified" border="0">
                    <tr>
                        <td style="width: 463px">&nbsp;</td>
                        <td style="width: 67px">&nbsp;</td>
                        <td>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:toolboxConnectionString %>" DeleteCommand="DELETE FROM [Books] WHERE [Id] = @original_Id AND (([titel] = @original_titel) OR ([titel] IS NULL AND @original_titel IS NULL)) AND (([author] = @original_author) OR ([author] IS NULL AND @original_author IS NULL)) AND (([booknr] = @original_booknr) OR ([booknr] IS NULL AND @original_booknr IS NULL)) AND (([location] = @original_location) OR ([location] IS NULL AND @original_location IS NULL)) AND (([description] = @original_description) OR ([description] IS NULL AND @original_description IS NULL)) AND (([numberOfCopies] = @original_numberOfCopies) OR ([numberOfCopies] IS NULL AND @original_numberOfCopies IS NULL)) AND (([nrOfPages] = @original_nrOfPages) OR ([nrOfPages] IS NULL AND @original_nrOfPages IS NULL)) AND (([yearpublished] = @original_yearpublished) OR ([yearpublished] IS NULL AND @original_yearpublished IS NULL)) AND (([picPath] = @original_picPath) OR ([picPath] IS NULL AND @original_picPath IS NULL)) AND (([publisher] = @original_publisher) OR ([publisher] IS NULL AND @original_publisher IS NULL)) AND (([checkedOut] = @original_checkedOut) OR ([checkedOut] IS NULL AND @original_checkedOut IS NULL)) AND (([lent] = @original_lent) OR ([lent] IS NULL AND @original_lent IS NULL)) AND (([pURL] = @original_pURL) OR ([pURL] IS NULL AND @original_pURL IS NULL))" InsertCommand="INSERT INTO [Books] ([titel], [author], [booknr], [location], [description], [numberOfCopies], [nrOfPages], [yearpublished], [picPath], [publisher], [checkedOut], [lent], [pURL]) VALUES (@titel, @author, @booknr, @location, @description, @numberOfCopies, @nrOfPages, @yearpublished, @picPath, @publisher, @checkedOut, @lent, @pURL)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT Books.Id, Books.titel, Books.author, Books.booknr, Books.location, Books.description, Books.numberOfCopies, Books.nrOfPages, Books.yearpublished, Books.picPath, Books.publisher, Books.checkedOut, Books.lent, Books.pURL, Abteilungen.Abteilungsnummer, Abteilungen.Abteilung FROM Books INNER JOIN Abteilungen ON Books.location = Abteilungen.Abteilungsnummer WHERE (Books.Id = @Id)" UpdateCommand="UPDATE [Books] SET [titel] = @titel, [author] = @author, [booknr] = @booknr, [location] = @location, [description] = @description, [numberOfCopies] = @numberOfCopies, [nrOfPages] = @nrOfPages, [yearpublished] = @yearpublished, [picPath] = @picPath, [publisher] = @publisher, [checkedOut] = @checkedOut, [lent] = @lent, [pURL] = @pURL WHERE [Id] = @original_Id " ConflictDetection="CompareAllValues">
                                <DeleteParameters>
                                    <asp:Parameter Name="original_Id" Type="Int32" />
                                    <asp:Parameter Name="original_titel" Type="String" />
                                    <asp:Parameter Name="original_author" Type="String" />
                                    <asp:Parameter Name="original_booknr" Type="String" />
                                    <asp:Parameter Name="original_location" Type="Int32" />
                                    <asp:Parameter Name="original_description" Type="String" />
                                    <asp:Parameter Name="original_numberOfCopies" Type="Int32" />
                                    <asp:Parameter Name="original_nrOfPages" Type="Int32" />
                                    <asp:Parameter Name="original_yearpublished" Type="String" />
                                    <asp:Parameter Name="original_picPath" Type="String" />
                                    <asp:Parameter Name="original_publisher" Type="String" />
                                    <asp:Parameter Name="original_checkedOut" Type="Int32" />
                                    <asp:Parameter Name="original_lent" Type="Boolean" />
                                    <asp:Parameter Name="original_pURL" Type="String" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="titel" Type="String" />
                                    <asp:Parameter Name="author" Type="String" />
                                    <asp:Parameter Name="booknr" Type="String" />
                                    <asp:Parameter Name="location" Type="Int32" />
                                    <asp:Parameter Name="description" Type="String" />
                                    <asp:Parameter Name="numberOfCopies" Type="Int32" />
                                    <asp:Parameter Name="nrOfPages" Type="Int32" />
                                    <asp:Parameter Name="yearpublished" Type="String" />
                                    <asp:Parameter Name="picPath" Type="String" />
                                    <asp:Parameter Name="publisher" Type="String" />
                                    <asp:Parameter Name="checkedOut" Type="Int32" />
                                    <asp:Parameter Name="lent" Type="Boolean" />
                                    <asp:Parameter Name="pURL" Type="String" />
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="GridView1" Name="Id" PropertyName="SelectedValue" Type="Int32" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="titel" Type="String" />
                                    <asp:Parameter Name="author" Type="String" />
                                    <asp:Parameter Name="booknr" Type="String" />
                                    <asp:Parameter Name="location" Type="Int32" />
                                    <asp:Parameter Name="description" Type="String" />
                                    <asp:Parameter Name="numberOfCopies" Type="Int32" />
                                    <asp:Parameter Name="nrOfPages" Type="Int32" />
                                    <asp:Parameter Name="yearpublished" Type="String" />
                                    <asp:Parameter Name="picPath" Type="String" />
                                    <asp:Parameter Name="publisher" Type="String" />
                                    <asp:Parameter Name="checkedOut" Type="Int32" />
                                    <asp:Parameter Name="lent" Type="Boolean" />
                                    <asp:Parameter Name="pURL" Type="String" />
                               
                                    <asp:Parameter Name="original_Id" Type="Int32" />
                                    
                                </UpdateParameters>
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:toolboxConnectionString %>" SelectCommand="SELECT * FROM [Personal]"></asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:toolboxConnectionString %>" DeleteCommand="DELETE FROM [Books] WHERE [Id] = @original_Id AND (([titel] = @original_titel) OR ([titel] IS NULL AND @original_titel IS NULL)) AND (([author] = @original_author) OR ([author] IS NULL AND @original_author IS NULL)) AND (([booknr] = @original_booknr) OR ([booknr] IS NULL AND @original_booknr IS NULL)) AND (([location] = @original_location) OR ([location] IS NULL AND @original_location IS NULL)) AND (([description] = @original_description) OR ([description] IS NULL AND @original_description IS NULL)) AND (([numberOfCopies] = @original_numberOfCopies) OR ([numberOfCopies] IS NULL AND @original_numberOfCopies IS NULL)) AND (([nrOfPages] = @original_nrOfPages) OR ([nrOfPages] IS NULL AND @original_nrOfPages IS NULL)) AND (([yearpublished] = @original_yearpublished) OR ([yearpublished] IS NULL AND @original_yearpublished IS NULL)) AND (([picPath] = @original_picPath) OR ([picPath] IS NULL AND @original_picPath IS NULL)) AND (([publisher] = @original_publisher) OR ([publisher] IS NULL AND @original_publisher IS NULL)) AND (([checkedOut] = @original_checkedOut) OR ([checkedOut] IS NULL AND @original_checkedOut IS NULL)) AND (([lent] = @original_lent) OR ([lent] IS NULL AND @original_lent IS NULL))" InsertCommand="INSERT INTO [Books] ([titel], [author], [booknr], [location], [description], [numberOfCopies], [nrOfPages], [yearpublished], [picPath], [publisher], [checkedOut], [lent]) VALUES (@titel, @author, @booknr, @location, @description, @numberOfCopies, @nrOfPages, @yearpublished, @picPath, @publisher, @checkedOut, @lent)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT Books.Id, Books.titel, Books.author, Books.booknr, Books.location, Books.description, Books.numberOfCopies, Books.nrOfPages, Books.yearpublished, Books.picPath, Books.publisher, Books.checkedOut, Books.lent, Abteilungen.Abteilung, Abteilungen.Abteilungsnummer FROM Books INNER JOIN Abteilungen ON Books.location = Abteilungen.Abteilungsnummer WHERE (Books.Id = @Id)" UpdateCommand="UPDATE [Books] SET [titel] = @titel, [author] = @author, [booknr] = @booknr, [location] = @location, [description] = @description, [numberOfCopies] = @numberOfCopies, [nrOfPages] = @nrOfPages, [yearpublished] = @yearpublished, [picPath] = @picPath, [publisher] = @publisher, [checkedOut] = @checkedOut, [lent] = @lent WHERE [Id] = @original_Id AND (([titel] = @original_titel) OR ([titel] IS NULL AND @original_titel IS NULL)) AND (([author] = @original_author) OR ([author] IS NULL AND @original_author IS NULL)) AND (([booknr] = @original_booknr) OR ([booknr] IS NULL AND @original_booknr IS NULL)) AND (([location] = @original_location) OR ([location] IS NULL AND @original_location IS NULL)) AND (([description] = @original_description) OR ([description] IS NULL AND @original_description IS NULL)) AND (([numberOfCopies] = @original_numberOfCopies) OR ([numberOfCopies] IS NULL AND @original_numberOfCopies IS NULL)) AND (([nrOfPages] = @original_nrOfPages) OR ([nrOfPages] IS NULL AND @original_nrOfPages IS NULL)) AND (([yearpublished] = @original_yearpublished) OR ([yearpublished] IS NULL AND @original_yearpublished IS NULL)) AND (([picPath] = @original_picPath) OR ([picPath] IS NULL AND @original_picPath IS NULL)) AND (([publisher] = @original_publisher) OR ([publisher] IS NULL AND @original_publisher IS NULL)) AND (([checkedOut] = @original_checkedOut) OR ([checkedOut] IS NULL AND @original_checkedOut IS NULL)) AND (([lent] = @original_lent) OR ([lent] IS NULL AND @original_lent IS NULL))">
                                <DeleteParameters>
                                    <asp:Parameter Name="original_Id" Type="Int32" />
                                    <asp:Parameter Name="original_titel" Type="String" />
                                    <asp:Parameter Name="original_author" Type="String" />
                                    <asp:Parameter Name="original_booknr" Type="String" />
                                    <asp:Parameter Name="original_location" Type="Int32" />
                                    <asp:Parameter Name="original_description" Type="String" />
                                    <asp:Parameter Name="original_numberOfCopies" Type="Int32" />
                                    <asp:Parameter Name="original_nrOfPages" Type="Int32" />
                                    <asp:Parameter Name="original_yearpublished" Type="String" />
                                    <asp:Parameter Name="original_picPath" Type="String" />
                                    <asp:Parameter Name="original_publisher" Type="String" />
                                    <asp:Parameter Name="original_checkedOut" Type="Int32" />
                                    <asp:Parameter Name="original_lent" Type="Boolean" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="titel" Type="String" />
                                    <asp:Parameter Name="author" Type="String" />
                                    <asp:Parameter Name="booknr" Type="String" />
                                    <asp:Parameter Name="location" Type="Int32" />
                                    <asp:Parameter Name="description" Type="String" />
                                    <asp:Parameter Name="numberOfCopies" Type="Int32" />
                                    <asp:Parameter Name="nrOfPages" Type="Int32" />
                                    <asp:Parameter Name="yearpublished" Type="String" />
                                    <asp:Parameter Name="picPath" Type="String" />
                                    <asp:Parameter Name="publisher" Type="String" />
                                    <asp:Parameter Name="checkedOut" Type="Int32" />
                                    <asp:Parameter Name="lent" Type="Boolean" />
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="GridView1" Name="Id" PropertyName="SelectedValue" Type="Int32" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="titel" Type="String" />
                                    <asp:Parameter Name="author" Type="String" />
                                    <asp:Parameter Name="booknr" Type="String" />
                                    <asp:Parameter Name="location" Type="Int32" />
                                    <asp:Parameter Name="description" Type="String" />
                                    <asp:Parameter Name="numberOfCopies" Type="Int32" />
                                    <asp:Parameter Name="nrOfPages" Type="Int32" />
                                    <asp:Parameter Name="yearpublished" Type="String" />
                                    <asp:Parameter Name="picPath" Type="String" />
                                    <asp:Parameter Name="publisher" Type="String" />
                                    <asp:Parameter Name="checkedOut" Type="Int32" />
                                    <asp:Parameter Name="lent" Type="Boolean" />
                                    <asp:Parameter Name="original_Id" Type="Int32" />
                                    <asp:Parameter Name="original_titel" Type="String" />
                                    <asp:Parameter Name="original_author" Type="String" />
                                    <asp:Parameter Name="original_booknr" Type="String" />
                                    <asp:Parameter Name="original_location" Type="Int32" />
                                    <asp:Parameter Name="original_description" Type="String" />
                                    <asp:Parameter Name="original_numberOfCopies" Type="Int32" />
                                    <asp:Parameter Name="original_nrOfPages" Type="Int32" />
                                    <asp:Parameter Name="original_yearpublished" Type="String" />
                                    <asp:Parameter Name="original_picPath" Type="String" />
                                    <asp:Parameter Name="original_publisher" Type="String" />
                                    <asp:Parameter Name="original_checkedOut" Type="Int32" />
                                    <asp:Parameter Name="original_lent" Type="Boolean" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:toolboxConnectionString %>" SelectCommand="SELECT [id], [Abteilungsnummer], [Abteilung] FROM [Abteilungen]"></asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:toolboxConnectionString %>" SelectCommand="SELECT Books.Id, Books.titel, Books.location, Books.booknr, Books.author, Books.description, Books.numberOfCopies, Books.nrOfPages, Books.yearpublished, Books.picPath, Books.publisher, Books.checkedOut, Books.lent, Abteilungen.Abteilungsnummer, Abteilungen.Abteilung FROM Books INNER JOIN Abteilungen ON Books.location = Abteilungen.Abteilungsnummer WHERE (Books.titel LIKE '%' + @titel + '%') AND (Books.lent = @CBLent)">
                                <SelectParameters>
                                    <asp:SessionParameter Name="titel" SessionField="sqlSearch" Type="String" />
                                    <asp:ControlParameter ControlID="CBFilter" Name="CBLent" PropertyName="Checked" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                            <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="top: auto; vertical-align: top; width: 463px;">&nbsp;<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" DataSourceID="SqlDataSource4" ForeColor="#333333" GridLines="None" AllowSorting="True">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:CommandField ShowSelectButton="True" />
                                <asp:BoundField DataField="id" HeaderText="ID" SortExpression="ID" />
                                <asp:BoundField DataField="Abteilung" HeaderText="Standort" SortExpression="Abteilung" />
                                <asp:BoundField DataField="titel" HeaderText="Titel" SortExpression="titel" />
                                <asp:BoundField DataField="booknr" HeaderText="Buchnr" SortExpression="booknr" />
                                <asp:BoundField DataField="author" HeaderText="Author" SortExpression="author" />
                            </Columns>
                            <EditRowStyle BackColor="#999999" />
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#cccccc" Font-Bold="True" ForeColor="Black" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#E9E7E2" />
                            <SortedAscendingHeaderStyle BackColor="#506C8C" />
                            <SortedDescendingCellStyle BackColor="#FFFDF8" />
                            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                        </asp:GridView>
                        </td>
                        <td style="top: auto; vertical-align: top; width: 67px;">&nbsp;</td>
                        <td>&nbsp;
                    <asp:FormView ID="FormView1" runat="server" DataKeyNames="Id" DataSourceID="SqlDataSource1">
                        <EditItemTemplate>
                            <table class="nav-justified">
                                <tr>
                                    <td style="width: 107px">
                                        <table border="0" class="nav-justified" style="border-width: 6px; border-color: #C0C0C0; background-color: #E1E3E1;">
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("abteilung")%>'></asp:Label>
                                                </td>
                                                <td style="width: 148px">&nbsp;</td>
                                                <td>&nbsp;</td>
                                                <td rowspan="5"><b>Beschreibung</b><asp:TextBox ID="descriptionTextBox" runat="server" Height="68px" Text='<%# Bind("description") %>' TextMode="MultiLine" Width="233px" />
                                                    <b>picPath</b></td>
                                            </tr>
                                            <tr>
                                                <td><b>Titel</b></td>
                                                <td style="width: 148px">
                                                    <asp:TextBox ID="titelTextBox" runat="server" Text='<%# Bind("titel") %>' />
                                                </td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td><b>Author</b></td>
                                                <td style="width: 148px">
                                                    <asp:TextBox ID="authorTextBox" runat="server" Text='<%# Bind("author") %>' />
                                                </td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td><b>Buchnr</b></td>
                                                <td style="width: 148px">
                                                    <asp:TextBox ID="booknrTextBox" runat="server" Text='<%# Bind("booknr") %>' />
                                                </td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="height: 24px"><b>Standort</b></td>
                                                <td style="height: 24px; width: 148px;">
                                                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource3" DataTextField="Abteilung" DataValueField="id" SelectedValue='<%# Bind("Location") %>'>
                                                    </asp:DropDownList>
                                                </td>
                                                <td style="height: 24px"></td>
                                            </tr>
                                            <tr>
                                                <td style="height: 25px">
                                                    &nbsp;</td>
                                                <td style="width: 148px; height: 25px;">&nbsp;</td>
                                                <td style="height: 25px"></td>
                                                <td style="height: 25px"><b>
                                                    <asp:FileUpload ID="FileUpload1" runat="server" Height="21px" />
                                                </b></td>
                                            </tr>
                                            <tr>
                                                <td colspan="3">
                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("picPath") %>'></asp:TextBox>
                                                </td>
                                                <td><b>
                                                    <asp:Button ID="UploadButton" runat="server" OnClick="UploadButton_Click" Text="Upload" />
                                                    <asp:Label ID="StatusLabel" runat="server" Text="Label"></asp:Label>
                                                </b></td>
                                            </tr>
                                            <tr>
                                                <td><b>Seitenanzahl</b></td>
                                                <td style="width: 148px">
                                                    <asp:TextBox ID="nrOfPagesTextBox" runat="server" Text='<%# Bind("nrOfPages") %>' Width="35px" />
                                                </td>
                                                <td>&nbsp;</td>
                                                <td rowspan="5">
                                                    <asp:Image ID="Image3" runat="server" ImageUrl='<%# Bind("picPath")%>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="height: 24px"><b>Veröffentlichungsjahr</b></td>
                                                <td style="height: 24px; width: 148px;">
                                                    <asp:TextBox ID="yearpublishedTextBox" runat="server" Text='<%# Bind("yearpublished") %>' Width="35px" />
                                                </td>
                                                <td style="height: 24px"></td>
                                            </tr>
                                            <tr>
                                                <td style="height: 21px"><b>Herausgeber</b></td>
                                                <td style="height: 21px; width: 148px;">
                                                    <asp:TextBox ID="publisherTextBox" runat="server" Text='<%# Bind("publisher") %>' />
                                                    <br />
                                                    <br />
                                                </td>
                                                <td style="height: 21px"></td>
                                            </tr>
                                            <tr>
                                                <td style="height: 34px"><b>Kopien</b></td>
                                                <td style="height: 34px; width: 148px"><b>
                                                    <asp:TextBox ID="numberOfCopiesTextBox" runat="server" Text='<%# Bind("numberOfCopies") %>' Width="25px" />
                                                </b></td>
                                                <td style="height: 34px">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="height: 34px">
                                                    <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource2" DataTextField="name" DataValueField="id" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged" SelectedValue='<%# Bind("checkedOut") %>'>
                                                    </asp:DropDownList>
                                                </td>
                                                <td style="height: 34px; width: 148px"><b>
                                                    <asp:CheckBox ID="CBLent" runat="server" Checked='<%# Bind("lent") %>' Text="ausgeliehen" Visible="False" />
                                                </b></td>
                                                <td style="height: 34px"></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                            <br />
                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="False" CommandName="Update" Text="Aktualisieren" />
                            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Abbrechen" />
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <table class="nav-justified" border="0" style="border-width: 6px; border-color: #C0C0C0; background-color: #E1E3E1;">
                                <tr>
                                    <td><b>Titel</b></td>
                                    <td>
                                        <asp:TextBox ID="titelTextBox" runat="server" Text='<%# Bind("titel") %>' />
                                    </td>
                                    <td>&nbsp;</td>
                                    <td rowspan="4">
                                        <b>Beschreibung</b><asp:TextBox ID="descriptionTextBox" runat="server" Height="68px" Text='<%# Bind("description") %>' TextMode="MultiLine" Width="233px" />
                                        <b>BildURL</b></td>
                                </tr>
                                <tr>
                                    <td style="background-color: #99CCFF; border: thick outset #C0C0C0"><b>Author</b></td>
                                    <td>
                                        <asp:TextBox ID="authorTextBox" runat="server" Text='<%# Bind("author") %>' />
                                    </td>
                                    <td><b></b></td>
                                </tr>
                                <tr>
                                    <td><b>Buchnr</b></td>
                                    <td>
                                        <asp:TextBox ID="booknrTextBox" runat="server" Text='<%# Bind("booknr") %>' />
                                    </td>
                                    <td><b></b></td>
                                </tr>
                                <tr>
                                    <td style="height: 24px"><b>Standort</b></td>
                                    <td style="height: 24px">
                                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource3" DataTextField="Abteilung" DataValueField="id" SelectedValue='<%# Bind("Location") %>'>
                                        </asp:DropDownList>
                                    </td>
                                    <td style="height: 24px"></td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>
                                        <b>
                                            <asp:FileUpload ID="FileUpload1" runat="server" Height="21px" />
                                        </b>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3">&nbsp;</td>
                                    <td>
                                        <b>
                                            <asp:Button ID="UploadButton" runat="server" OnClick="UploadButton_Click" Text="Upload" />
                                        </b>
                                    </td>
                                </tr>
                                <tr>
                                    <td><b>Seitenanzahl</b></td>
                                    <td>
                                        <asp:TextBox ID="nrOfPagesTextBox" runat="server" Text='<%# Bind("nrOfPages") %>' Width="35px" />
                                    </td>
                                    <td>&nbsp;</td>
                                    <td>
                                        <asp:Label ID="StatusLabel" runat="server" Text="Label"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td><b>Veröffentlichungsjahr</b></td>
                                    <td>
                                        <asp:TextBox ID="yearpublishedTextBox" runat="server" Text='<%# Bind("yearpublished") %>' Width="35px" />
                                    </td>
                                    <td><b></b></td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="height: 28px"><b>Herausgeber</b></td>
                                    <td style="height: 28px">
                                        <asp:TextBox ID="publisherTextBox" runat="server" Text='<%# Bind("publisher") %>' />
                                        <br />
                                        <br />
                                    </td>
                                    <td style="height: 28px"><b></b></td>
                                    <td style="height: 28px"></td>
                                </tr>
                                <tr>
                                    <td><b>Kopien</b></td>
                                    <td>
                                        <b>
                                            <asp:TextBox ID="numberOfCopiesTextBox" runat="server" Text='<%# Bind("numberOfCopies") %>' Width="25px" />
                                        </b>
                                    </td>
                                    <td><b></b></td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td><b></b></td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("picPath") %>'></asp:TextBox>
                            <br />
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Einfügen" />
                            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Abbrechen" />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <table class="nav-justified">
                                <tr>
                                    <td>Titel</td>
                                    <td>
                                        <asp:TextBox ID="titelTextBox" runat="server" Text='<%# Bind("titel") %>' />
                                    </td>
                                    <td rowspan="11">
                                        <asp:Image ID="Image2" runat="server" ImageUrl='<%#  Bind("picPath") %>' Height="200px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>Author</td>
                                    <td>
                                        <asp:TextBox ID="authorTextBox" runat="server" Text='<%# Bind("author") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>Buchnr</td>
                                    <td>
                                        <asp:TextBox ID="booknrTextBox" runat="server" Text='<%# Bind("booknr") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>Standort</td>
                                    <td>
                                        <asp:TextBox ID="locationTextBox" runat="server" Text='<%# Bind("location") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>Beschreibung</td>
                                    <td>
                                        <asp:TextBox ID="descriptionTextBox" runat="server" Text='<%# Bind("description") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>Kopien</td>
                                    <td>
                                        <asp:TextBox ID="numberOfCopiesTextBox" runat="server" Text='<%# Bind("numberOfCopies") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>Seitenanzahl</td>
                                    <td>
                                        <asp:TextBox ID="nrOfPagesTextBox" runat="server" Text='<%# Bind("nrOfPages") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>Veröffentlichungsjahr</td>
                                    <td>
                                        <asp:TextBox ID="yearpublishedTextBox" runat="server" Text='<%# Bind("yearpublished") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>BildURL</td>
                                    <td>
                                        <asp:TextBox ID="picPathTextBox" runat="server" Text='<%# Bind("picPath") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>Herausgeber</td>
                                    <td>
                                        <asp:TextBox ID="publisherTextBox" runat="server" Text='<%# Bind("publisher") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>Ausleihe an:</td>
                                    <td>
                                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="name" DataValueField="id" SelectedValue='<%# Bind("CheckedOut") %>'>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Bearbeiten" />
                            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Löschen" />
                            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Neu" />
                        </ItemTemplate>
                    </asp:FormView>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
     
</asp:Content>


