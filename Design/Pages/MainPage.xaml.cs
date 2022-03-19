using Design.Classes;
using Design.UserControls;
using IronPython.Hosting;
using Microsoft.Scripting.Hosting;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using Excel = Microsoft.Office.Interop.Excel;

namespace Design.Pages
{
    /// <summary>
    /// Interaction logic for MainPage.xaml
    /// </summary>
    public partial class MainPage : Page
    {
        private ListViewItem draggedItem;
        private List<int> properties = new List<int>();
        private List<string> lines;
        public MainPage()
        {
            InitializeComponent();
            DataObject.AddPastingHandler(TboxPriceDown, NoPaste);
            DataObject.AddPastingHandler(TboxPriceUp, NoPaste);
            DataObject.AddPastingHandler(TBoxSearch, NoPaste);/*
            SearchTabControl.Items.Add(TabBuilder.CreateTab("ёоу я хедер 1", new List<Supplier>() { new Supplier() { company = "ёоу я компания"} }, TabHeader_CloseButtonClicked));
            SearchTabControl.Items.Add(TabBuilder.CreateTab("ёоу я хедер 2", new List<Supplier>() { new Supplier() { company = "ёоу я компания" } }, TabHeader_CloseButtonClicked));
            */
        }

        private void PropertyElement_Drop(object sender, DragEventArgs e)
        {
            var lvitem = (sender as ListViewItem);
            var index = LViewProperties.Items.IndexOf(lvitem);
            LViewProperties.Items.Remove(draggedItem);
            LViewProperties.Items.Insert(index, draggedItem);

        }

        private void PropertyElement_MouseDown(object sender, MouseButtonEventArgs e)
        {
            try
            {
                draggedItem = (sender as ListViewItem);
                var grid = draggedItem.Content as Grid;
                var text = (grid.Children[grid.Children.Count - 1] as TextBlock).Text;
                DragDrop.DoDragDrop(grid, text, DragDropEffects.Move);
            }
            catch { }
        }


        private async void TBoxSearch_KeyDown(object sender, KeyEventArgs e)
        {
            if(e.Key == Key.Enter)
            {
                if (!string.IsNullOrWhiteSpace(TBoxSearch.Text))
                {
                    (Application.Current.MainWindow as MainWindow).TBoxState.Text = "Busy";
                    await Task.Delay(1);
                    SearchTabControl.Items.Add(TabBuilder.CreateTab(TBoxSearch.Text, Parse(), TabHeader_CloseButtonClicked));
                    (Application.Current.MainWindow as MainWindow).TBoxState.Text = "Ready";
                }

            }
        }

        private void TabHeader_CloseButtonClicked(object sender, EventArgs e)
        {
            SearchTabControl.Items.Remove(sender as TabItem);
        }

