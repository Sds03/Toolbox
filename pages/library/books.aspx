<%@ Page Title="" Language="VB" MasterPageFile="~/pages/Stamm/Stamm.master" AutoEventWireup="false" CodeFile="books.aspx.vb" Inherits="pages_library_books" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:toolboxConnectionString %>" DeleteCommand="DELETE FROM [Books] WHERE [Id] = @original_Id AND (([titel] = @original_titel) OR ([titel] IS NULL AND @original_titel IS NULL)) AND (([author] = @original_author) OR ([author] IS NULL AND @original_author IS NULL)) AND (([booknr] = @original_booknr) OR ([booknr] IS NULL AND @original_booknr IS NULL)) AND (([location] = @original_location) OR ([location] IS NULL AND @original_location IS NULL)) AND (([description] = @original_description) OR ([description] IS NULL AND @original_description IS NULL)) AND (([numberOfCopies] = @original_numberOfCopies) OR ([numberOfCopies] IS NULL AND @original_numberOfCopies IS NULL)) AND (([nrOfPages] = @original_nrOfPages) OR ([nrOfPages] IS NULL AND @original_nrOfPages IS NULL)) AND (([yearpublished] = @original_yearpublished) OR ([yearpublished] IS NULL AND @original_yearpublished IS NULL)) AND (([checkedOut] = @original_checkedOut) OR ([checkedOut] IS NULL AND @original_checkedOut IS NULL)) AND (([lent] = @original_lent) OR ([lent] IS NULL AND @original_lent IS NULL)) AND (([pictureURL] = @original_pictureURL) OR ([pictureURL] IS NULL AND @original_pictureURL IS NULL)) AND (([publisher] = @original_publisher) OR ([publisher] IS NULL AND @original_publisher IS NULL))" InsertCommand="INSERT INTO [Books] ([titel], [author], [booknr], [location], [description], [numberOfCopies], [nrOfPages], [yearpublished], [checkedOut], [lent], [pictureURL], [publisher]) VALUES (@titel, @author, @booknr, @location, @description, @numberOfCopies, @nrOfPages, @yearpublished, @checkedOut, @lent, @pictureURL, @publisher)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Books]" UpdateCommand="UPDATE [Books] SET [titel] = @titel, [author] = @author, [booknr] = @booknr, [location] = @location, [description] = @description, [numberOfCopies] = @numberOfCopies, [nrOfPages] = @nrOfPages, [yearpublished] = @yearpublished, [checkedOut] = @checkedOut, [lent] = @lent, [pictureURL] = @pictureURL, [publisher] = @publisher WHERE [Id] = @original_Id AND (([titel] = @original_titel) OR ([titel] IS NULL AND @original_titel IS NULL)) AND (([author] = @original_author) OR ([author] IS NULL AND @original_author IS NULL)) AND (([booknr] = @original_booknr) OR ([booknr] IS NULL AND @original_booknr IS NULL)) AND (([location] = @original_location) OR ([location] IS NULL AND @original_location IS NULL)) AND (([description] = @original_description) OR ([description] IS NULL AND @original_description IS NULL)) AND (([numberOfCopies] = @original_numberOfCopies) OR ([numberOfCopies] IS NULL AND @original_numberOfCopies IS NULL)) AND (([nrOfPages] = @original_nrOfPages) OR ([nrOfPages] IS NULL AND @original_nrOfPages IS NULL)) AND (([yearpublished] = @original_yearpublished) OR ([yearpublished] IS NULL AND @original_yearpublished IS NULL)) AND (([checkedOut] = @original_checkedOut) OR ([checkedOut] IS NULL AND @original_checkedOut IS NULL)) AND (([lent] = @original_lent) OR ([lent] IS NULL AND @original_lent IS NULL)) AND (([pictureURL] = @original_pictureURL) OR ([pictureURL] IS NULL AND @original_pictureURL IS NULL)) AND (([publisher] = @original_publisher) OR ([publisher] IS NULL AND @original_publisher IS NULL))">
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
            <asp:Parameter Name="original_checkedOut" Type="Int32" />
            <asp:Parameter Name="original_lent" Type="Boolean" />
            <asp:Parameter Name="original_pictureURL" Type="String" />
            <asp:Parameter Name="original_publisher" Type="String" />
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
            <asp:Parameter Name="checkedOut" Type="Int32" />
            <asp:Parameter Name="lent" Type="Boolean" />
            <asp:Parameter Name="pictureURL" Type="String" />
            <asp:Parameter Name="publisher" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="titel" Type="String" />
            <asp:Parameter Name="author" Type="String" />
            <asp:Parameter Name="booknr" Type="String" />
            <asp:Parameter Name="location" Type="Int32" />
            <asp:Parameter Name="description" Type="String" />
            <asp:Parameter Name="numberOfCopies" Type="Int32" />
            <asp:Parameter Name="nrOfPages" Type="Int32" />
            <asp:Parameter Name="yearpublished" Type="String" />
            <asp:Parameter Name="checkedOut" Type="Int32" />
            <asp:Parameter Name="lent" Type="Boolean" />
            <asp:Parameter Name="pictureURL" Type="String" />
            <asp:Parameter Name="publisher" Type="String" />
            <asp:Parameter Name="original_Id" Type="Int32" />
            <asp:Parameter Name="original_titel" Type="String" />
            <asp:Parameter Name="original_author" Type="String" />
            <asp:Parameter Name="original_booknr" Type="String" />
            <asp:Parameter Name="original_location" Type="Int32" />
            <asp:Parameter Name="original_description" Type="String" />
            <asp:Parameter Name="original_numberOfCopies" Type="Int32" />
            <asp:Parameter Name="original_nrOfPages" Type="Int32" />
            <asp:Parameter Name="original_yearpublished" Type="String" />
            <asp:Parameter Name="original_checkedOut" Type="Int32" />
            <asp:Parameter Name="original_lent" Type="Boolean" />
            <asp:Parameter Name="original_pictureURL" Type="String" />
            <asp:Parameter Name="original_publisher" Type="String" />
        </UpdateParameters>

    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:toolboxConnectionString %>" DeleteCommand="DELETE FROM [Books] WHERE [Id] = @original_Id AND (([titel] = @original_titel) OR ([titel] IS NULL AND @original_titel IS NULL)) AND (([author] = @original_author) OR ([author] IS NULL AND @original_author IS NULL)) AND (([booknr] = @original_booknr) OR ([booknr] IS NULL AND @original_booknr IS NULL)) AND (([location] = @original_location) OR ([location] IS NULL AND @original_location IS NULL)) AND (([description] = @original_description) OR ([description] IS NULL AND @original_description IS NULL)) AND (([numberOfCopies] = @original_numberOfCopies) OR ([numberOfCopies] IS NULL AND @original_numberOfCopies IS NULL)) AND (([nrOfPages] = @original_nrOfPages) OR ([nrOfPages] IS NULL AND @original_nrOfPages IS NULL)) AND (([yearpublished] = @original_yearpublished) OR ([yearpublished] IS NULL AND @original_yearpublished IS NULL)) AND (([checkedOut] = @original_checkedOut) OR ([checkedOut] IS NULL AND @original_checkedOut IS NULL)) AND (([lent] = @original_lent) OR ([lent] IS NULL AND @original_lent IS NULL)) AND (([pictureURL] = @original_pictureURL) OR ([pictureURL] IS NULL AND @original_pictureURL IS NULL)) AND (([publisher] = @original_publisher) OR ([publisher] IS NULL AND @original_publisher IS NULL))" InsertCommand="INSERT INTO [Books] ([titel], [author], [booknr], [location], [description], [numberOfCopies], [nrOfPages], [yearpublished], [checkedOut], [lent], [pictureURL], [publisher]) VALUES (@titel, @author, @booknr, @location, @description, @numberOfCopies, @nrOfPages, @yearpublished, @checkedOut, @lent, @pictureURL, @publisher)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT Books.Id, Books.titel, Books.author, Books.booknr, Books.location, Books.description, Books.numberOfCopies, Books.nrOfPages, Books.yearpublished, Books.checkedOut, Books.lent, Books.pictureURL, Books.publisher, Abteilungen.Abteilungsnummer, Abteilungen.Abteilung FROM Books INNER JOIN Abteilungen ON Books.location = Abteilungen.Abteilungsnummer WHERE (Books.Id = @Id)" UpdateCommand="UPDATE [Books] SET [titel] = @titel, [author] = @author, [booknr] = @booknr, [location] = @location, [description] = @description, [numberOfCopies] = @numberOfCopies, [nrOfPages] = @nrOfPages, [yearpublished] = @yearpublished, [checkedOut] = @checkedOut, [lent] = @lent, [pictureURL] = @pictureURL, [publisher] = @publisher WHERE [Id] = @original_Id">
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
            <asp:Parameter Name="original_checkedOut" Type="Int32" />
            <asp:Parameter Name="original_lent" Type="Boolean" />
            <asp:Parameter Name="original_pictureURL" Type="String" />
            <asp:Parameter Name="original_publisher" Type="String" />
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
            <asp:Parameter Name="checkedOut" Type="Int32" />
            <asp:Parameter Name="lent" Type="Boolean" />
            <asp:Parameter Name="pictureURL" Type="String" />
            <asp:Parameter Name="publisher" Type="String" />
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
            <asp:Parameter Name="checkedOut" Type="Int32" />
            <asp:Parameter Name="lent" Type="Boolean" />
            <asp:Parameter Name="pictureURL" Type="String" />
            <asp:Parameter Name="publisher" Type="String" />
            <asp:Parameter Name="original_Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:toolboxConnectionString %>" SelectCommand="SELECT * FROM [Abteilungen]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:toolboxConnectionString %>" SelectCommand="SELECT [name], [vname], [id] FROM [Personal]"></asp:SqlDataSource>
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <table style="width: 100%">
                <tr>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="Neu" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:CommandField ShowSelectButton="True" />
                                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                                <asp:BoundField DataField="titel" HeaderText="titel" SortExpression="titel" />
                                <asp:BoundField DataField="author" HeaderText="author" SortExpression="author" />
                                <asp:BoundField DataField="location" HeaderText="location" SortExpression="location" />
                                <asp:CheckBoxField DataField="lent" HeaderText="lent" SortExpression="lent" />
                            </Columns>
                            <EditRowStyle BackColor="#999999" />
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#CECECE" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#E9E7E2" />
                            <SortedAscendingHeaderStyle BackColor="#506C8C" />
                            <SortedDescendingCellStyle BackColor="#FFFDF8" />
                            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                        </asp:GridView>
                    </td>
                    <td>
                        <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource2" CellPadding="4" DataKeyNames="Id" ForeColor="#333333">
                           <EditItemTemplate>
                                  titel:
                        <asp:TextBox ID="titelTextBox" runat="server" Text='<%# Bind("titel") %>' />
                                <br />
                                author:
                        <asp:TextBox ID="authorTextBox" runat="server" Text='<%# Bind("author") %>' />
                                <br />
                                booknr:
                        <asp:TextBox ID="booknrTextBox" runat="server" Text='<%# Bind("booknr") %>' />
                                <br />
                                location:
                        <asp:TextBox ID="locationTextBox" runat="server" Text='<%# Bind("location") %>' />
                                <br />
                                description:
                        <asp:TextBox ID="descriptionTextBox" runat="server" Text='<%# Bind("description") %>' />
                                <br />
                                numberOfCopies:
                        <asp:TextBox ID="numberOfCopiesTextBox" runat="server" Text='<%# Bind("numberOfCopies") %>' />
                                <br />
                                nrOfPages:
                        <asp:TextBox ID="nrOfPagesTextBox" runat="server" Text='<%# Bind("nrOfPages") %>' />
                                <br />
                                yearpublished:
                        <asp:TextBox ID="yearpublishedTextBox" runat="server" Text='<%# Bind("yearpublished") %>' />
                                <br />
                                checkedOut:
                        <asp:TextBox ID="checkedOutTextBox" runat="server" Text='<%# Bind("checkedOut") %>' />
                                <br />
                                lent:
                        <asp:CheckBox ID="lentCheckBox" runat="server" Checked='<%# Bind("lent") %>' />
                                <br />
                                pictureURL:
                        <asp:TextBox ID="pictureURLTextBox" runat="server" Text='<%# Bind("pictureURL") %>' />
                                <br />
                                publisher:
                        <asp:TextBox ID="publisherTextBox" runat="server" Text='<%# Bind("publisher") %>' />
                          
                            <br />
                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Aktualisieren" />
                            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Abbrechen" />
                        </EditItemTemplate>
                        <EditRowStyle BackColor="#2461BF" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <InsertItemTemplate>
                                titel:
                        <asp:TextBox ID="titelTextBox" runat="server" Text='<%# Bind("titel") %>' />
                                <br />
                                author:
                        <asp:TextBox ID="authorTextBox" runat="server" Text='<%# Bind("author") %>' />
                                <br />
                                booknr:
                        <asp:TextBox ID="booknrTextBox" runat="server" Text='<%# Bind("booknr") %>' />
                                <br />
                                location:
                        <asp:TextBox ID="locationTextBox" runat="server" Text='<%# Bind("location") %>' />
                                <br />
                                description:
                        <asp:TextBox ID="descriptionTextBox" runat="server" Text='<%# Bind("description") %>' />
                                <br />
                                numberOfCopies:
                        <asp:TextBox ID="numberOfCopiesTextBox" runat="server" Text='<%# Bind("numberOfCopies") %>' />
                                <br />
                                nrOfPages:
                        <asp:TextBox ID="nrOfPagesTextBox" runat="server" Text='<%# Bind("nrOfPages") %>' />
                                <br />
                                yearpublished:
                        <asp:TextBox ID="yearpublishedTextBox" runat="server" Text='<%# Bind("yearpublished") %>' />
                                <br />
                                checkedOut:
                        <asp:TextBox ID="checkedOutTextBox" runat="server" Text='<%# Bind("checkedOut") %>' />
                                <br />
                                lent:
                        <asp:CheckBox ID="lentCheckBox" runat="server" Checked='<%# Bind("lent") %>' />
                                <br />
                                pictureURL:
                        <asp:TextBox ID="pictureURLTextBox" runat="server" Text='<%# Bind("pictureURL") %>' />
                                <br />
                                publisher:
                        <asp:TextBox ID="publisherTextBox" runat="server" Text='<%# Bind("publisher") %>' />
                                <br />
                                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Einfügen" />
                                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Abbrechen" />
                            </InsertItemTemplate>
                            <ItemTemplate>
                                Id:
                        <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                                <br />
                                titel:
                        <asp:Label ID="titelLabel" runat="server" Text='<%# Bind("titel") %>' />
                                <br />
                                author:
                        <asp:Label ID="authorLabel" runat="server" Text='<%# Bind("author") %>' />
                                <br />
                                booknr:
                        <asp:Label ID="booknrLabel" runat="server" Text='<%# Bind("booknr") %>' />
                                <br />
                                location:
                        <asp:Label ID="locationLabel" runat="server" Text='<%# Bind("location") %>' />
                                <br />
                                description:
                        <asp:Label ID="descriptionLabel" runat="server" Text='<%# Bind("description") %>' />
                                <br />
                                numberOfCopies:
                        <asp:Label ID="numberOfCopiesLabel" runat="server" Text='<%# Bind("numberOfCopies") %>' />
                                <br />
                                nrOfPages:
                        <asp:Label ID="nrOfPagesLabel" runat="server" Text='<%# Bind("nrOfPages") %>' />
                                <br />
                                yearpublished:
                        <asp:Label ID="yearpublishedLabel" runat="server" Text='<%# Bind("yearpublished") %>' />
                                <br />
                                checkedOut:
                        <asp:Label ID="checkedOutLabel" runat="server" Text='<%# Bind("checkedOut") %>' />
                                <br />
                                lent:
                        <asp:CheckBox ID="lentCheckBox" runat="server" Checked='<%# Bind("lent") %>' Enabled="false" />
                                <br />
                                pictureURL:
                        <asp:Label ID="pictureURLLabel" runat="server" Text='<%# Bind("pictureURL") %>' />
                                <br />
                                publisher:
                        <asp:Label ID="publisherLabel" runat="server" Text='<%# Bind("publisher") %>' />
                                <br />
                                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Bearbeiten" />
                                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Löschen" />
                                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Neu" />
                            </ItemTemplate>
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#EFF3FB" />
                        </asp:FormView>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

