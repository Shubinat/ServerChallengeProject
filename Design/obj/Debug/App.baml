   M S B A M L   `   `   `  ����A  =Design, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullclr-namespace:DesignDesign  5          
Design.App   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      &localclr-namespace:Design     5        �� 	Resources  5       �� MergedDictionaries �� Source   placeHolder �� 
TargetType �� BasedOn �� Property  TitleBarBackgroundBrush �� Value �� 
TargetType �� Triggers	 :� RoutedEvent
 �� TargetProperty g� Duration W� From	 W� To ��Name K� ZIndex �� Path �� RelativeSource �� Mode �� UpdateSourceTrigger
 � Tag �� Binding �� Source%  System.Windows.Markup.Reference �� Value  backBtn P� Property P� Value�� 5   
    5      �� 5	      $* $Styles/VS2012/VS2012WindowStyle.xaml?�6%   %�  &	        7��7  &	 �    �� 5      " ��6(   8   .�5      ��  � ��8  6/   �� 5       � �� 5      �� 5      " ��6*   .R�5      � #��z��6#   ��5   "   �� 5   &   " �6,    5   *   :� 5   .   $	 Loaded��6;   .[�5   2   �� .��5   6   �� .��5   :   W� $
 Opacity�6J   $ 0:0:1D�6n   $	 0.5X�6   $ 1X�6�   5   7   5   3   5   /   5   '   .+�5   "   �� $ 
textSource��5#   "   
������ $ 2��5%   "   #��z��5&   "   ��5   *   �� $
 Text� �� *TemplatedParent+$ TwoWay=�$ PropertyChanged=�.��5'   #   5(   #   �� 5)   "   #��z 6*   #��z��6G   
������ $ 1��6�   .��6�   ��5*   &   �� 5+   *   " ��60   .�5,   .   ��  � ��
 ���� 6K    5-   .   �� 5.   2    6>   �� $
 Text�   *
textSource+  6}   .a�5/   6   ��  � ��
 �iii�6S   50   3   52   +   .��53   5   54   #   55      56      58      59      �� 5:      " ��6$   .�5;      ��  � �� 5<      �� 5=      " ��6*   .R�5>      �� ���#EFEFF2#��z��6:   $��1q�6\   
�������._�5?   "   �� #��z��63   #��z��6W   5@      5A      5C       5D      P� 5E       �@J�IsMouseOver . . �5F      ��  � �� 5G      �� 5H   "   " ��62   .R�5I   &   �� 
�������#��z��6D   $��1q�6f   
�������._�5J   *   �� #��z��6;   #��z��6_   5K   '   5L   #   5N      5O      P� 5P       � �� . . �5Q      ��  � �� 5R      �� 5S   "   " ��62   .R�5T   &   �� ���#EFEFF2#��z��6B   $��1q�6d   
�������._�5U   *   �� #��z��6;   #��z��6_   5V   '   5W   #   5Y      5Z      5\      5_      5a      