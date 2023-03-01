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
    public partial class CursosCadastrados : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateGridview();
                DataTable dt = new DataTable();
                dt.Columns.Add("Id");
                dt.Columns.Add("Name");
                dt.Columns.Add("Age");
                dt.Columns.Add("CPF");
                var conexaoTeste = new Conexao();
                //var construtor = Builders<Student>.Filter;
                //var condicao = construtor.Eq(x => x.Name, "Lucas Gabriel");
                var listaDeAlunos = conexaoTeste.Student.Find(new BsonDocument()).ToList();
                foreach (var aluno in listaDeAlunos)
                {
                    var row = dt.NewRow();
                    row["Id"] = aluno.Id;
                    row["Name"] = aluno.Name;
                    row["Age"] = aluno.Age;
                    row["CPF"] = aluno.CPF;
                    dt.Rows.Add(row);
                    Repeater1.DataSource = dt;
                    Repeater1.DataBind();
                }
            }
        }
        void PopulateGridview()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("Id");
            dt.Columns.Add("Name");
            dt.Columns.Add("Professor");

            var conexao = new Conexao();
            var listaDeCursos = conexao.Courses.Find(new BsonDocument()).ToList();
            foreach (var curso in listaDeCursos)
            {
                var row = dt.NewRow();
                row["Id"] = curso.Id;
                row["Name"] = curso.Name;
                row["Professor"] = curso.TeacherName;
                dt.Rows.Add(row);
                gvCursos.DataSource = dt;
                gvCursos.DataBind();
            }
            if (dt.Rows.Count <= 0)
            {
                gvCursos.Rows[0].Cells[0].Text = "Nenhum dado encontrado!";
            }
        }
        protected void AcessarAluno(object sender, EventArgs e)
        {
            Page.Response.Redirect("TelaCasdastroDeCursos.aspx");
        }
        protected void Button2_Click1(object sender, EventArgs e)
        {
            Page.Response.Redirect("TelaCasdastroDeCursos.aspx");
        }
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvCursos.EditIndex = e.NewEditIndex;
            PopulateGridview();
            
           
        }
        protected void gvCursos_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvCursos.EditIndex = -1;
            PopulateGridview();

            
        }
        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                var conexao = new Conexao();
                var construtor = Builders<Course>.Filter;
                var condicao = construtor.Eq(x => x.Name, (gvCursos.Rows[e.RowIndex].FindControl("txtNome") as System.Web.UI.WebControls.TextBox).Text.Trim());
                var contrutorAlteracao = Builders<Course>.Update;

                var condicaoAlteracao = contrutorAlteracao.Set(x => x.Name, (gvCursos.Rows[e.RowIndex].FindControl("txtNome") as System.Web.UI.WebControls.TextBox).Text.Trim());
                conexao.Courses.UpdateOne(condicao, condicaoAlteracao);

                var condicaoAlteracaoCPF = contrutorAlteracao.Set(x => x.TeacherName, (gvCursos.Rows[e.RowIndex].FindControl("txtProfessor") as System.Web.UI.WebControls.TextBox).Text.Trim());
                conexao.Courses.UpdateOne(condicao, condicaoAlteracaoCPF);

                PopulateGridview();
                Page.Response.Redirect("CursosCadastrados.aspx");
            }
            catch (MongoAuthenticationException)
            {
                throw;
            }
            catch (System.FormatException)
            {
                MessageBox.Show("Não é possível alterar o ID");
                Page.Response.Redirect("CursosCadastrados.aspx");
                throw;
            }
        }
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            var conexao = new Conexao();
            var construtor = Builders<Course>.Filter;
            var condicao = construtor.Eq(x => x.Name, (gvCursos.DataKeys[e.RowIndex].Value.ToString()));
            var contrutorAlteracao = Builders<Student>.Update;
            conexao.Courses.DeleteOne(condicao);
            PopulateGridview();
            Page.Response.Redirect("CursosCadastrados.aspx");

        }
        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {
            
        }
        protected void gvCursos_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            
        }
    }
}