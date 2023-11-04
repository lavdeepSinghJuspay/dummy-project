import requests

url = 'http://localhost:8080/api'

try:
    response = requests.get(url)
    if response.status_code == 200:
        print('Request to Flask service succeeded.')
        exit(0)
    else:
        print('Request to Flask service failed.')
        print(f'\nStatus Code: {response.status_code}', flush=True)
        exit(1)
except requests.exceptions.RequestException as e:
    print(f'Error making the request: {str(e)}')
    exit(1)
