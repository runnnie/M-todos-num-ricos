


def f(x,y):
    func = x*y
    return func





print("Límites de la integral interior: ")
c = float(input("Digite el límite inferior c = "))
d = float(input("Digite el límite superior d = "))

print("Límites de la integral exterior: ")
a = float(input("Digite el límite inferior a = "))
b = float(input("Digite el límite superior b = "))

e_requerido = float(input("Ingrese el error requerido: "))

N1 = 5
N2 = 5
e_calculado = 1
suma_a = 0

while(e_calculado >= e_requerido):
    suma = 0
    y = a
    for i in range(1,N2+1):
        x = c
        for j in range(1,N1+1):
            suma = suma + f(x,y)
            x = c + j*(d-c)/N1
            
        y = a + i*(b-a)/N2
    suma = suma*(d-c)*(b-a)/(N1*N2)

    print("El valor de la integral para la presisición: ",N1)
    print(str(suma))

    e_calculado = (suma - suma_a)/suma
    N1 = N1*2
    N2 = N2*2
    suma_a = suma
    
print("El valor de la integral con el error requerido es de: ")
print(str(suma))