        private List<Supplier> Parse()
        {
            string text = TBoxSearch.Text.Replace(" ", "+");

            ScriptEngine engine = Python.CreateEngine();
            ScriptScope scope = engine.CreateScope();
            ICollection<string> searchPaths = engine.GetSearchPaths();
            searchPaths.Add("Python34\\Lib");
            searchPaths.Add("venv\\Lib");
            searchPaths.Add("venv\\Lib\\site-packages");
            engine.SetSearchPaths(searchPaths);
            engine.ExecuteFile("main.py", scope);
            dynamic square = scope.GetVariable("main");
            // вызываем функцию и получаем результат
            dynamic result = square(text);



            properties.Clear();
            var lvItems = LViewProperties.Items;
            for (int i = 0; i < lvItems.Count; i++)
            {
                ListViewItem item = lvItems[i] as ListViewItem;
                var elements = (item.Content as Grid).Children;
                var id = int.Parse((elements[elements.Count - 1] as TextBlock).Text);
                properties.Add(id);
            }

            List<Supplier> list = new List<Supplier>();
            var companies = File.ReadAllText("company.json");
            list = JsonConvert.DeserializeObject<List<Supplier>>(companies);


            list = list.OrderBy(p => p.GetType().GetProperty(GetPropByID(properties[0])).GetValue(p)).
                ThenBy(p => p.GetType().GetProperty(GetPropByID(properties[1])).GetValue(p))
                .ThenBy(p => p.GetType().GetProperty(GetPropByID(properties[2])).GetValue(p))
                .ThenBy(p => p.GetType().GetProperty(GetPropByID(properties[3])).GetValue(p))
                .ThenBy(p => p.GetType().GetProperty(GetPropByID(properties[4])).GetValue(p))
                .ThenBy(p => p.GetType().GetProperty(GetPropByID(properties[5])).GetValue(p)).ThenBy(p => p.GetType().GetProperty(GetPropByID(properties[6])).GetValue(p)).ToList();
            try
            {
                if (!string.IsNullOrWhiteSpace(TboxPriceUp.Text))
                    list = list.Where(x => x.price.HasValue ? (x.price.Value >= Convert.ToSingle(TboxPriceUp.Text)) : true).ToList();
                if (!string.IsNullOrWhiteSpace(TboxPriceDown.Text))
                    list = list.Where(x => x.price.HasValue ? x.price.Value <= Convert.ToSingle(TboxPriceDown.Text) : true).ToList();
            }
            catch (Exception)
            {
                MessageBox.Show("Произошла ошибка: Неправильное заполнение полей!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }


            return list;
        }

        private string GetPropByID(int id)
        {
            switch (id)
            {
                case 0:
                    return "price";
                case 1:
                    return "register_date";
                case 2:
                    return "rating";
                case 3:
                    return "fin_info";
                case 4:
                    return "advantages_count";
                case 5:
                    return "disadvantages_count";
                case 6:
                    return "tenders_count";
                default:
                    break;
            }
            return "";
        }

        private void NoPaste(object sender, DataObjectPastingEventArgs e)
        {
            e.CancelCommand();
        }
        private List<string> GetSuppliersExcel(string path)
        {
            List<string> lines = new List<string>();

            Excel.Application ObjWorkExcel = new Excel.Application();
            Excel.Workbook ObjWorkBook = ObjWorkExcel.Workbooks.Open(path);
            Excel.Worksheet ObjworkSheet = (Excel.Worksheet)ObjWorkBook.Sheets[1];
            var lastCell = ObjworkSheet.Cells.SpecialCells(Excel.XlCellType.xlCellTypeLastCell);
            int lastColumn = (int)lastCell.Column;
            int lastRow = (int)lastCell.Row;
            for (int i = 1; i < lastRow - 1; i++)
            {
                string line = ObjworkSheet.Cells[i + 1, lastColumn - 1].Text.ToString();
                lines.Add(line.Substring(1));
            }
            ObjWorkExcel.Quit();
            GC.Collect();
            return lines;
        }

        private int Count = 0;
        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            if (Count < lines.Count)
            {
                TBoxSearch.Text = lines[Count];
                Count++;
            }
            else
            {
                var btn = sender as Button;
                btn.IsEnabled = false;
            }
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            GetStandart(TBoxSearch.Text);
        }

        private string GetStandart(string str)
        {
            string value = "ГОСТ";
            bool flag = true;
            int index = str.ToLower().IndexOf("гост");
            index += 5;
            while (true)
            {
                if (index >= str.Length)
                    break;
                if (int.TryParse(str[index].ToString(), out int t))
                {
                    value += str[index];
                    flag = true;
                }
                else if(flag == true)
                {
                    flag = false;
                    value += str[index];
                }
                else
                {
                    value = value.Remove(value.Length - 1);
                    break;
                }
                index++;
            }
            return value;
        }

        private void BtnExport_Click(object sender, RoutedEventArgs e)
        {
            Excel.Application app = new Excel.Application();
            Excel.Workbook workbook = app.Workbooks.Add();
            foreach (TabItem item in SearchTabControl.Items)
            {
                Excel.Worksheet sheet = workbook.Worksheets.Add(Type.Missing);
                sheet.Name = ((item.Header as SearchTab).DataContext as SearchRequest).RequestText;
                sheet.Cells[1, 1] = "Компания";
                sheet.Cells[1, 2] = "Рейтинг";
                sheet.Cells[1, 3] = "ИНН";
                sheet.Cells[1, 4] = "ОГРН";
                sheet.Cells[1, 5] = "ОКПО";
                sheet.Cells[1, 6] = "Дата регистрации";
                sheet.Cells[1, 7] = "Финансовая информация";
                sheet.Cells[1, 8] = "Количество";
                sheet.Cells[1, 9] = "Цена";
                sheet.Cells[1, 10] = "Дата публикации";
                sheet.Cells[1, 11] = "Достоинства";
                sheet.Cells[1, 12] = "Недостатки";
                sheet.Cells[1, 13] = "Телефон";
                sheet.Cells[1, 14] = "Адрес";
                sheet.Cells[1, 15] = "Почта";
                sheet.Cells[1, 16] = "Веб сайт";

                Excel.Range headerRange = sheet.Range[sheet.Cells[1, 1], sheet.Cells[1, 16]];
                headerRange.Font.Bold = true;
                int rowIndex = 2;
                foreach (var sup in (item.Content as SearchResponse).Suppliers)
                {
                    sheet.Cells[rowIndex, 1] = sup.company;
                    sheet.Cells[rowIndex, 2] = sup.rating;
                    sheet.Cells[rowIndex, 3] = sup.inn;
                    sheet.Cells[rowIndex, 4] = sup.ogrn;
                    sheet.Cells[rowIndex, 5] = sup.okpo;
                    sheet.Cells[rowIndex, 6] = sup.register_date;
                    sheet.Cells[rowIndex, 7] = sup.fin_info;
                    sheet.Cells[rowIndex, 8] = sup.amount;
                    sheet.Cells[rowIndex, 9] = sup.price;
                    sheet.Cells[rowIndex, 10] = sup.date_publish;
                    sheet.Cells[rowIndex, 11] = sup.advantages;
                    sheet.Cells[rowIndex, 12] = sup.disadvantages;
                    sheet.Cells[rowIndex, 13] = sup.phone;
                    sheet.Cells[rowIndex, 14] = sup.address;
                    sheet.Cells[rowIndex, 15] = sup.email;
                    sheet.Cells[rowIndex, 16] = sup.web_site;
                    rowIndex++;
                }

                sheet.Columns.AutoFit();

                Excel.Range table = sheet.UsedRange;
                table.Borders[Excel.XlBordersIndex.xlEdgeBottom].LineStyle =
                table.Borders[Excel.XlBordersIndex.xlEdgeLeft].LineStyle =
                table.Borders[Excel.XlBordersIndex.xlEdgeRight].LineStyle =
                table.Borders[Excel.XlBordersIndex.xlEdgeTop].LineStyle =
                table.Borders[Excel.XlBordersIndex.xlInsideHorizontal].LineStyle =
                table.Borders[Excel.XlBordersIndex.xlInsideVertical].LineStyle = Excel.XlLineStyle.xlContinuous;


            }

            app.Visible = true;
            
        }
    }
}
