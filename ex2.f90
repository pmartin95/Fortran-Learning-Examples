!Now let's write a program to demonstrate the basic data types
! and how to do basic I/O as well as operations
program ex2
  implicit none

  real :: x,y
  integer :: i,j
  complex :: z,w
  character(len=50) :: name

  x = 9.0
  y = 3.0
  i = 5
  j = 3
  z = (4.0,5.0)
  w = (2.0,9.0)

  !1. Basic IO
  write(*,*) "What is your name?"
  read(*,*) name
  write(*,*) "Nice to meet you, ", trim(name), "!"


  !2. Outputting strings and variables
  write(*,*) "The x variable holds ", x
  write(*,*) "The i variable holds ", i

  write(*,*) "The z variable holds ", z
  write(*,*) "The real part of z is", real(z)
  write(*,*) "The imaginary part of z is ", imag(z)
  write(*,*) "The conjugate of z is ", conjg(z)
  write(*,*) "The square root of z is ", sqrt(z)

  !3. Now let's demonstrate some basic operations
  write(*,*) "Adding and subtracting: ", x+ y, i - j, z + w
  write(*,*) "Multiplying: ", x*y,i*j,z*w
  write(*,*) "Dividing: ", x/y , i/j, z/w
  write(*,*) "Exponentiating: ", x**y, i**j, z**w


end program
