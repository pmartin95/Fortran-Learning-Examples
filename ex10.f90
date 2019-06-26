!Arrays
program ex10
  implicit none
  !Two ways of declaring an array
  real, dimension(2,3) :: x
  real ::  y(6)
  !
  ! y = 1.0
  ! x = 5*y + 1
  ! write(*,*) x,y


  y = (/1,2,3,4,5,6/)
  write(*,*) y
  x= reshape(y, (/2,3 /))
  write(*,*) x(1,:)
end program
