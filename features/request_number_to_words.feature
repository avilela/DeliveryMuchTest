# language: pt

Funcionalidade: Requisição de Números por Escrito 

  Esquema do Cenário: Validar que API responde <response> para request do tipo <request_type>
    Dado que faço uma requisição do tipo "<request_type>" para "http://challengeqa.staging.devmuch.io" para obter o número "1000" em "<language>"
    Então minha requisição deverá ter o status code "<status_code>"
  
  Exemplos:
    | request_type | response       | language  | status_code |
    | get          | corretamente   | português | 200         |
    | get          | corretamente   | inglês    | 200         |
    | post         | incorretamente | português | 405         |
    | post         | incorretamente | inglês    | 405         |
    | patch        | incorretamente | português | 405         |
    | patch        | incorretamente | inglês    | 405         |
    | put          | incorretamente | português | 405         |
    | put          | incorretamente | inglês    | 405         |
    | delete       | incorretamente | português | 405         |
    | delete       | incorretamente | inglês    | 405         |

  Esquema do Cenário: Validar que API retorna Invalid Data e Status Code 400 quando enviado <send_data> no idioma <language>
    Dado que faço uma requisição do tipo "get" para "http://challengeqa.staging.devmuch.io" para obter o número "<send_data>" em "<language>"
    Então minha requisição deverá ter o status code "400"

  Exemplos:
    | send_data | language  |
    | 10001     | português |
    | -10001    | português |
    | 10001     | inglês    |
    | -10001    | inglês    |

  Esquema do Cenário: Validar que resposta da requisição de GET está conforme esperado em <language>
    Dado que faço uma requisição do tipo "get" para "http://challengeqa.staging.devmuch.io" para obter o número "1000" em "<language>"
    Então a resposta de deverá conter a chave: "<key>"

  Exemplos: 
    | key     | language  |
    | extenso | português |
    | extenso | inglês    |
  
  Esquema do Cenário: Validar que API retorna valores válidos em <language> para <number> 
    Dado que faço uma requisição do tipo "get" para "http://challengeqa.staging.devmuch.io" para obter o número "<number>" em "<language>"
    Então minha requisição deverá ter o status code "200" 
    E o conteúdo da requisição será o número: "<number>" por extenso em "<language>"
  
  Exemplos: 
    | language  | number |
    | português | 0      |
    | português | 1000   |
    | português | 1500   |
    | português | 2000   |
    | português | 2500   |
    | português | 3000   |
    | português | 3500   |
    | português | 4000   |
    | português | 4500   |
    | português | 5000   |
    | português | 5500   |
    | português | 6000   |
    | português | 6500   |
    | português | 7000   |
    | português | 7500   |
    | português | 8000   |
    | português | 8500   |
    | português | 9000   |
    | português | 9500   |
    | português | 10000  |
    | português | -1000  |
    | português | -1500  |
    | português | -2000  |
    | português | -2500  |
    | português | -3000  |
    | português | -3500  |
    | português | -4000  |
    | português | -4500  |
    | português | -5000  |
    | português | -5500  |
    | português | -6000  |
    | português | -6500  |
    | português | -7000  |
    | português | -7500  |
    | português | -8000  |
    | português | -8500  |
    | português | -9000  |
    | português | -9500  |
    | português | -10000 |
    | inglês    | 0      |
    | inglês    | 1000   |
    | inglês    | 1500   |
    | inglês    | 2000   |
    | inglês    | 2500   |
    | inglês    | 3000   |
    | inglês    | 3500   |
    | inglês    | 4000   |
    | inglês    | 4500   |
    | inglês    | 5000   |
    | inglês    | 5500   |
    | inglês    | 6000   |
    | inglês    | 6500   |
    | inglês    | 7000   |
    | inglês    | 7500   |
    | inglês    | 8000   |
    | inglês    | 8500   |
    | inglês    | 9000   |
    | inglês    | 9500   |
    | inglês    | 10000  |
    | inglês    | -1000  |
    | inglês    | -1500  |
    | inglês    | -2000  |
    | inglês    | -2500  |
    | inglês    | -3000  |
    | inglês    | -3500  |
    | inglês    | -4000  |
    | inglês    | -4500  |
    | inglês    | -5000  |
    | inglês    | -5500  |
    | inglês    | -6000  |
    | inglês    | -6500  |
    | inglês    | -7000  |
    | inglês    | -7500  |
    | inglês    | -8000  |
    | inglês    | -8500  |
    | inglês    | -9000  |
    | inglês    | -9500  |
    | inglês    | -10000 |
