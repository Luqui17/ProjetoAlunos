using Alunos.Connection;
using MongoDB.Bson;
using MongoDB.Driver;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
            DataTable dtbl = new DataTable();
            var conexao = new Conexao();
            var listaLivros =  conexao.Alunos.Find(condicao).ToListAsync();
            foreach (var doc in listaLivros)
            {
                Console.WriteLine(doc.ToJson<Livro>());

            }
            Console.WriteLine("Fim da Lista");


            if (dtbl.Rows.Count > 0)
            {
                gvAlunos.DataSource = dtbl;
                gvAlunos.DataBind();
            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                gvAlunos.DataSource = dtbl;
                gvAlunos.DataBind();
                gvAlunos.Rows[0].Cells.Clear();
                gvAlunos.Rows[0].Cells.Add(new TableCell());
                gvAlunos.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                gvAlunos.Rows[0].Cells[0].Text = "Nenhum dado encontrado!";
                // gvAlunos.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }
        }
}