!1. Explore the precision of built-in data types
!2. Look at type casting

program ex4
  implicit none
  integer, parameter ::&
    sp = kind(1.0), &
    dp = selected_real_kind( 2* precision(1.0_sp)  ), &
    qp = selected_real_kind( 2* precision(1.0_dp)  )

  integer, parameter::&
    isp = kind(1),&
    idp = 2  * isp, &
    iqp = 2 * idp



  real :: x
  real(kind=sp) :: x1
  real(kind=dp) :: x2
  real(kind=qp) :: x3

  integer(kind=isp) :: i1
  integer(kind=idp) :: i2
  integer(kind=iqp) :: i3


  x = 0.0
  x1 = 0.0_sp
  x2 = 0.0_dp
  x3 = 0.0_qp

  i1 = 1_isp
  i2 = 1_idp
  i3 = 1_iqp

  write(*,*) sp, dp, qp
  write(*,*) x, kind(x), precision(x), range(x)
  !What is the default kind of real number?


  write(*,*) x1, kind(x1), precision(x1), range(x1), epsilon(x1)
  write(*,*) x2, kind(x2), precision(x2), range(x2), epsilon(x2)
  write(*,*) x3, kind(x3), precision(x3), range(x3), epsilon(x3)

  write(*,*) isp, idp, iqp
  write(*,*) huge(i1), huge(i2), huge(i3)

  x1 = 4.0_sp * atan(1.0_sp)
  x2 = 4.0_dp * atan(1.0_dp)
  x3 = 4.0_qp * atan(1.0_qp)
  write(*,*) x1,x2,x3

  !Typecasting Time

  write(*,*) x3
  write(*,*) real(x3,kind=dp)
  write(*,*) real(x3,kind=sp)
  write(*,*) int(x3*1.0E10,kind=isp)
  write(*,*) int(x3*1.0E20,kind=idp)
  write(*,*) int(x3*1.0E38,kind=iqp)


end program
