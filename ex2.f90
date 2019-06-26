!Now let's write a program to demonstrate the basic data types
! and how to do basic I/O

program ex2
  implicit none

  real :: x
  integer :: i
  complex :: z
  character(len=50) :: name

  x = 9.0
  i = 5
  z = (4.0,5.0)
  write(*,*) "What is your name?"
  read(*,*) name

  write(*,*) "Nice to meet you, ", trim(name), "!"
  write(*,*) "The x variable holds ", x
  write(*,*) "The i variable holds ", i

  write(*,*) "The z variable holds ", z
  write(*,*) "The conjugate of z is ", conjg(z)
  write(*,*) "The square root of z is ", sqrt(z)
end program
