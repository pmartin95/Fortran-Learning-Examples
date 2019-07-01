!Now we should concern ourselves with more advanced array operations
!1. Masks
!2. Where
!3. Merge
!4. Spread
!5. Size
program ex12
  implicit none
  real :: a(3) = (/ 1.0, 3.0, 7.0/)
  real :: b(3) = 0.0
  real :: c(3)
  integer :: N(5) = (/1,2,3,4,5 /)
  integer :: Nexpanded(5,5), i
  logical :: a_mask(3), test1,test2,test3
  c = a
  !Below is a mask, that is an array of logical variables.
  write(*,*) a>5
  a_mask = a>5
  !We can use a merge statement to combine a and b based on the mask
  write(*,*) merge(b,a,a_mask)

  !Alternatively to the above, we can use the where statement
  where(c>5) c = 0.0
  write(*,*) c

  !We can use the all() function to test all the elements of a function
  test1 = all(N < 10) !True
  test2 = all(N>10) !False
  test3 = all(N>0 .and. test1) !True

  !We can use the spread function to create duplicates of a vector across an
  !array. Good for creating meshes

Nexpanded =   spread(N, dim=1, ncopies=5)
write(*,'(5I2)') (Nexpanded(i,:),i=1,5)
end program
