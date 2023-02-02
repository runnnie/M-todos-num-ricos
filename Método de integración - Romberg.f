

      program problema1
      implicit none

      integer i,j
      integer k
      real a,b,e_calculado,e_requerido,abs
      double precision f,fsuma
      double precision , allocatable,dimension(:,:)::R

      write(*,*)"Digite el valor de k: "
      read(*,*)k
      allocate(R(k,k))

      write(*,*)"Digite el l�mite a: "     !Le pregunta al usuario los limites de integraci�n
      read(*,*)a
      write(*,*)"Digite el l�mite b:"
      read(*,*)b

      write(*,*)"Ingrese el error requerido: "
      read(*,*)e_requerido



      R(1,1) = (b-a)*0.5*(f(a) + f(b))




      e_calculado = 34 !Le asigna un valor arbitrario al error, para luego poder compararlo con el error digitado




      !Esta parte se encarga de calcular los elementos de la primera columna de la matriz
      do i=1,k
      if (i>=2) then
      R(i,1) = 0.5*(R(i-1,1) + (b-a)/(2**(i-2))*fsuma(i,a,b))
      end if



      do j=2,k

      !La condici�n if sirve para seleccionar solo aquellos elementos que esten debajo de la matriz triangular inferior
      if (j<=i) then
      R(i,j) = (4**(j-1)*R(i,j-1)-R(i-1,j-1))/(4**(j-1)-1)


      write(*,*)i,j
      e_calculado = abs((R(i,j) - R(i,j-1))/R(i,j))
      write(*,*)"El error es: ",e_calculado



      !Le pregunta al usuario si el error calculado es menor o igual al error requerido
      if(e_calculado <= e_requerido) then
      exit


      end if
      end if




      end do

      if(e_calculado <= e_requerido) then
      exit
      end if

      end do



      !imprime los elementos de la matriz triangular inferior
      do i=1,k
      do j=1,k

      if (j<=i) then

      write(*,*)R(i,j)


      end if


      end do
      end do



      pause
      end program problema1


      !//////////////////////////////////////////////
      real function fsuma(k1,a1,b1)
      integer k1
      real a1,b1
      integer v_final




      v_final = 2**(k1-2)


      fsuma = 0

      do j=1,v_final

      fsuma = fsuma + f(a1+(2*j-1)*0.5*(b1-a1)/(2**(k1-2)))


      end do



      return
      end function


      !//////////////////////////////////////////////

      real function f(x1)
      real x1

      f = 1/x1

      return
      end function


      !//////////////////////////////////////////////
      real function abs(num)
      real num

      if(num<0) then

      num = -num

      end if
      if(num>0) then

      num = num
      end if

      abs = num

      return
      end function


      !//////////////////////////////////////////////






