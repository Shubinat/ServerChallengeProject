   M S B A M L   `   `   `  ���� A  =Design, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null+clr-namespace:Design.PagesDesign.Pages  D @WpfCharts, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null8*clr-namespace:WpfCharts;assembly=WpfCharts	WpfCharts     Design.Pages.DetailPage   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     @d2http://schemas.microsoft.com/expression/blend/2008     ,localclr-namespace:Design.Pages     @	WpfCharts*clr-namespace:WpfCharts;assembly=WpfCharts       N� Title$  
DetailPage�� � 	Resources  �� 
TargetType �� Property �� Value �� Color �� Opacity   VS2012WindowBorderBrush��%p   '��       7   �� " ��.���  � �� �� $ #EFEFF2��$	 0.7Q���  � ��8   ��  � ��$ 1q�.��� -   $��
GridDetail������ " � �� Triggers :�  :� RoutedEvent$ Loaded��.[��� .���� .��W� 	 g� Duration$	 0:0:0.5D�
 W� From$
 0X�	 W� To$ 1X� �� TargetProperty$ Opacity� � RowDefinitions �� $
��auto ��� $
��auto ��� $
��auto ��� $
��auto ��� $
��auto ��� $
��auto �.+��� $��10q� �� Padding$ 10q�._�]� .+��� -   
���iii�$��
Назад��$��18(�$
��Left=�$
��Left=�$
��10 0q�$��26��$	��Top=�  backBtn#��[ �� $��18(�$
��Left=�$
��10 0q�$
��Bold"����� *	company+ �� StringFormat$ Компания: {0}����  �� TextAlignment$ Right=�$��18(�$
��10 0q�$��Right=�$
��Bold"����� *rating+$ Рейтинг: {0}���� $��1��$
��10 0q�._��  �� $
��auto ���  � ColumnDefinitions �� �� .+��� 
������ $��2��._��� $��О компании��$��18(�$
��Bold"�$
��10 0q��� $��1��$
��10 0q�.+��� .+��� $��Юр. лицо��$
��Bold"�$��14(���  �� Orientation$ 
Horizontal=�$	��5 0q�.+��� $��ИНН: ��$��14(��� $��14(����� *inn+�� $ 
Horizontal=�$	��5 0q�.+��� $��
ОГРН: ��$��14(��� $��14(����� *ogrn+�� $ 
Horizontal=�$	��5 0q�.+��� $��КПП: ��$��14(��� $��14(����� *kpp+�� $ 
Horizontal=�$	��5 0q�.+��� $��
ОКПО: ��$��14(��� $��14(����� *okpo+�� $ 
Horizontal=�$	��5 0q�.+��� $'��!Дата регистрации: ��$��14(��� $��14(����� *register_date+�� .+��� $��Количество��$
��Bold"�$��14(��� $ 
Horizontal=�$	��5 0q�.+��� $��14(����� *amount+�� .+��� $#��Дата публикации��$
��Bold"�$��14(��� $ 
Horizontal=�$	��5 0q�.+��� $��14(����� *date_publish+�� $��1��$��1��.+��� .+��� $��Цена��$
��Bold"�$��14(��� $ 
Horizontal=�$	��5 0q�.+��� $��14(����� *
price_text+�� .+��� $/��)Финансовая информация��$
��Bold"�$��14(��� $ 
Horizontal=�$	��5 0q�.+��� $��14(����� *
fin_info+�� $��4��$��10q�._�  WpfCharts.SpiderChart  -     Name$ ChartAnalytics��   Title$ Статистика��$	��500��   Minimum$ 0Q�   Maximum$ 1Q�   Ticks$ 5��   
ShowLegend .    LegendLocation$ BottomRight=�   LegendBackgroundColor$ White��
������ �� $��5��$��10q�._��  �� $
��auto ��� .+��� 
������ ._��� $��Контакты��$��18(�$
��Bold"�$
��10 0q��� $ Vertical=�$��1��$��10q�.+��� $ 
Horizontal=�.+��� $	����$��Segoe MDL2 Assets)�$��18(��� $��14(�$	��5 0q�����  �� Path$ phone�$ Телефон: {0}�� �� TargetNullValue$, &Телефон: отсутствует���� $ 
Horizontal=�$	��0 5q�.+��� $	����$��Segoe MDL2 Assets)�$��18(��� $��14(�$	��5 0q����� $ address�$ Адрес: {0}��$( "Адрес: отсутствует���� $ 
Horizontal=�.+��� $	����$��Segoe MDL2 Assets)�$��18(��� $��14(�$	��5 0q����� $ email�$ Почта: {0}��$( "Почта: отсутствует���� $ 
Horizontal=�$	��0 5q�.+��� $	����$��Segoe MDL2 Assets)�$��18(��� $��14(�$	��5 0q����� $ web_site�$ Сайт: {0}��$&  Сайт: отсутствует���� $��2��$��10q�._��  �� $
��auto ��� .+��� 
������ ._��� $��Достоинства��$��18(�$
��Bold"�$
��10 0q��� $��
10 0 10 10q�$��14(�$��1��$
��Wrap=����� *advantages_fromat+�� $��3��$��10q�._��  �� $
��auto ��� .+��� 
������ ._��� $��Недостатки��$��18(�$
��Bold"�$
��10 0q��� $��
10 0 10 10q�$��14(�$��1��$
��Wrap=����� *disadvantages_fromat+