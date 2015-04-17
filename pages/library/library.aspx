<%@ Page Title="" Language="VB" MasterPageFile="~/pages/Stamm/Stamm.master" AutoEventWireup="false" CodeFile="library.aspx.vb" Inherits="pages_library_library" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:Panel runat="server" CssClass="PersoDataPopup" Height="600" Width="890" ScrollBars="Vertical" >
        <asp:Label ID="Label1" runat="server" Font-Size="X-Large" Text="HPK Medizinische Bibliothek"></asp:Label>
        <br />
        <br />
        <br />
        <asp:TextBox runat="server"></asp:TextBox><asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Suche" />
        <asp:Button ID="Button2" runat="server" Text="Alle" />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Neu" />
        <table class="nav-justified">
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:toolboxConnectionString %>" DeleteCommand="DELETE FROM [Books] WHERE [Id] = @original_Id AND (([titel] = @original_titel) OR ([titel] IS NULL AND @original_titel IS NULL)) AND (([author] = @original_author) OR ([author] IS NULL AND @original_author IS NULL)) AND (([booknr] = @original_booknr) OR ([booknr] IS NULL AND @original_booknr IS NULL)) AND (([location] = @original_location) OR ([location] IS NULL AND @original_location IS NULL)) AND (([description] = @original_description) OR ([description] IS NULL AND @original_description IS NULL)) AND (([numberOfCopies] = @original_numberOfCopies) OR ([numberOfCopies] IS NULL AND @original_numberOfCopies IS NULL)) AND (([nrOfPages] = @original_nrOfPages) OR ([nrOfPages] IS NULL AND @original_nrOfPages IS NULL)) AND (([yearpublished] = @original_yearpublished) OR ([yearpublished] IS NULL AND @original_yearpublished IS NULL)) AND (([pictureURL] = @original_pictureURL) OR ([pictureURL] IS NULL AND @original_pictureURL IS NULL)) AND (([publisher] = @original_publisher) OR ([publisher] IS NULL AND @original_publisher IS NULL))" InsertCommand="INSERT INTO [Books] ([titel], [author], [booknr], [location], [description], [numberOfCopies], [nrOfPages], [yearpublished], [pictureURL], [publisher]) VALUES (@titel, @author, @booknr, @location, @description, @numberOfCopies, @nrOfPages, @yearpublished, @pictureURL, @publisher)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Books]" UpdateCommand="UPDATE [Books] SET [titel] = @titel, [author] = @author, [booknr] = @booknr, [location] = @location, [description] = @description, [numberOfCopies] = @numberOfCopies, [nrOfPages] = @nrOfPages, [yearpublished] = @yearpublished, [pictureURL] = @pictureURL, [publisher] = @publisher WHERE [Id] = @original_Id AND (([titel] = @original_titel) OR ([titel] IS NULL AND @original_titel IS NULL)) AND (([author] = @original_author) OR ([author] IS NULL AND @original_author IS NULL)) AND (([booknr] = @original_booknr) OR ([booknr] IS NULL AND @original_booknr IS NULL)) AND (([location] = @original_location) OR ([location] IS NULL AND @original_location IS NULL)) AND (([description] = @original_description) OR ([description] IS NULL AND @original_description IS NULL)) AND (([numberOfCopies] = @original_numberOfCopies) OR ([numberOfCopies] IS NULL AND @original_numberOfCopies IS NULL)) AND (([nrOfPages] = @original_nrOfPages) OR ([nrOfPages] IS NULL AND @original_nrOfPages IS NULL)) AND (([yearpublished] = @original_yearpublished) OR ([yearpublished] IS NULL AND @original_yearpublished IS NULL)) AND (([pictureURL] = @original_pictureURL) OR ([pictureURL] IS NULL AND @original_pictureURL IS NULL)) AND (([publisher] = @original_publisher) OR ([publisher] IS NULL AND @original_publisher IS NULL))">
                        <DeleteParameters>
                            <asp:Parameter Name="original_Id" Type="Int32" />
                            <asp:Parameter Name="original_titel" Type="String" />
                            <asp:Parameter Name="original_author" Type="Object" />
                            <asp:Parameter Name="original_booknr" Type="String" />
                            <asp:Parameter Name="original_location" Type="Int32" />
                            <asp:Parameter Name="original_description" Type="String" />
                            <asp:Parameter Name="original_numberOfCopies" Type="Int32" />
                            <asp:Parameter Name="original_nrOfPages" Type="Int32" />
                            <asp:Parameter Name="original_yearpublished" Type="String" />
                            <asp:Parameter Name="original_pictureURL" Type="String" />
                            <asp:Parameter Name="original_publisher" Type="String" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="titel" Type="String" />
                            <asp:Parameter Name="author" Type="Object" />
                            <asp:Parameter Name="booknr" Type="String" />
                            <asp:Parameter Name="location" Type="Int32" />
                            <asp:Parameter Name="description" Type="String" />
                            <asp:Parameter Name="numberOfCopies" Type="Int32" />
                            <asp:Parameter Name="nrOfPages" Type="Int32" />
                            <asp:Parameter Name="yearpublished" Type="String" />
                            <asp:Parameter Name="pictureURL" Type="String" />
                            <asp:Parameter Name="publisher" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="titel" Type="String" />
                            <asp:Parameter Name="author" Type="Object" />
                            <asp:Parameter Name="booknr" Type="String" />
                            <asp:Parameter Name="location" Type="Int32" />
                            <asp:Parameter Name="description" Type="String" />
                            <asp:Parameter Name="numberOfCopies" Type="Int32" />
                            <asp:Parameter Name="nrOfPages" Type="Int32" />
                            <asp:Parameter Name="yearpublished" Type="String" />
                            <asp:Parameter Name="pictureURL" Type="String" />
                            <asp:Parameter Name="publisher" Type="String" />
                            <asp:Parameter Name="original_Id" Type="Int32" />
                            <asp:Parameter Name="original_titel" Type="String" />
                            <asp:Parameter Name="original_author" Type="Object" />
                            <asp:Parameter Name="original_booknr" Type="String" />
                            <asp:Parameter Name="original_location" Type="Int32" />
                            <asp:Parameter Name="original_description" Type="String" />
                            <asp:Parameter Name="original_numberOfCopies" Type="Int32" />
                            <asp:Parameter Name="original_nrOfPages" Type="Int32" />
                            <asp:Parameter Name="original_yearpublished" Type="String" />
                            <asp:Parameter Name="original_pictureURL" Type="String" />
                            <asp:Parameter Name="original_publisher" Type="String" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:toolboxConnectionString %>" SelectCommand="SELECT * FROM [Personal]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>&nbsp;<asp:GridView ID="GridView1" runat="server">
                    </asp:GridView>
                </td>
                <td>&nbsp;
                    <asp:FormView ID="FormView1" runat="server" DataKeyNames="Id" DataSourceID="SqlDataSource1">
                        <EditItemTemplate>
                            I<table class="nav-justified">
                                <tr>
                                    <td>Titel</td>
                                    <td>
                                        <asp:TextBox ID="titelTextBox" runat="server" Text='<%# Bind("titel") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>Author</td>
                                    <td>
                                        <asp:TextBox ID="authorTextBox" runat="server" Text='<%# Bind("author") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>Booknr</td>
                                    <td>
                                        <asp:TextBox ID="booknrTextBox" runat="server" Text='<%# Bind("booknr") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>Location</td>
                                    <td>
                                        <asp:TextBox ID="locationTextBox" runat="server" Text='<%# Bind("location") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>Description</td>
                                    <td>
                                        <asp:TextBox ID="descriptionTextBox" runat="server" Text='<%# Bind("description") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>NumberOfCopies</td>
                                    <td>
                                        <asp:TextBox ID="numberOfCopiesTextBox" runat="server" Text='<%# Bind("numberOfCopies") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>NrOfPages</td>
                                    <td>
                                        <asp:TextBox ID="nrOfPagesTextBox" runat="server" Text='<%# Bind("nrOfPages") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>Year published</td>
                                    <td>
                                        <asp:TextBox ID="yearpublishedTextBox" runat="server" Text='<%# Bind("yearpublished") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>PictureURL</td>
                                    <td>
                                        <asp:TextBox ID="pictureURLTextBox" runat="server" Text='<%# Bind("pictureURL") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>Publisher</td>
                                    <td>
                                        <asp:TextBox ID="publisherTextBox" runat="server" Text='<%# Bind("publisher") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>Checked Out</td>
                                    <td>
                                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="name" DataValueField="id" SelectedValue='<%# Bind("CheckedOut") %>'>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Aktualisieren" />
&nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Abbrechen" />
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <table class="nav-justified">
                                <tr>
                                    <td>Titel</td>
                                    <td>
                                        <asp:TextBox ID="titelTextBox" runat="server" Text='<%# Bind("titel") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="background-color: #99CCFF; border: thick outset #C0C0C0">Author</td>
                                    <td>
                                        <asp:TextBox ID="authorTextBox" runat="server" Text='<%# Bind("author") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>Booknr</td>
                                    <td>
                                        <asp:TextBox ID="booknrTextBox" runat="server" Text='<%# Bind("booknr") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>Location</td>
                                    <td>
                                        <asp:TextBox ID="locationTextBox" runat="server" Text='<%# Bind("location") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>Description</td>
                                    <td>
                                        <asp:TextBox ID="descriptionTextBox" runat="server" Text='<%# Bind("description") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>NumberOfCopies</td>
                                    <td>
                                        <asp:TextBox ID="numberOfCopiesTextBox" runat="server" Text='<%# Bind("numberOfCopies") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>NrOfPages</td>
                                    <td>
                                        <asp:TextBox ID="nrOfPagesTextBox" runat="server" Text='<%# Bind("nrOfPages") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>Year published</td>
                                    <td>
                                        <asp:TextBox ID="yearpublishedTextBox" runat="server" Text='<%# Bind("yearpublished") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>PictureURL</td>
                                    <td>
                                        <asp:FileUpload ID="FileUpload1" runat="server" Enabled='<%# Bind("pictureURL") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>Publisher</td>
                                    <td>
                                        <asp:TextBox ID="publisherTextBox" runat="server" Text='<%# Bind("publisher") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>Checked Out</td>
                                    <td>
                                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="name" DataValueField="id" SelectedValue='<%# Bind("CheckedOut") %>'>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                            </table>
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
                                        <asp:Image ID="Image2" runat="server" Height="200px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>Author</td>
                                    <td>
                                        <asp:TextBox ID="authorTextBox" runat="server" Text='<%# Bind("author") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>Booknr</td>
                                    <td>
                                        <asp:TextBox ID="booknrTextBox" runat="server" Text='<%# Bind("booknr") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>Location</td>
                                    <td>
                                        <asp:TextBox ID="locationTextBox" runat="server" Text='<%# Bind("location") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>Description</td>
                                    <td>
                                        <asp:TextBox ID="descriptionTextBox" runat="server" Text='<%# Bind("description") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>NumberOfCopies</td>
                                    <td>
                                        <asp:TextBox ID="numberOfCopiesTextBox" runat="server" Text='<%# Bind("numberOfCopies") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>NrOfPages</td>
                                    <td>
                                        <asp:TextBox ID="nrOfPagesTextBox" runat="server" Text='<%# Bind("nrOfPages") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>Year published</td>
                                    <td>
                                        <asp:TextBox ID="yearpublishedTextBox" runat="server" Text='<%# Bind("yearpublished") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>PictureURL</td>
                                    <td>
                                        <asp:TextBox ID="pictureURLTextBox" runat="server" Text='<%# Bind("pictureURL") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>Publisher</td>
                                    <td>
                                        <asp:TextBox ID="publisherTextBox" runat="server" Text='<%# Bind("publisher") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>Checked Out</td>
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


