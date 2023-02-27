<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TelaDeLogin.aspx.cs" Inherits="Alunos.Views.TelaDeLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Teste</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css" />
    <link rel="stylesheet" href="../css/style.css" />
</head>
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
    <div class="container">
        <div class="row">
            <div class="col-6 offset-md-3">
                <div class="card">
                    <div class="card-body">
                        <h1>Login</h1>
                        <form runat="server" method="post">
                            <div class="form-group" runat="server">
                                <br />
                                <label for="email">Email :</label>
                            </div>
                            <div class="form-group" runat="server">
                                <input class="form-control" type="email" name="txbEmail" id="email"
                                    placeholder="Digite o seu email..." runat="server" required /><br />
                                <label for="senha">Senha :</label>
                                <input class="form-control" type="password" name="txbSsenha" id="senha"
                                    placeholder="Digite a sua senha..." runat="server" required />
                            </div>
                            <div class="form-group text-center" runat="server">
                                <br />
                                <button onclick="CadastrarButton" type="submit" class="btn btn-outline-primary" id="botaoCadastrar" name="BotaoCadastrar" runat="server">Login</button>
                            </div>
                            <div class="alert alert-danger d-none">
                                Preencha o campo XXXX
                            </div>
                         </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.3.min.js"
        integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
    <script src="../js/bootstrap.min.js"></script>
</body>
</html>
