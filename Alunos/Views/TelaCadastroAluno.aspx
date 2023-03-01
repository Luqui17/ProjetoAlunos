<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TelaCadastroAluno.aspx.cs" Inherits="Alunos.Views.TelaCadastroAluno" %>


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
    <header>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand" href="#">Escola Sieg</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#conteudoNavbarSuportado"
                aria-controls="conteudoNavbarSuportado" aria-expanded="false" aria-label="Alterna navegação">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="conteudoNavbarSuportado">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="TelaCadastro.aspx">Cadastrar</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="WebForm1.aspx">Login</a>
                    </li>
                     <li class="nav-item">
                        <a class="nav-link" href="TelaInicial.aspx">Alunos Cadastrados</a>
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
                            <h1>Aluno</h1>
                            <form runat="server" method="post">
                                <div class="form-group" runat="server">
                                    <br />
                                    <label for="nome">Nome :</label>
                                    <input class="form-control" type="text" name="txbNome" id="nome"
                                        placeholder="Digite o seu nome..." runat="server" required />
                                </div>
                                <div class="form-group" runat="server">
                                    <br />
                                    <label for="age">Idade :</label>
                                    <input class="form-control" type="text" name="txbAge" id="age"
                                        placeholder="Insira a sua idade" runat="server" oninput="somenteNumeros(this);" required /><br />
                                </div>
                                <div class="form-group" runat="server">
                                    <label for="cpf">CPF :</label>
                                    <input class="form-control"  oninput="mascara(this)" type="text" name="txbCPF" id="cpf"
                                        placeholder="Digite o CPF" runat="server" required/>
                                    <br>
                                </div>
                                <div class="form-group text-center" runat="server">
                                    <br />
                                    <button onclick="AlunoButton" type="submit" class="btn btn-outline-primary"
                                        id="botaoAluno" name="BotaoAluno" runat="server">Cadastrar</button>
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
        <script>
            $(function () {
                $('.dropdown-toggle').dropdown();
            });
        </script>
             <script>
                    function mascara(i){
                            var v = i.value;
                    
                            if(isNaN(v[v.length-1])){ // impede entrar outro caractere que não seja número
                                i.value = v.substring(0, v.length-1);
                                return;
                            }
                    i.setAttribute("maxlength", "14");
                    if (v.length == 3 || v.length == 7) i.value += ".";
                    if (v.length == 11) i.value += "-";
                    }
                    function somenteNumeros(num) {

                       var er = /[^0-9.]/;
                       num.setAttribute("maxlength", "2");
                       er.lastIndex = 0;
                       var campo = num
                        if (er.test(campo.value)) {
                            campo.value = "";
                        }
                    }
                 function idade
             </script>
       </body>
 </html>