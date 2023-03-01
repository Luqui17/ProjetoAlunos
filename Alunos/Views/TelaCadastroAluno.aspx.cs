using Alunos.Service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Alunos.Views
{
    public partial class TelaCadastroAluno : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            botaoAluno.ServerClick += new EventHandler(this.AlunoButton);
        }
        private void AlunoButton(object sender, EventArgs e)
        {
            CadastrarAluno cadAluno = new CadastrarAluno(nome.Value, cpf.Value,age.Value);
        }
        private void VoltarButton(object sender, EventArgs e)
        {
            Page.Response.Redirect("TelaInicial.aspx");
        }
    }
}