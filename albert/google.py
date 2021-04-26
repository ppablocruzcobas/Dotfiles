"""
  Get suggestions from Google
"""
from albert import *
from os import path
import requests
import lxml.html
import json

__iid__ = "PythonInterface/v0.2"
__title__ = "Google Suggestions"
__version__ = "0.1.0"
__triggers__ = "gg "
__author__ = "Angelo Gazzola"
__dependencies__ = ["lxml", "cssselect"]
__icon__ = path.dirname(__file__) + "/icons/Google.png"


MAX_LINE_LENGTH = 75
REQUEST_HEADERS = {
    'User-Agent': (
        'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko)'
        ' Chrome/62.0.3202.62 Safari/537.36'
    )
}
session = requests.Session()
session.trust_env = False


class SuggestionItem(Item):
    def __init__(self, suggestion):
        super().__init__(
            id=str(hash(suggestion)),
            icon=__icon__,
            text=suggestion,
            completion=__triggers__ + suggestion + '_',
            actions=[
                UrlAction(
                    'Search on Google',
                    'https://google.com/search?q={}'.format(suggestion)
                )
            ]
        )


class ResultItem(Item):
    def __init__(self, result, query):
        super().__init__(
            id=result[1],
            icon=__icon__,
            text=result[0],
            subtext=result[1] + '\n' + result[2],
            completion=__triggers__ + query + '_',
            actions=[UrlAction('Search on Google', result[1])]
        )


def search(query):
    response = session.get('https://google.com/search',
                           headers=REQUEST_HEADERS,
                           params={
                               'sourceid': 'chrome',
                               'hl': 'en',
                               'q': query,
                           }
                           )

    html = lxml.html.fromstring(response.text)
    results = html.cssselect('.rc')
    items = []

    for result in results:
        title = result.cssselect('h3 > a')[0]
        url = title.get('href')

        description = result.cssselect('.s .st')
        formatted_description = []

        if len(description) > 0:
            description = description[0].text_content()

            for i in range(MAX_LINE_LENGTH, len(description), MAX_LINE_LENGTH):
                formatted_description.append(description[i-MAX_LINE_LENGTH:i])
            formatted_description.append(description[i:-1])

        items.append((title.text, url, '\n'.join(formatted_description)))

    return [ResultItem(r, query) for r in items]


def suggest(query):
    response = session.get('https://clients1.google.com/complete/search',
                           headers=REQUEST_HEADERS,
                           params={
                               'client': 'firefox',
                               'output': 'toolbar',
                               'hl': 'en',
                               'q': query,
                           }
                           )
    suggestions = json.loads(response.text)[1]
    return [SuggestionItem(suggestion) for suggestion in suggestions]


def handleQuery(query):
    items = []

    if query.isTriggered and len(query.string) > 0:
        # if query.string[-1] == '_':
        #     items = search(query.string[:-1])
        # else:
        items = suggest(query.string)
        items.insert(0, SuggestionItem(query.string))
    return items

    # return [Item(icon=__icon__, text='Google')]
