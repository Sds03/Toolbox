<%@ Page Language="VB" AutoEventWireup="false" CodeFile="addUrlaub.aspx.vb" Inherits="addUrlaub" %>

<asp:Content r´´>
    <asp:UpdatePanel ID="UpdatePanelCreate" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <h2>Create Reservation</h2>

            <div>
                Name:<br />
                <asp:TextBox ID="TextBoxCreateName" runat="server"></asp:TextBox>
            </div>

            <div>
                Resource:
                <br />
                <asp:DropDownList ID="DropDownCreateResource" runat="server"></asp:DropDownList>
            </div>

            <div>
                Start:<br />
                <asp:TextBox ID="TextBoxCreateStart" runat="server"></asp:TextBox>
            </div>

            <div>
                End:<br />
                <asp:TextBox ID="TextBoxCreateEnd" runat="server"></asp:TextBox>
            </div>

            <asp:Button ID="ButtonCreateSave" runat="server" Text="Save" OnClick="ButtonCreateSave_Click" />
            <asp:LinkButton ID="ButtonCreateCancel" runat="server" Text="Cancel" OnClick="ButtonCreateCancel_Click" />
        </ContentTemplate>
    </asp:UpdatePanel>
    </asp:Content>