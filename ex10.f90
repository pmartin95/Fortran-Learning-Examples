!Arrays
program ex10
  implicit none
  !Two ways of declaring an array
  integer,dimension(6) :: a
  real, dimension(0:9) :: b
  logical, dimension(2,2) :: yes_no

  integer, dimension(8) :: x, z(16)
  real :: alpha(1:3), beta(4:9)
  real, dimension(0:5,12:45,6) :: data
  character(len=10) :: names(25)

  real ::  y(9)
  integer :: i

  !
  ! y = 1.0
  ! x = 5*y + 1
  ! write(*,*) x,y
  !Fortran indexes starting from 1. We can assign values easily with loops

  do i =1,size(y)
    y(i) = (i-1)/real(size(y))
  end do

  !We can print an array element by element or all at the same time
  do i =1,6
    write(*,*) y(i)
  end do
  write(*,*) y

end program
