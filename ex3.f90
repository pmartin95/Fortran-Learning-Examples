!This program takes in the coefficients of a quadratic equation
! ax^2 + bx + c = 0 and returns the solutions
!Also, introduces conditional logic in Fortran

program ex3
  implicit none

  real :: a,b,c
  real :: discriminant
  real :: e
  integer  :: i

  write(*,*) "Welcome to the quadratic equation solver."
  write(*,*) ("*",i=1,40)
  write(*,*) "I solve the equation ax^2 + bx + c = 0"
  write(*,'(A)', advance='no') "What are your coefficients?  "
  read(*,*) a,b,c


  discriminant = b**2 - 4.0 * a *c
  e = b*epsilon(b)

  !Case 1: discriminant is zero
  !Note how I'm detecting if the discriminant is zero. Above, I calculate e to
  !be the machine precision of b. That is, the smallest number that I can add
  !to b and it still actually change the number.
  if (abs(discriminant) < abs(e)) then
    write(*,*) "The solution is ", -b/2.0/a



  !Case 2: discriminant is greater than zero
  else if(discriminant > 0.0) then
    write(*,*) "The solutions are:"
    write(*,*) (-b + sqrt(discriminant))/2.0/a
    write(*,*) (-b - sqrt(discriminant))/2.0/a



  !Case 3: discriminant is less than zero
  else
    write(*,*) "The complex solutions are:"
    write(*,*) (-b + sqrt( cmplx(discriminant) ))/2.0/a
    write(*,*) (-b - sqrt( cmplx(discriminant)))/2.0/a
  end if

end program
