class Animal:
    def __init__(self,sexo):
            self.sexo=sexo
    def __str__(self):
            pass
class perro(Animal):
    def sonidoanimal(self,sonido):
            print("El sonido del perro es:",sonido)
class gato(Animal):
    def sonidoanimal(self,sonido):
            print("El sonido del gato es:",sonido)
mascota1=perro('hembra')
mascota2=gato('macho')
print("El sexo de la mascota 1 es: ",mascota1.sexo)
print("El sexo de la mascota 2 es: ",mascota2.sexo)
mascota1.sonidoanimal("guau")
mascota2.sonidoanimal("miau")
