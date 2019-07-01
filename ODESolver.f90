module odeint
  use, intrinsic :: iso_fortran_env
  implicit none
  integer, parameter :: dp = REAL64

!This is the abstract interface that I'll use to define procedural pointers
!later in the code. Note the I/O format of the function. The idea is that
! in the system of differential equations,
!                                          y1' = f1(y1,y2,...,yN,x )
!                                          y2' = f2(y1,y2,...,yN,x )
!                                                   ...
!                                          yN' = fN(y1,y2,...,yN,x )
! We can group together these functions such that they take in an array
! of y variables and an x. They then return the differential part of the above
!equation.
  abstract interface
    function funcyx(y,x)
      import dp
      real(kind=dp) :: y(:)
      real(kind=dp) :: x
      real(kind=dp) ::funcyx(size(y))
    end function
  end interface

contains
!RK4 ODE Solver-----------7/2/2019-------------------------------Paul M. Martin
!=============
!The idea is that we want to give this function a set of first order
!differential equations and a set of x values over which it needs to find the
!solutions of these differential equations.
function RK4(f_ptr,N, x, ic) result(y)
  !Function Arguments
  !------------------
  procedure(funcyx), pointer, intent(in) :: f_ptr !This function
                                        !Represents the broken down first order
                                        !ODEs
  integer, intent(in) :: N !The number of y's
  real(kind=dp), intent(in) :: x(:) !The coordinates to find the solution
                                    !of the ODE at
  real(kind=dp), intent(in) :: ic(N) ! (y1,y2,...,yN) x1 is given in the x
  real(kind=dp) :: y(N,size(x))

  !Variable Declaration
  !--------------------
  real(kind=dp) :: h
  real(kind=dp), dimension(N) :: k1,k2,k3,k4
  integer :: i

  !Main Calculataion Step
  !----------------------
  !You don't need to pay attention to this part. You can treat it as a black box
  !for the purposes of this activity
  y(:,1) = ic
  do i = 2,size(x)
    h =  x(i)- x(i-1)
    k1(:) = h * f_ptr( y(:,i-1) ,x(i-1))
    k2(:) = h * f_ptr( y(:,i-1) + k1/2.0_dp,x(i-1)+h/2.0_dp)
    k3(:) = h * f_ptr( y(:,i-1) + k2/2.0_dp,x(i-1)+h/2.0_dp)
    k4(:) = h * f_ptr( y(:,i-1)+ k3 ,x(i-1)+h)
    y(:,i) = y(:,i-1) + (k1 + 2.0_dp * k2 + 2.0_dp * k3 + k4  )/6.0_dp
  end do
end function



!Array Generator
!---------------
!I thought it might be useful to have a function to generate an array of
!evenly spaced points for the RK4 method. It works exactly the same
! as np.linspace - Paul
function linspace(a,b,N) result(x)
  real(kind=dp), intent(in) :: a,b
  integer, intent(in ) :: N
  real(kind=dp) :: x(N)

  integer :: i
  real(kind=dp) :: inv
  inv = 1.0_dp /real(N-1,kind=dp) * (b-a)
  do i = 0,N-1
    x(i+1) = a +  i * inv
  end do
end function



!Linear Interpolator
!-------------------
!You give this function two coordinates and an x value.
!This function then returns the linearly interpreted value of the function
!At that point.
function linearInterp2D(x0,y0,x) result(y)
  real(kind=dp), intent(in), dimension(2) :: x0, y0
  real(kind=dp), intent(in) :: x
  real(kind=dp) :: y
  real(kind=dp) :: m ,b
  m = (y0(2)-y0(1))/(x0(2)-x0(1))
  b = y0(2) - m*x0(2)
  y = m*x + b

end function





end module
