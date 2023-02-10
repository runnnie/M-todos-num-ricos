


      !!En este programa la integral interior es en termino de las

      program programa2
      implicit none
      double precision e_calculado,e_requerido,sum,sum_a
      real x,y,a,b,c,d,f
      integer i,j,N1,N2
      
      
      
      write(*,*)"Limites de la integral interior: "
      write(*,*)"Ingrese el l¡mite inferior c = "
      read(*,*)c
      write(*,*)"Ingrese el l¡mite superior d = "
      read(*,*)d
      
      write(*,*)"Limites de la integral exterior: "
      write(*,*)"Ingrese el l¡mite inferior a = "
      read(*,*)a
      write(*,*)"Ingrese el l¡mite superior b = "
      read(*,*)b
      
      
      
      write(*,*)"Ingrese el error requerido: "
      read(*,*)e_requerido
      
      
      


      N1=5    !variable que contrala la n en x
      N2=5    !variable que controla la n en y
      e_calculado = 1
      sum_a = 0   !Establece el valor de la variable auxuliar de suma como igual a cero, asï¿½ el
      !error calculado serï¿½ 1 en la primera iteraciï¿½n
      do while (e_calculado >= e_requerido)
      
      


      sum = 0

      y = a
      do i=1,N2


      x = c
      do j=1,N1
      
         sum = sum + f(x,y)


         x = c + j*(d-c)/N1
      
      end do
      y = a + i*(b-a)/N2

      end do
      
      sum = sum*(d-c)*(b-a)/(N1*N2)

      write(*,*)"El valor de la integral para la presicion: ",N1
      write(*,*)sum
      


      e_calculado = (sum - sum_a)/sum
      WRITE(*,*)"El error calculado es de: "
      write(*,*)e_calculado


      N1 = N1*2
      N2 = N2*2
      sum_a = sum
      
      end do


      write(*,*)"El valor de la integral con el error requerido es de: "
      write(*,*)sum
      
      
      
      
      pause
      end program programa2
      
      
      
      real function f(x,y)
      real x,y
      
      f = x*y
      
      return
      end function
