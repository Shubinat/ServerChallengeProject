   M S B A M L   `   `   `  ����A  =Design, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null+clr-namespace:Design.PagesDesign.Pages  5      D @WpfCharts, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null8*clr-namespace:WpfCharts;assembly=WpfCharts	WpfCharts 5          Design.Pages.DetailPage   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      ,localclr-namespace:Design.Pages     5      @	WpfCharts*clr-namespace:WpfCharts;assembly=WpfCharts     5        N� Title$  
DetailPage��5
       � 	Resources 5       �� 
TargetType �� Property �� Value �� Color �� Opacity   VS2012WindowBorderBrush��%�   '��       7   �� 5   
   " ��6   .�5      ��  � �� 5      �� 5      $ #EFEFF2��6&   $	 0.7Q�66   5      �� 5       � ��8   6,   �� 5       � ��$ 1q�60   5      5      .��5      � -   5        $��
GridDetail��5      ��5   
   �� 5      " �6    �� Triggers 5      :� 5       :� RoutedEvent$ Loaded��6#   .[�5      �� .��5      �� .��5   "   W� 	 g� Duration$	 0:0:0.5D�62   
 W� From$
 0X�6E   	 W� To$ 1X�6N    �� TargetProperty$ Opacity�6U   5      5       5!      5#       � RowDefinitions 5%   
   �� 5&      $
��auto �6   �� 5'      $
��auto �6   �� 5(      $
��auto �6   �� 5)      $
��auto �6   �� 5*      $
��auto �6   �� 5+      $
��auto �6   .+�5.   
   �� $��10q�6    �� Padding$ 10q�6   ._�5/      ]� .+�50      �� -   5        
���iii�$��
Назад��50   C   $��18(�6S   $
��Left=�6a   $
��Left=�6w   $
��10 0q�6�   $��26��6�   $	��Top=�6�     backBtn#��[ 6�   �� 51      $��18(�6   $
��Left=�6*   $
��10 0q�6w   $
��Bold"�6�   ��6@   �� *	company+ �� StringFormat$ Компания: {0}��6�   �� 52       �� TextAlignment$ Right=�6   $��18(�62   $
��10 0q�6u   $��Right=�6�   $
��Bold"�6�   ��6@   �� *rating+$ Рейтинг: {0}��6�   53      54      �� 56   
   $��1��6   $
��10 0q�6   ._�57      �  58      �� 59      $
��auto �6$   �� 5:       � ColumnDefinitions 5<      �� 5=      �� 5>      .+�5A      �� 
������ $��2��62   ._�5B      �� $��О компании��6    $��18(�62   $
��Bold"�6@   $
��10 0q�6R   5C      �� 5E      $��1��6   $
��10 0q�6*   .+�5F      �� .+�5G      �� $��Юр. лицо��6$   $
��Bold"�64   $��14(�6F   �� 5H       �� Orientation$ 
Horizontal=�6%   $	��5 0q�6>   .+�5I      �� $��ИНН: ��6(   $��14(�65   �� 5J      $��14(�6=   ��6(   �� *inn+6=   5K      �� 5L      $ 
Horizontal=�6%   $	��5 0q�6>   .+�5M      �� $��
ОГРН: ��6(   $��14(�66   �� 5N      $��14(�6>   ��6(   �� *ogrn+6>   5O      �� 5P      $ 
Horizontal=�6%   $	��5 0q�6>   .+�5Q      �� $��КПП: ��6(   $��14(�65   �� 5R      $��14(�6=   ��6(   �� *kpp+6=   5S      �� 5T      $ 
Horizontal=�6%   $	��5 0q�6>   .+�5U      �� $��
ОКПО: ��6(   $��14(�66   �� 5V      $��14(�6>   ��6(   �� *okpo+6>   5W      �� 5X      $ 
Horizontal=�6%   $	��5 0q�6>   .+�5Y      �� $'��!Дата регистрации: ��6(   $��14(�6B   �� 5Z      $��14(�6G   ��6(   �� *register_date+6G   5[      5\      �� 5^      .+�5_      �� $��Количество��6$   $
��Bold"�66   $��14(�6H   �� 5`      $ 
Horizontal=�6%   $	��5 0q�6>   .+�5a      �� $��14(�6@   ��6(   �� *amount+6@   5b      5c      �� 5e      .+�5f      �� $#��Дата публикации��6$   $
��Bold"�6;   $��14(�6M   �� 5g      $ 
Horizontal=�6%   $	��5 0q�6>   .+�5h      �� $��14(�6F   ��6(   �� *date_publish+6F   5i      5j      5k      �� 5m      $��1��6   $��1��6*   .+�5n      �� .+�5o      �� $��Цена��6$   $
��Bold"�60   $��14(�6B   �� 5p      $ 
Horizontal=�6%   $	��5 0q�6>   .+�5q      �� $��14(�6D   ��6(   �� *
price_text+6D   5r      5s      �� 5u      .+�5v      �� $/��)Финансовая информация��6$   $
��Bold"�6A   $��14(�6S   �� 5w      $ 
Horizontal=�6%   $	��5 0q�6>   .+�5x      �� $��14(�6B   ��6(   �� *
fin_info+6B   5y      5z      5{      5|      5}      �� 5�   
   $��4��6   $��10q�6   ._�5�        WpfCharts.SpiderChart  -   5          Name$ ChartAnalytics��5�   7      Title$ Статистика��6$   $	��500��6O      Minimum$ 0Q�5�          Maximum$ 1Q�5�          Ticks$ 5��5�          
ShowLegend .    LegendLocation$ BottomRight=�5�          LegendBackgroundColor$ White��5�       
������ 5�      5�      �� 5�   
   $��5��6   $��10q�6   ._�5�      �  5�      �� 5�      $
��auto �6$   �� 5�      .+�5�      �� 
������ ._�5�      �� $��Контакты��6    $��18(�60   $
��Bold"�6>   $
��10 0q�6P   5�      �� 5�      $ Vertical=�6   $��1��64   $��10q�6A   .+�5�      �� $ 
Horizontal=�6!   .+�5�      �� $	����6$   $��Segoe MDL2 Assets)�64   $��18(�6S   �� 5�      $��14(�6$   $	��5 0q�62   ��5�      �� 5�   "    �� Path$ phone�6*   $ Телефон: {0}��67    �� TargetNullValue$, &Телефон: отсутствует��5�   ?   5�   #   5�      5�      �� 5�      $ 
Horizontal=�6!   $	��0 5q�6:   .+�5�      �� $	����6$   $��Segoe MDL2 Assets)�64   $��18(�6S   �� 5�      $��14(�6%   $	��5 0q�63   ��5�      �� 5�   "   $ address�6*   $ Адрес: {0}��69   $( "Адрес: отсутствует��5�   ?   5�   #   5�      5�      �� 5�      $ 
Horizontal=�6!   .+�5�      �� $	����6$   $��Segoe MDL2 Assets)�64   $��18(�6S   �� 5�      $��14(�6$   $	��5 0q�62   ��5�      �� 5�   "   $ email�6*   $ Почта: {0}��67   $( "Почта: отсутствует��5�   ?   5�   #   5�      5�      �� 5�      $ 
Horizontal=�6!   $	��0 5q�6:   .+�5�      �� $	����6$   $��Segoe MDL2 Assets)�64   $��18(�6S   �� 5�      $��14(�6$   $	��5 0q�62   ��5�      �� 5�   "   $ web_site�6*   $ Сайт: {0}��6:   $&  Сайт: отсутствует��5�   ?   5�   #   5�      5�      5�      5�      5�      �� 5�   
   $��2��6   $��10q�6   ._�5�      �  5�      �� 5�      $
��auto �6$   �� 5�      .+�5�      �� 
������ ._�5�      �� $��Достоинства��6    $��18(�63   $
��Bold"�6A   $
��10 0q�6S   5�      �� 5�      $��
10 0 10 10q�5�      $��14(�5�      $��1��5�      $
��Wrap=�5�      ��6)   �� *advantages_fromat+5�      5�      �� 5�   
   $��3��6   $��10q�6   ._�5�      �  5�      �� 5�      $
��auto �6$   �� 5�      .+�5�      �� 
������ ._�5�      �� $��Недостатки��6    $��18(�62   $
��Bold"�6@   $
��10 0q�6R   5�      �� 5�      $��
10 0 10 10q�5�      $��14(�5�      $��1��5�      $
��Wrap=�5�      ��5�      �� *disadvantages_fromat+5�      5�      5�      5�      