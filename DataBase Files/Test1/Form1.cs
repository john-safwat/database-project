using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;


namespace Test1
{
    public partial class Form1 : Form
    {
        SqlCommand cmd;
        SqlDataAdapter Adapt;
        SqlConnection Test = new SqlConnection("data source =. ; Intial Catalog = Car Rental Database ; Trusted_Connection = True; ");
        public Form1()
        {
            InitializeComponent();
        }
private void ClearData ()
        {
            textBox1.Text = "";
            textBox2.Text = "";
        }
        
        
        private void button1_Click(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {
            
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click_1(object sender, EventArgs e)
        {
            if (textBox1.Text != "" && textBox2.Text != "")
            {
                cmd = new SqlCommand("insert into Car values ('" + textBox1.Text + " , " + textBox2.Text + "')", Test );
                Test.Open();
                cmd.ExecuteNonQuery();
                Test.Close();
                MessageBox.Show("Input Complete");
                DisplayData();
                ClearData();


                    
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            if (textBox1.Text != "" && textBox2.Text != "")
            {
                cmd = new SqlCommand("Update into Car set CarModel =  '" + textBox1.Text + "' , Where CarID = " + textBox2.Text + "'", Test);
                Test.Open();
                cmd.ExecuteNonQuery();
                Test.Close();
                MessageBox.Show("Update Completed");
                DisplayData();
                ClearData();

            }
        }

        private void DisplayData()
        {
            
            Test.Open();
            DataTable dt = new DataTable();
            Adapt = new SqlDataAdapter("Select * From Cars", Test);
            Adapt.Fill(dt);
            dataGridView1.DataSource = dt;
            Test.Close();

        }



        private void button2_Click(object sender, EventArgs e)
        {
            if (textBox1.Text != "" )
            {
                cmd = new SqlCommand("Delete Car Where CarId = '"+textBox1.Text+"'",Test);
                Test.Open();
                cmd.ExecuteNonQuery();
                Test.Close();
                MessageBox.Show("Delete Completed");
                DisplayData();
                ClearData();
                                                                

            }
        }
    }
}
