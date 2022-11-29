import requests
url = 'https://api.apis.net.pe/v1/tipo-cambio-sunat'
response = requests.get(url)
response.json() 
data = response.json()
compra = data['compra']
venta = data['venta']
fecha_actual = data['fecha']
print("El costo del dolar en la compra es: ",compra)
print("El costo del dolar en la venta es: ",venta)
print("La fecha del proceso de cambio actual del dolar es: ",fecha_actual)