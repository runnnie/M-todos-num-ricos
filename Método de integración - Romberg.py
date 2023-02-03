

import numpy as np
#Definición de funciones

def f(t):
    m_0=160000
    q = 2500
    u = 1800
    g = 9.8
    
    
    f = u*np.log(m_0/(m_0-q*t))-g*t
    return f

def fsuma(k1,a1,b1):

    v_final = 2**(k1-2)
    fsuma_x = 0

    
    for j in range(1,v_final+1):
        fsuma_x = fsuma_x + f(a1+(2*j-1)*0.5*(b1-a1)/(2**(k1-2)))


    return fsuma_x



print("""
        El programa calcula el valor de una integral definida por el método de Romberg
        la función que tiene el programa es la siquiente v = u*np.log(m_0/(m_0-q*t))-g*t
        la cual da la velocidad a la que viaja un cohete, se integra entre 0 y 30 para 
        obtener el valor de la altura, se pide al usuario el error con el que se desea 
        obtener la integral pero también se obtiene el error con la forma de O(h^8).
        
        v: velocidad en y
        u: velocidad a la cual es combustible se escapa, relativo al cohete
        m_0: masa inicial
        g: aceleración de la gravedad
        u = 1800m/s
        m_0=160kg
        q = 2500kg/s
      """)


a = float(input("Digite el límite inferior: "))
b = float(input("Digite el límite superior: "))


e_requerido = float(input("Digite el error requerido: "))
v_prec=[]








size = 3


R = np.zeros((size, size), dtype=float)
R_aux = np.zeros((size, size), dtype=float)


R[1,1] = (b-a)*0.5*(f(a) + f(b))
R_aux[1,1] = R[1,1]

e_calculado = 32


count = 1

while (count == 1):
    i = size -1
    #Esta parte se encarga de calcular los elementos de la primera columna de la matriz
    #!do i=1,size
    
    
    if (i>=2):
        R[i,1] = 0.5*(R[i-1,1] + (b-a)/(2**(i-2))*fsuma(i,a,b))
        R_aux[i,1] = R[i,1]


    for j in range(2,size):  #inicio del do mas interno

        #La condición if sirve para seleccionar solo aquellos elementos que esten debajo de la matriz triangular inferior
        
        if (j<=i):
            R[i,j] = (4**(j-1)*R[i,j-1]-R[i-1,j-1])/(4**(j-1)-1)
            R_aux[i,j] = R[i,j]


            #print(i,j)
            e_calculado = abs((R[i,j] - R[i,j-1])/R[i,j])
            #print("El error es: ",e_calculado)

        #Le pregunta al usuario si el error calculado es menor o igual al error requerido
            
            if(e_calculado <= e_requerido):
                v_prec.append(i)
                v_prec.append(j)
                break 
        
            
    if(e_calculado <= e_requerido):
        break 
    else:
        
        size = size + 1
        R = 0
        R = np.zeros((size, size), dtype=float)
        
        
        for m in range(1,size-1):
            for n in range(1,size-1):
                if (n<=m):
                    R[m,n] = R_aux[m,n]
                    #print(R_aux[m,n])
                    
                    
        R_aux = 0
        R_aux = np.zeros((size, size), dtype=float)
        
        R[1,1] = (b-a)*0.5*(f(a) + f(b))
        R_aux[1,1] = R[1,1]
        
        
        for m in range(1,size-1):
            for n in range(1,size-1):
                if (n<=m):
                    R_aux[m,n] = R[m,n]


    
    
print("El resultado de la integral con error de la forma O(h^8) es: " + str(R[4,4]))
print("El resultado de la integral con el error " + str(e_requerido) + " es: " + str(R[v_prec[0],v_prec[1]]) )
      #//////////////////////////////////////////////




