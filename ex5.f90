!Derived Types
!In this example program, I demonstrate how to make an use data types

program ex5
  use, intrinsic :: iso_fortran_env
  implicit  none

  type book
    character(len=50) :: title, author, subject
  end type book

  type coordinates
    real(kind=REAL64) :: x,y,z
  end type coordinates


  type(book) :: novel1
  type(coordinates) :: particle1, particle2

  !This is how you can call a specific item from a datatype
  novel1%title = "Lessons in Fortran"
  novel1%author = "Paul Martin"
  novel1%subject = "Programming"

  particle1%x= 0.0
  particle1%y= 0.0
  particle1%z= 0.0

  particle2%x= 1.0
  particle2%y= 1.0
  particle2%z= 1.0

  write(*,*) particle2, particle1
  write(*,*) novel1

  !You can also assign equivalent datatypes to each other, ie
  particle1 = particle2
  write(*,*) particle1, particle2
end program
