

      program problema1
      implicit none

      integer i,j,m,n,size
      integer k,count
      real a,b,e_calculado,e_requerido,abs
      double precision f,fsuma
      double precision , allocatable,dimension(:,:)::R
      double precision , allocatable,dimension(:,:)::R_aux


      write(*,*)"Digite el l?mite a: "     !Le pregunta al usuario los limites de integraci?n
      read(*,*)a
      write(*,*)"Digite el l?mite b:"
      read(*,*)b

      write(*,*)"Ingrese el error requerido: "
      read(*,*)e_requerido


      size = 2
      allocate(R(size,size))
      allocate(R_aux(size,size))


      R(1,1) = (b-a)*0.5*(f(a) + f(b))
      R_aux(1,1) = R(1,1)

      write(*,*)R(1,1)



      e_calculado = 34 !Le asigna un valor arbitrario al error, para luego poder compararlo con el error digitado





      count = 1
      do while(count==1)

      i = size
      !Esta parte se encarga de calcular los elementos de la primera columna de la matriz
      !do i=1,size

      if (i>=2) then
      R(i,1) = 0.5*(R(i-1,1) + (b-a)/(2**(i-2))*fsuma(i,a,b))
      R_aux(i,1) = R(i,1)
      end if



      do j=2,size  !!!inicio del do mas interno


      !La condici?n if sirve para seleccionar solo aquellos elementos que esten debajo de la matriz triangular inferior
      if (j<=i) then
      R(i,j) = (4**(j-1)*R(i,j-1)-R(i-1,j-1))/(4**(j-1)-1)
      R_aux(i,j) = R(i,j)


      write(*,*)i,j
      e_calculado = abs((R(i,j) - R(i,j-1))/R(i,j))
      write(*,*)"El error es: ",e_calculado

      !Le pregunta al usuario si el error calculado es menor o igual al error requerido

      if(e_calculado <= e_requerido) then
      exit  !En caso de que s?, sale del primer for
      end if


      end if

      end do !Final del do mas interno

      if(e_calculado <= e_requerido) then !inicio del if clave
      exit      !En caso de que si sea sale del segundo for

      else  !En caso de que no aumenta el tama?o de la matriz

      size = size + 1


      deallocate(R)
      allocate(R(size,size))



      !copiado de la matriz nueva a los valores de la matriz auxuliar


      do m=1,size-1
      do n=1,size-1
      if (n<=m) then
      R(m,n) = R_aux(m,n)
      write(*,*)R_aux(m,n)
      end if
      end do
      end do


      deallocate(R_aux)
      allocate(R_aux(size,size))

      R(1,1) = (b-a)*0.5*(f(a) + f(b))
      R_aux(1,1) = R(1,1)


      do m=1,size-1
      do n=1,size-1
      if (n<=m) then
      R_aux(m,n) = R(m,n)

      end if
      end do
      end do



      end if     !final del if clave

      !end do      !final del do externo

      end do     !final del do while

      !imprime los elementos de la matriz triangular inferior



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






