!Introduction to functions and subroutine and modules
!Also introduces the save attribute
!Also, built a timer routine


!Example of a module
module examplemod
  implicit none
  character(len=*), parameter :: timefmt = "(I2,' hours ', I2, ' minutes &
                & ', I2, ' sec ', I4, ' ms')"

contains
  subroutine PrintAPhrase(phrase)
    character(len=*), intent(in) :: phrase
    write(*,*) phrase
  end subroutine

  subroutine Timer()
    integer, save :: time1(8), time2(8)
    integer :: tdiff(8)
    logical,save :: timetaken=.false.

    if(timetaken) then
      call date_and_time(VALUES=time2)
      tdiff = time2-time1
      write(*,timefmt) tdiff(5:8)
      timetaken=.false.
    else
      call date_and_time(VALUES=time1)
      timetaken=.true.
    end if
  end subroutine
end module


program ex13
  use examplemod
  use, intrinsic :: iso_fortran_env
  implicit none


  interface
    subroutine external_sub()
    end subroutine
  end interface


  integer(kind=INT64) :: i, tot = 0
  call Timer()
  call external_sub()
  write(*,*) f(2.0)
  call PrintAPhrase("Where does this subroutine come from?")
  do i =1,1000000000
    tot = tot + i
  end do
  write(*,*) tot
  call Timer()

contains
  !An example of an internal function
  function f(x)
    real :: f
    real :: x
    f = 5.0*x + 1
  end function
end program


!Example of an external subroutine
subroutine external_sub()
  write(*,*) "Hello world"
end subroutine
