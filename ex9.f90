!Loops
program ex9
  implicit none
  integer :: i

  !An iterated do loop
  ! You can also name loops
  do i =1,10,2
    write(*,*) i
  end do

  !A loop without bounds
  i = 1

  main:do
    condition1: if (i <= 10) then
      write(*,'(I2)',advance='no') i
    end if condition1

    condition2: if(i >=10) then
      write(*,*) 2 * i
    end if condition2

    if(i > 20) then
      exit main
    end if

    i = i + 1
  end do main




end program
