!Logical Relations and Comparisons
!While briefly seen before in the quadratic equation solver, we now exhaustively
!examine boolean operations in Fortran
program ex6
  implicit none

  logical :: test1

  test1 = 5 > 6

  write(*,*) test1
  test1 = .true.
  write(*,*) test1

  write(*,*) 5 < 6
  write(*,*) 5 > 6
  write(*,*) 5 == 6
  write(*,*) 5 /= 6
  write(*,*) 5 >= 6
  write(*,*) 5 <= 6

  write(*,*) .true. .and. .false.
  write(*,*) .true. .or. .false.
  write(*,*) .not. .false.
  write(*,*) .true. .eqv. .true.
  write(*,*) .true. .neqv. .true.
end program
