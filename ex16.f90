!Here I show some advanced examples of interfaces
! While pointers are outside of the scope of this lecture,
! I briefly go over procedure pointers so we can use them in examples.
!Also I do an example of operator overloading
module exmp
  implicit none
  interface swap
    module procedure rswap, iswap
  end interface

  interface operator (+)
    module procedure concat
  end interface

  abstract interface
    function func(x)
      real :: x
      real ::  func
    end function
  end interface

contains
    subroutine rswap(a,b)
      real, intent(inout) :: a,b
      real :: temp
      temp = a
      a = b
      b = temp
    end subroutine

    subroutine iswap(a,b)
      integer, intent(inout) :: a,b
      integer :: temp
      temp = a
      a = b
      b = temp
    end subroutine

    function concat(string1,string2)
      character(len=*), intent(in) :: string1
      character(len=*), intent(in) :: string2
      character(len=(len_trim(string1)+len_trim(string2))) :: concat
      concat = string1//string2
    end function

    function f(x)
      real :: x
      real :: f
      f = x**2
    end function

    function g(x)
      real :: x
      real :: g
      g  = x**3
    end function

    subroutine printVals(f_ptr)
      procedure(func), pointer :: f_ptr
      real :: x(3) = (/0.0,1.0,2.0 /)
      integer :: i
      write(*,*) (f_ptr(x(i)),i=1,3     )
    end subroutine
end module


program ex16
  use exmp
  implicit none
  real :: x = 5.0, y=0.0
  integer :: i = 1, j = 2
  procedure(func), pointer :: f_ptr => NULL()

  f_ptr => f
  write(*,*) f_ptr(2.0)
  f_ptr => g
  write(*,*) f_ptr(2.0)
  call printVals(f_ptr)


  write(*,*)"i is ", i, "j is ", j
  write(*,*) "x is ",x, "y is ", y

  call swap(x,y)
  call swap(i,j)

  write(*,*)"i is ", i, "j is ", j
  write(*,*) "x is ",x, "y is ", y

  write(*,*) "Hello" + " Paul "
end program
