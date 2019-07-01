!Arrays
!In this program, I demonstrate some basic array operations
program ex10
  implicit none
  !Two ways of declaring an array
  character(len=*), parameter :: fmt = '(8F10.2)'
  integer,dimension(6) :: a
  real, dimension(0:9) :: b
  integer :: i
  real, dimension(8) :: x, z(9)
  real :: alpha(1:3), beta(4:9)
  real, dimension(0:5,12:45,6) :: data
  character(len=10) :: names(25)

  real ::  y(8)


  !Assigning numbers to arrays
  z(1:4) = 0.0
  z(5:9) = 1.0

   y = 1.0
   x = 5.0*y + z(1:8)
   write(*,fmt) x
   write(*,fmt) y
   write(*,fmt) z(:8)

  do i =1,size(y)
    y(i) = (i-1)/real(size(y))
  end do

  !We can print an array element by element or all at the same time
  do i =1,6
    write(*,*) y(i)
  end do
  write(*,*) y

end program
