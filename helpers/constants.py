from requests import get, post, patch, put, delete


LANGUAGE_TO_REQUEST = {
    'português': 'pt',
    'inglês': 'en'
}

LANGUAGE_TO_CONVERT = {
    'português': 'pt_BR',
    'inglês': 'en'
}

REQUESTS_TYPE = {
    'get': get,
    'post': post,
    'patch': patch,
    'put': put,
    'delete': delete
}
