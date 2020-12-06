from json import loads

from behave import given, then
from num2words import num2words

from helpers.constants import (
    LANGUAGE_TO_CONVERT,
    LANGUAGE_TO_REQUEST,
    REQUESTS_TYPE
)


@given('que faço uma requisição do tipo "{request_type:D}" para "{url:D}" para obter o número "{number:d}" em "{language:D}"')  # NOQA
def request_number_to_word(context, request_type: str, url: str, number: int,
                           language: str):
    formated_url = f'{url}/{number}' if language == 'português' \
        else f'{url}/{LANGUAGE_TO_REQUEST[language]}/{number}'
    context.response = REQUESTS_TYPE[request_type](formated_url)


@then('minha requisição deverá ter o status code "{status_code:d}"')
def assert_status_code_request(context, status_code: int):
    assert context.response.status_code == status_code, (
        'O Status Code encontrado foi diferente do esperado\n'
        f'Retornado: {context.response.status_code}\n'
        f'Esperado: {status_code}'
    )


@then(u'o número "{number:d}" deverá estar escrito por "{key:D}" em "{language:D}"')  # NOQA
def assert_number_to_words(context, number: int, key: str, language: str):
    word = num2words(number, lang=LANGUAGE_TO_CONVERT[language])
    if language == 'português':
        word = word.replace(',', ' e')
    response_data = loads(context.response.text)

    assert word.lower() == response_data.get(key).lower(), (
        'O número retornado é diferente\n'
        f'Retornado: {response_data.get(key)}\n'
        f'Esperado: {word.lower()}'
    )


@then(u'a resposta de deverá conter a chave: "{key:D}"')
def assert_response_key(context, key):
    response_data = loads(context.response.text)
    assert response_data.get(key), (
        'Chave Esperada não foi encontrada dentro da resposta\n'
        f'Chaves Encontradas: {", ".join(response_data.keys())}\n'
        f'Chave Esperada: {key}'
    )


@then(u'o conteúdo da requisição será o número: "{number:d}" por extenso em "{language:D}"')  # NOQA
def assert_content_of_response(context, number: int, language: str):
    word = num2words(number, lang=LANGUAGE_TO_CONVERT[language])
    if language == 'português':
        word = word.replace(',', ' e') 
    response_data = loads(context.response.text).values()
    
    response_iterator = iter(response_data)
    returned_value = next(response_iterator)

    assert word.lower() == returned_value.lower(), (
        f'Numeral escrito encontrado foi diferente do esperado na língua: {language}\n'
        f'Texto do numeral esperado: {word}\n'
        f'Texto do numeral recebido: {returned_value}'
    )
