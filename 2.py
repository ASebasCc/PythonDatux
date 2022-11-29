class Catalogo:
        productos=[]
        def __init__(self,productos=[]):
            self.productos=productos
        def agregar(self,prod):
            self.productos.append(prod)
        def mostrar(self):
            for prod in self.productos:
                print(prod)            
class Producto:
        def __init__(self,nombre,cantidad):
            self.nombre=nombre
            self.cantidad=cantidad
            print('Se ha agregado el producto:', self.nombre)
        def __str__(self):
            return ''.format()
prod=Producto("leche condensada",20)   
c=Catalogo([prod])
c.mostrar()
c.agregar(Producto("milo",15))
c.mostrar()