!IF statements
program ex7
  implicit none

  real :: x
  x = 0.0

  !One line if statement
  !if (x < 0.0) x = 0.0
  !If more complicated use something like
  !
  ! if( x < 5.0) then
  !   write(*,*) "x isn't very big. Let's make it big"
  !   x = huge(x)
  !   write(*,*) x
  ! else if( x < 100.0) then
  !   write(*,*) "Wow! x is sort of big"
  ! else
  !   write(*,*) "x is bigger than I expected."
  !   write(*,*) x
  ! end if
  !
  ! When nesting if statements, it can be confusing which if statment you're talking about.
  !To avoid confusion, you should label your if statements

  main: if(x<0.0) then
    write(*,*) "x is negative"
  else main
    if(x < epsilon(x)) write(*,*) "x is basically 0.0"
    write(*,*) "x is non-negative"
  end if main

end program
