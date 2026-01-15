CLASS zcl_19_abap_07 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_19_abap_07 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA(result) = zcl_19_helper=>get_travels( customer_id = 001 ).

    out->write( result ).


    DELETE result WHERE begin_date < cl_abap_context_info=>get_system_date( ).
    DATA result2 TYPE REF TO /dmo/travel.
    LOOP AT result REFERENCE INTO result2.
      result2->booking_fee *= '1.1'.
    ENDLOOP.

    SORT result BY description DESCENDING.

    out->write( result ).

  ENDMETHOD.
ENDCLASS.
