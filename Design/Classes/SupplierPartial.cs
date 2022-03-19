using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Design.Classes
{
    public partial class Supplier
    {
        public string price_text => price.HasValue ? $"{Math.Round(price.Value, 5)} ₽" : "Не указана";

        public int advantages_count => advantages?.Split(';').Length ?? 0;
        public int disadvantages_count => disadvantages?.Split(';').Length ?? 0;

        public string advantages_fromat
        {
            get
            {
                var list = advantages?.Split(';').Select(x => x.Insert(0, "• ")).ToList();
                if(list != null)
                    if(list.Count != 0)
                        list.RemoveAt(advantages_count - 1);
                return (list.Count == 0 ? null : string.Join("\n", list)) ?? "Информация отсутствует";
            }

        }

        public string disadvantages_fromat
        {
            get
            {
                var list = disadvantages?.Split(';').Select(x => x.Insert(0, "• ")).ToList();
                if (list != null)
                    if (list.Count != 0)
                        list.RemoveAt(disadvantages_count - 1);
                return (list.Count == 0 ? null : string.Join("\n", list)) ?? "Информация отсутствует";
            }
        }

        public int tenders_count
        {
            get
            {
                var str = amount_sum_lots.Split(':')[1].Split(' ')[0];
                if (int.TryParse(str, out int result))
                {
                    return result;
                }
                return 0;
            }
        }
        public double revenue
        {
            get
            {
                int index = amount_sum_lots.IndexOf("руб");
                string value = "";
                for (int i = index - 1; i >= 0; i--)
                {
                    var a = amount_sum_lots[i];
                    if (amount_sum_lots[i] != ' ' && amount_sum_lots[i] != ',' && amount_sum_lots[i] != ' ')
                    {
                        if (int.TryParse(amount_sum_lots[i].ToString(), out int t))
                        {
                            value = value.Insert(0, amount_sum_lots[i].ToString());
                        }
                        else
                        {
                            break;
                        }
                    }
                }
                value = new string(value.Take(value.Length - 2).ToArray());
                if(double.TryParse(value, out double result))
                    return result;
                return 0.0;
            }
        }
        public int rate { 
            get
            {
                int maxOffer = 500;
                if(tenders_count > 500)
                    return 10;
                else if (150 <= tenders_count && tenders_count < maxOffer)
                    return 5;
                else if(50 <= tenders_count && tenders_count < 150)
                    return 2;
                return 0;

            }
        }
    } 
}
