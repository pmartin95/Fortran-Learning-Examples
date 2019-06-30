program ex11
  !This program demonstrates how to reshape a one dimensional array into
  !a two-dimensional array. Be sure to make sure that both arrays have the same
  !number of elements. "Padding" the array's missing elements is outside the
  !scope of this lecture and this example. -Paul M.
  implicit none
  integer , dimension(20) :: a
  integer, dimension(5,4) :: b
  integer :: i
  character(len=*), parameter :: fmt = "(4I10)"

  !For demonstration purpose, let's construct an array of consecutive integers
  do i = 1,20
    a(i) = i
  end do

  !Fortran by default does column major reshaping
  !Without using any attributes, the default reshaping looks like this:
  b = reshape(a   ,  shape(b)   )
  do i =1,5
    write(*,fmt) b(i,:)
  end do

  !By adding the "order = (/2,1/)" argument, reshape becomes row major
  !by varying the column indices first.
  b = reshape(a   ,  shape(b) ,   order = (/2,1/)   )
  do i =1,5
    write(*,fmt) b(i,:)
  end do
end program
