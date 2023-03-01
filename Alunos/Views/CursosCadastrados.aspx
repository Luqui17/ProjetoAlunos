<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CursosCadastrados.aspx.cs" Inherits="Alunos.Views.CursosCadastrados" %>

<!DOCTYPE html>
<script runat="server">
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Formulário de Cadastro</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css" />
    <link rel="stylesheet" href="../css/style.css" />
</head>
<form id="form1" runat="server">
    <header>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand" href="#">Escola Sieg</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#conteudoNavbarSuportado" aria-controls="conteudoNavbarSuportado" aria-expanded="false" aria-label="Alterna navegação">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="conteudoNavbarSuportado">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="TelaCadastro.aspx">Cadastrar <span class="sr-only">(página atual)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="WebForm1.aspx">Login</a>
                    </li>
                </ul>
            </div>
        </nav>
    </header>
    <body runat="server">
        <div class="d-md-flex justify-content-md-center" padding="2px" margin="2px">
            <asp:TextBox type="bi-search" ID="TextBox1" runat="server" Width="225px" class="form-control" aria-placeholder="Pesquisar"></asp:TextBox>
            <br />
        </div>
        <br />
        <asp:GridView ID="gvCursos" runat="server" AutoGenerateColumns="False" ShowFooter="True" class="table table-hover container"
            ShowHeaderWhenEmpty="True"
            OnRowEditing="GridView1_RowEditing" OnRowCancelingEdit="gvCursos_RowCancelingEdit" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1"
            OnRowUpdating="GridView1_RowUpdating" OnRowDeleting="GridView1_RowDeleting" DataKeyNames="Name"
            BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
            <%-- Theme Properties --%>
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:TemplateField HeaderText="Id">
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("Id") %>' runat="server" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtId" Text='<%# Eval("Id") %>' runat="server" />
                    </EditItemTemplate>
                    <ControlStyle ForeColor="Black" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Nome do Curso">
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("Name") %>' runat="server" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtNome" Text='<%# Eval("Name") %>' runat="server" />
                    </EditItemTemplate>
                    <ControlStyle ForeColor="Black" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Professor">
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("Professor") %>' runat="server" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtProfessor" Text='<%# Eval("Professor") %>' runat="server" />
                    </EditItemTemplate>
                    <ControlStyle ForeColor="Black" />
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:ImageButton ImageUrl="~/Icons/EditarIcon.png" runat="server" CommandName="Edit" ToolTip="Edit" Width="20px" Height="20px" />
                        <asp:ImageButton ImageUrl="~/Icons/Excluir icon.png" runat="server" CommandName="Delete" ToolTip="Delete" Width="20px" Height="20px" />
                        <asp:ImageButton ImageUrl="~/Icons/Excluir icon.png" runat="server" CommandName="Select" ToolTip="Select" Width="20px" Height="20px" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:ImageButton ImageUrl="~/Icons/icons8-salvar-30.png" runat="server" CommandName="Update" ToolTip="Update" Width="20px" Height="20px" />
                        <asp:ImageButton ImageUrl="~/Icons/icons8-excluir-48.png" runat="server" CommandName="Cancel" ToolTip="Cancel" Width="20px" Height="20px" />
                    </EditItemTemplate>
                    <ControlStyle ForeColor="Black" />
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
        <div class="container">
            <asp:Button ID="Button2" runat="server" Text="Cadastrar Curso" class="btn btn-success" OnClick="Button2_Click1" />
        </div>
        <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
            <ItemTemplate>
                <div>
                    <table class="table table-dark container">
                        <tr><th>Id <%# Eval("Id")%></th></tr>
                        <tr><td>Nome </td><td><%# Eval("Name")%></td></tr>
                        <tr><td>Idade </td><td><%# Eval("Age")%></td></tr>
                        <tr><td>CPF </td><td><%# Eval("CPF")%></td></tr>
                    </table>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </body>
    <script src="../js/bootstrap.min.js"></script>
</form>
</html>
