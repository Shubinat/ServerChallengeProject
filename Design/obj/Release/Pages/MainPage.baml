   M S B A M L   `   `   `  ���� A  =Design, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null+clr-namespace:Design.PagesDesign.Pages      Design.Pages.MainPage   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     @d2http://schemas.microsoft.com/expression/blend/2008     ,localclr-namespace:Design.Pages       N� Title$  iSeals��.���  � RowDefinitions �� $
��auto ��� �� $
��auto �.+�]� $��10q�$��25������  �� 
TargetType" ]� �� Triggers :�  :� RoutedEvent$ Loaded��.[��� .���� .��W�  �� TargetProperty$ Opacity� W� From$ 0X�	 W� To$	 0.7X�:� $ GotFocus��.[��� .���� .��W� $ Height� g� Duration$ 0:0:0.5D�$	 200X�:� $ 	LostFocus��.[��� .���� .��W� $ Height�$ 0:0:0.5D�$	 150X�$ 25X�.+�� $	��Top=�	 � ColumnDefinitions	 �� �� $
��auto ��� $
��auto �.+��� -   
 ��Name$
 
TBoxSearch��
 � Tag$ Поиск: ��   placeHolder#��[   # VS2012WindowBorderBrushInactive#��[ $��18(�$	��Top=�.������  �� Color$ #EFEFF2�� �� Opacity$	 0.7Q�.���� -   $��1��$
��10 0q�$
��10 0q�$	��Top=�$��Right=�$��18(����� $	����$��Segoe MDL2 Assets)��� -   $��Excel��$��2��$
��10 0q�$	��Top=�$��Right=�$��18(��� -   $��LViewProperties��$��18(�$��0 10 0 0q�
���iii� J� 	AllowDrop . ���� $ #EFEFF2��$	 0.7Q�.@��� -   .��� .+���  �� Orientation$ 
Horizontal=�.+��� $��
Цена: ���� -   $
 TboxPriceDown��$
��10 0q�#��[  $ От: ��$	��150�� .  �� -   $
 TboxPriceUp��$
��10 0q�#��[  $ До: ��$	��150�� .  �� $��0��$y�Hidden=��� -   .��� .+��� $%��Дата регистрации���� $��1��$y�Hidden=��� -	   .��� .+��� $��Рейтинг���� $��2��$y�Hidden=��� -
   .��� .+��� $��Выручка���� $��3��$y�Hidden=��� -   .��� .+��� $��
Плюсы���� $��4��$y�Hidden=��� -   .��� .+��� $��Недостатки���� $��5��$y�Hidden=��� -   .��� .+��� $+��%Количество тендеров���� $��6��$y�Hidden=��� -    ��Name$ SearchTabControl��$��1��$��
10 0 10 10q����� $ #EFEFF2��$	 0.7Q��� -    ��Name$ 	BtnExport��$��2��$��5q�$
��10 5q�$��Экспорт в Excel��$��Right=�$��Center=�  backBtn#��[ 