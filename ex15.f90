!Demonstrate how to use recursive functions
!i.e., a function that calls itself.
program ex15
  implicit none
  write(*,*) factorial(10)


contains
  recursive function factorial(N) result(res)
    integer :: res
    integer :: N
    if(N ==1) then
      res = 1
    else
      res = N * factorial(N-1)
    end if
  end function
end program
