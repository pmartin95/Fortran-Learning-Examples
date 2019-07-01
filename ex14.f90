!Here do an example with procedural intent, optional arguments, and assumed
!shape objects

module mymods
  implicit none

contains

  subroutine average_data(data1, mean)
    real, intent(in) :: data1(:)
    real, intent(inout) :: mean
    mean = sum(data1)/size(data1)
  end subroutine

  subroutine say_hello(names)
    character(len=*) :: names(:)
    integer :: i
    write(*,'("Hello ",A)') (trim(names(i)),i=1,size(names))
  end subroutine

  subroutine spitout(phrase)
    character(len=*), optional :: phrase
    if(present(phrase)) then
      write(*,*) phrase
    else
      write(*,*) "No phrase given"
    end if
  end subroutine

end module



program ex14
  use mymods
  implicit none
  character(len=10),dimension(2) :: mynames = (/"Jen", "Wil"/)
  real :: R(100000), mu
  call random_number(R)
  call average_data(R,mu)
  call say_hello(mynames)
  write(*,*) mu
  call spitout()
  call spitout("I'm rather hungry")
end program
