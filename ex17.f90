!Here we demonstrate the usage of allocatable arrays
program ex17
  implicit none
  real, allocatable :: x(:)
  real :: rand
  integer :: N

  call random_number(rand)
  N = 10000 * rand
  allocate(x(N))


  call random_number(x)
  write(*,*) "The average is ", sum(x)/size(x)
  write(*,'(A,L7)') "Is the array allocated? ", allocated(x)
  deallocate(x)
  write(*,'(A,L7)') "Is the array allocated? ", allocated(x)
end program
