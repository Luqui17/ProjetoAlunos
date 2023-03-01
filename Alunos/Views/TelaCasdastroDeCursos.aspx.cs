using Alunos.Service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Alunos.Views
{
    public partial class TelaCasdastroDeCursos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            botaoCadastrar.ServerClick += new EventHandler(this.CadastrarButton);
        }
        private void CadastrarButton(object sender, EventArgs e)
        {
            CadastrarCurso novoCurso = new CadastrarCurso(nomeCurso.Value,professor.Value);
            Page.Response.Redirect("CursosCadastrados.aspx");
        }
    }
}