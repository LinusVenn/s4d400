CLASS z19_demo09 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z19_demo09 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  SELECT from z19_DEMO07( p_carrierId = 'LH' )
  fields *

  into table @data(flights).

  out->write( flights ).
  ENDMETHOD.
ENDCLASS.
