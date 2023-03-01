<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TelaInicial.aspx.cs" Inherits="Alunos.Views.TelaInicial" %>

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
        <div class="d-md-flex justify-content-md-center" padding = "2px" margin = "2px">
            <asp:TextBox type="bi-search" ID="TextBox1" runat="server" Width="225px" class="form-control" aria-placeholder="Pesquisar"></asp:TextBox>
            <br />
        </div>
            <br />
           <asp:GridView ID="gvAlunos" runat="server" AutoGenerateColumns="False" ShowFooter="True" class="table table-hover container"
                ShowHeaderWhenEmpty="True"

                OnRowEditing="GridView1_RowEditing" OnRowCancelingEdit="gvAlunos_RowCancelingEdit"
                OnRowUpdating="GridView1_RowUpdating" OnRowDeleting="GridView1_RowDeleting" DataKeyNames="ID"

                BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
                <%-- Theme Properties --%>
                <AlternatingRowStyle BackColor="#CCCCCC" />
                <Columns>
                     <asp:TemplateField HeaderText="Id">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("ID") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtId" Text='<%# Eval("ID") %>' runat="server" />
                        </EditItemTemplate>
                        <ControlStyle ForeColor="Black" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Nome">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("Nome") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtNome" Text='<%# Eval("Nome") %>' runat="server" />
                        </EditItemTemplate>
                        <ControlStyle ForeColor="Black" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Idade">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("Idade") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtDataNascimento" Text='<%# Eval("Idade") %>' runat="server" />
                        </EditItemTemplate>
                        <ControlStyle ForeColor="Black" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="CPF">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("CPF") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtCPF" Text='<%# Eval("CPF") %>' runat="server" />
                        </EditItemTemplate>
                        <ControlStyle ForeColor="Black" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:ImageButton ImageUrl="~/Icons/EditarIcon.png" runat="server" CommandName="Edit" ToolTip="Edit" Width="20px" Height="20px"/>
                            <asp:ImageButton ImageUrl="~/Icons/Excluir icon.png" runat="server" CommandName="Delete" ToolTip="Delete" Width="20px" Height="20px"/>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:ImageButton ImageUrl="~/Icons/icons8-salvar-30.png" runat="server" CommandName="Update" ToolTip="Update" Width="20px" Height="20px"/>
                            <asp:ImageButton ImageUrl="~/Icons/icons8-excluir-48.png" runat="server" CommandName="Cancel" ToolTip="Cancel" Width="20px" Height="20px"/>
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
            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataSourceID="AlunosDB" Height="50px" OnPageIndexChanging="DetailsView1_PageIndexChanging" Width="864px">
            <Fields>
                <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" SortExpression="Name" />
                <asp:BoundField DataField="TeacherName" HeaderText="TeacherName" ReadOnly="True" SortExpression="TeacherName" />
            </Fields>
        </asp:DetailsView>
        <asp:LinqDataSource ID="AlunosDB" runat="server" ContextTypeName="Alunos.Models.Student" EntityTypeName="" Select="new (Id, Name, TeacherName)" TableName="Courses" Where="Id == @Id">
            <WhereParameters>
                <asp:ControlParameter ControlID="gvAlunos" Name="Id" PropertyName="SelectedValue" Type="String" />
            </WhereParameters>
        </asp:LinqDataSource>
        <div class="container">
           <asp:Button ID="Button2" runat="server" Text="Cadastrar Aluno" class="btn btn-success" OnClick="Button2_Click1"/>
        </div>
    </body>
    <script src="../js/bootstrap.min.js"></script>    
</form>
</html>
