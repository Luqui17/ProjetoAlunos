using Alunos.Connection;
using Alunos.Models;
using MongoDB.Bson;
using MongoDB.Driver;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace Alunos.Views
{
    public partial class TelaInicial : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateGridview();
            }
        }
        void PopulateGridview()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("ID");
            dt.Columns.Add("Nome");
            dt.Columns.Add("CPF");
            dt.Columns.Add("Idade");
            var conexao = new Conexao();
            var listaAlunos = conexao.Student.Find(new BsonDocument()).ToList();
            foreach (var aluno in listaAlunos)
            {
                var row = dt.NewRow();

                row["ID"] = aluno.Id;
                row["Nome"] = aluno.Name;
                row["CPF"] = aluno.CPF;
                row["Idade"] = aluno.Age;
                dt.Rows.Add(row);
                gvAlunos.DataSource = dt;
                gvAlunos.DataBind();
            }
            if (dt.Rows.Count <= 0)
            {
                gvAlunos.Rows[0].Cells[0].Text = "Nenhum dado encontrado!";
            }
        }
        protected void AcessarAluno(object sender, EventArgs e)
        {
            Page.Response.Redirect("TelaCadastroAluno.apx");
        }
        protected void Button2_Click1(object sender, EventArgs e)
        {
            Page.Response.Redirect("TelaCadastroAluno.aspx");
        }
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvAlunos.EditIndex = e.NewEditIndex;
            PopulateGridview();
        }
        protected void gvAlunos_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvAlunos.EditIndex = -1;
            PopulateGridview();
        }
        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                var conexao = new Conexao();
                var construtor = Builders<Student>.Filter;
                var condicao = construtor.Eq(x => x.Id, (gvAlunos.Rows[e.RowIndex].FindControl("txtId") as System.Web.UI.WebControls.TextBox).Text.Trim());
                var contrutorAlteracao = Builders<Student>.Update;
                var condicaoAlteracao = contrutorAlteracao.Set(x => x.Name, (gvAlunos.Rows[e.RowIndex].FindControl("txtNome") as System.Web.UI.WebControls.TextBox).Text.Trim());
                conexao.Student.UpdateOne(condicao, condicaoAlteracao);

                var condicaoAlteracaoCPF = contrutorAlteracao.Set(x => x.CPF, (gvAlunos.Rows[e.RowIndex].FindControl("txtCPF") as System.Web.UI.WebControls.TextBox).Text.Trim());
                conexao.Student.UpdateOne(condicao, condicaoAlteracaoCPF);
                
                PopulateGridview();
                Page.Response.Redirect("TelaInicial.aspx");
            }
            catch (MongoAuthenticationException)
            {
                throw;
            }
            catch (System.FormatException)
            {
                MessageBox.Show("Não é possível alterar o ID");
                Page.Response.Redirect("TelaInicial.aspx");
                throw;
            }
        }
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            var conexao = new Conexao();
            var construtor = Builders<Student>.Filter;
            var condicao = construtor.Eq(x => x.Id, (gvAlunos.DataKeys[e.RowIndex].Value.ToString()));
            var contrutorAlteracao = Builders<Student>.Update;
            conexao.Student.DeleteOne(condicao);
            PopulateGridview();
            Page.Response.Redirect("TelaInicial.aspx");
        }

        protected void DetailsView1_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
        {

        }
    }
}