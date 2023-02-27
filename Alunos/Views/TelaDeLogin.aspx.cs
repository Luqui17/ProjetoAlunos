using Alunos.Service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace Alunos.Views
{
    public partial class TelaDeLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            botaoCadastrar.ServerClick += new EventHandler(this.CadastrarButton);
        }
        private void CadastrarButton(object sender, EventArgs e)
        {
            Autenticacao autenticacao = new Autenticacao();
            bool verificar = autenticacao.verificarLogin(email.Value,senha.Value);
            if (verificar == true)
            {
                Page.Response.Redirect("TelaInicial.aspx");
            }
            else
            {
                MessageBox.Show("Erro, acesso não autorizado");
            }
        }
    }
}