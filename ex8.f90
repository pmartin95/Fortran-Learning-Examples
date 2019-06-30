!While not particularly useful to us, here is how to use Fortran's version
!of select cases

program ex8
  implicit none
  integer :: month
  month = 1

  select case (month)
    case(4,5)
      write(*,*) "Spring"
    case(6,7)
      write(*,*) "Summer"
    case(8:10)
      write(*,*) "Autumn"
    case(1:3,11:12)
      write(*,*) "Winter"
    case default
      write(*,*) " Not a month"
  end select
end program
