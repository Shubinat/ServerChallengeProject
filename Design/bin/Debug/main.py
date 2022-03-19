import requests
from bs4 import BeautifulSoup
import random
from fake_useragent import UserAgent
import json

ua = UserAgent()

main_info = []

info = []

# proxies = {
#     "http": "http://185.221.160.176:80",
#     "https": "https://185.221.160.176:80"
#
# }

def parse_company(company, amount_sum_lots):
    url = 'https://checko.ru/search?query=' + company
    response = requests.get(url, headers={
        'user-agent': ua.random}, verify=False).text
    soup = BeautifulSoup(response, 'html.parser')
    inn = company
    ogrn = soup.find('strong', id='copy-ogrn').get_text(strip=True)
    kpp = soup.find('strong', id='copy-kpp').get_text(strip=True)
    okpo = soup.find('strong', id='copy-okpo').get_text(strip=True)
    main_info = soup.find('div', class_='uk-width-1')
    kapital = None
    fin_info = None
    basic_datas = main_info.find_all('div')
    for index, value in enumerate(basic_datas):
        try:
            if value.find('div', class_='uk-text-bold').get_text(strip=True) == 'Дата регистрации':
                register_date = basic_datas[index + 2].get_text(strip=True)
            elif value.find('div', class_='uk-text-bold').get_text(strip=True) == 'Юридический адрес':
                address = basic_datas[index + 2].get_text(strip=True)
            elif value.find('div', class_='uk-text-bold').get_text(strip=True) == 'Уставный капитал':
                kapital = basic_datas[index + 2].get_text(strip=True)
            elif value.find('div', class_='uk-text-bold').get_text(
                    strip=True) == 'Финансовая отчетность за 2020 год':
                fin_info = basic_datas[index + 2].get_text(strip=True)
        except AttributeError:
            pass
    try:
        rating = soup.find('div', class_='uk-width-1-2 uk-text-right pr-4').get_text(strip=True)
    except AttributeError:
        rating = None

    try:
        disadvantages_ul = soup.find_all('ul', class_='uk-list mt-0 ml-2')[1]
        _disadvantages = disadvantages_ul.find_all('div', class_='uk-text-bold')
        disadvantages = ""
        for a in _disadvantages:
            disadvantages += a.get_text(strip=True) + '; '
    except:
        disadvantages = 'Недостатков не обнаружено'

    advantages_ul = soup.find('ul', class_='uk-list mt-0 ml-2')
    _advantages = advantages_ul.find_all('div', class_='uk-text-bold')
    advantages = ""
    for a in _advantages:
        advantages += a.get_text(strip=True) + '; '

    contacts = soup.find('section', id='contacts').find('div', class_='uk-grid-divider').find_all('div',
                                                                                                  class_="uk-width-1 uk-width-1-3@m")
    for index, value in enumerate(contacts):
        try:
            if value.find('strong', class_='uk-text-bold').get_text(strip=True) == 'Телефон' or value.find('strong',
                                                                                                           class_='uk-text-bold').get_text(
                strip=True) == 'Телефоны':
                phone = None if (contacts[index].get_text(strip=True) == "Телефон—") else contacts[index].find(
                    'a').get_text(strip=True)
                continue
        except AttributeError:
            pass
        data = value.find('div', class_='uk-text-bold').get_text(strip=True)
        if data == 'Электронная почта':
            email = None if (contacts[index].get_text(strip=True) == "Электронная почта—") else (
                contacts[index].find('a').get_text(strip=True))
        elif data == 'Веб-сайт и соцсети':
            web_site = None if (contacts[index].get_text(strip=True) == "Веб-сайт и соцсети—") else contacts[
                index].find(
                'a').get_text(strip=True)
        else:
            pass

    info.append({
        'inn': inn,
        'ogrn': ogrn,
        'kpp': kpp,
        'okpo': okpo,
        'amount_sum_lots': amount_sum_lots,
        'register_date': register_date,
        'rating': rating,
        'address': address,
        'kapital': kapital,
        'fin_info': fin_info,
        'advantages': advantages,
        'disadvantages': disadvantages,
        'phone': phone,
        'email': email,
        'web_site': web_site
    })
    return info


