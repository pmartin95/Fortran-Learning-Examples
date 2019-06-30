!Here we see how loops are done in Fortan.
!Every type of loop seen in C/C++ is done with a do loop in Fortran
!C's "for loops" are clearly very similar, but do-while and while loops
!are also done with do loops here.
program ex9
  implicit none
  integer :: i
  real :: x
  !An iterated do loop
  ! You can also name loops
  do i =1,10,2
    write(*,*) i
  end do

  !A loop without bounds
  i = 1

!This is an example of a C style do-while loop
  main:do
    condition1: if (i <= 10) then
      write(*,'(I2)',advance='no') i
      i = i + 1
      cycle main !Note that there's no need to do more if checks past this point
                ! because they're mutually exclusive. So I just tell it to cycle
                !to the next stage of the loop.
    end if condition1

    condition2: if(i >=10) then
      write(*,*) 2 * i
    end if condition2

    if(i > 20) then
      exit main
    end if

    i = i + 1
  end do main

  !Below I create a C style while loop. I use "while" as my loop, but for
  !for clarity, I could have used any label. For my demonstation,
  !I'll actually determine the machine precision, or what would be given by then
  !epsilon function
  x = 1.0
  while1: do
    if(.not. (1.0 + x> 1.0) ) exit while1
    x = x /2.0
  end do while1
  write(*,*) "The machine precision is ", 2*x, epsilon(x)
end program
