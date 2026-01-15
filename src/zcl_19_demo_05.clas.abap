CLASS zcl_19_demo_05 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_19_demo_05 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    try.
      data(result) = ZCL_19_CALCULATOR=>divide( operand1 = 5 operand2 = 0 ).
      out->write( result ).
    catch cx_sy_zerodivide into data(x).
      out->write( x->get_text(  ) ).
    ENDTRY.
  ENDMETHOD.
ENDCLASS.
