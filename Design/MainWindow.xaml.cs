using Design.Classes;
using Design.Pages;
using System;
using System.Collections.Generic;
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

namespace Design
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();

            AppData.MainFrame = MainFrame;
            AppData.MainFrame.Navigate(new MainPage());

            
        }

        private void Window_ContentRendered(object sender, EventArgs e)
        {
            
    }

        private void ListView_MouseDown(object sender, MouseButtonEventArgs e)
        {

        }

        private void ListView_Drop(object sender, DragEventArgs e)
        {

        }

    }
}
