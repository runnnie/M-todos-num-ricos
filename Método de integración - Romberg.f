

      program problema1
      implicit none

      integer i,j
      integer k
      real a,b,h
      double precision f,fsuma
      double precision , allocatable,dimension(:,:)::R

      write(*,*)"Digite el valor de k: "
      read(*,*)k
      allocate(R(k,k))

      write(*,*)"Digite el l¡mite a: "
      read(*,*)a
      write(*,*)"Digite el l¡mite b:"
      read(*,*)b


      h = b-a
      R(1,1) = h*0.5*(f(a) + f(b))



      do i=2,k
      R(i,1) = 0.5*(R(i-1,1) + (b-a)/(2**(i-2))*fsuma(i,a,b))
      end do

      do i=1,k
      write(*,*)R(i,1)
      end do

      !Extrapolacion de richarson

      do i=1,k
      do j=2,k

      if (j<=i) then


      R(i,j) = (4**(j-1)*R(i,j-1)-R(i-1,j-1))/(4**(j-1)-1)

      end if



      end do
      end do

      write(*,*)R(k,k)

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