def save(m_info, c_info):
    for i in range(len(c_info)):
        c_info[i].update(m_info[i])

    with open('company.json', 'w', encoding='utf8') as file:
        json.dump(c_info, file, ensure_ascii=False)


def get_data(url):
    response = requests.get(url, headers={
        'user-agent': ua.random})
    response_text = response.text
    soup = BeautifulSoup(response_text, 'html.parser')

    try:
        try:
            price = float(soup.find('tr', class_='c1', id='trade-info-lot-price').find_all('td')[1].get_text(
                strip=True).replace('руб. (цена без НДС)', '').replace('\xa0', '').replace(',', '.'))
        except ValueError:
            price = None
    except AttributeError:
        try:
            price = float(soup.find('tr', class_='c2', id='trade-info-lot-price').find_all('td')[1].get_text(
                strip=True).replace('руб. (цена без НДС)', ' ').replace('\xa0', '').replace(',', '.'))
        except ValueError:
            price = None
    try:
        amount = soup.find('tr', class_='c1', id='trade-info-lot-quantity').find_all('td')[1].get_text(
            strip=True)
    except AttributeError:
        amount = 'Количество не указано'
    date_publish = soup.find('span', itemprop='datePublished').get_text(strip=True)
    company_url = "https://www.b2b-center.ru" + soup.find('tr', id='trade-info-organizer-name').find('a').get(
        'href')
    print(company_url)
    company = soup.find('span', itemprop='author').get_text(strip=True)
    try:
        order_by = soup.find('tr', class_='trade-info-organizer-name').find_all('a')[1].get_text(strip=True)
    except AttributeError:
        order_by = 'Заказчик отсутствует'

    main_info.append({
        'price': price,
        'amount': amount,
        'date_publish': date_publish,
        'company': company,
        'order_by': order_by
    })

    get_company_url(company_url)


def get_company_url(company_url):
    response = requests.get(company_url, headers={
        'user-agent': ua.random})
    response_text = response.text
    soup = BeautifulSoup(response_text, 'html.parser')
    tds = soup.find('table', class_='table').find_all('td')
    company_id = company_url.split('/')[-2]
    response = requests.get('https://www.b2b-center.ru/market/list.html?type=3&archive=1&firm_id=' + company_id,
                            headers={
                                'user-agent': ua.random})
    soup = BeautifulSoup(response.text, 'html.parser')
    amount_sum_lots = soup.find_all('b')[1].parent.get_text(strip=True)
    global checko_info
    checko_info = parse_company(tds[find_inn(tds) + 1].get_text(strip=True), amount_sum_lots)


def find_inn(array):
    for index, value in enumerate(array):
        if value.get_text(strip=True) == 'ИНН':
            return index


def get_page_data(page, url):
    url += '&from=' + str((int(page) - 1) * 20)
    response = requests.get(url=url, headers={
        'user-agent': ua.random}).text
    soup = BeautifulSoup(response, 'html.parser')
    for u in soup.find_all('a', class_='search-results-title visited'):
        link = 'https://www.b2b-center.ru' + u.get('href')
        get_data(link)


def gather_data(need):
    url = 'https://www.b2b-center.ru/market/?f_keyword=' + need + '&trade=sell'
    response = requests.get(url=url, headers={
        'user-agent': ua.random}).text
    soup = BeautifulSoup(response, 'html.parser')
    try:
        page_count = soup.find('ul', class_='pagi-list').find_all('li')[-1].find('a').get_text(strip=True)
    except AttributeError:
        page_count = 2
    for page in range(1, int(page_count)):
        get_page_data(page, url)

    save(main_info, checko_info)


def main(need):
    gather_data(need)


# if __name__ == "__main__":
#     main()

