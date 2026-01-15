CLASS zcl_19_abap_05 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_19_abap_05 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA customer TYPE Z19_CUSTOMER_INFO.
    customer-customer_id = '15'.
    try.
      out->write( ZCL_ABAP_HELPER=>get_customer( customer_id = customer-customer_id ) ).
    catch zcx_abap_no_data into data(x).
      out->write( x->get_text( ) ).
    ENDTRY.
  ENDMETHOD.
ENDCLASS.
