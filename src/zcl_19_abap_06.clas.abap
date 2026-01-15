CLASS zcl_19_abap_06 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_19_abap_06 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    out->write( zcl_19_helper=>get_travel_with_customer( travel_id = '00000010' ) ).
  ENDMETHOD.
ENDCLASS.
