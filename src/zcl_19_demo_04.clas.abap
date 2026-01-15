CLASS zcl_19_demo_04 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_19_demo_04 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    while sy-index <= 10.
      out->write( sy-index ).
    endwhile.

    do 10 times.
      out->write( sy-index ).
    enddo.


  ENDMETHOD.
ENDCLASS.
