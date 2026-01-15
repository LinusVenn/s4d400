CLASS zcl_19_demo_02 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_19_demo_02 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  data result_i TYPE i.
  DATA result_p type p length 8 decimals 3.

**********************************************************************
* Mathematische Operatoren
**********************************************************************

  result_i = 5 + 3.
  out->write(  result_i ).

  result_i = 5 - 3.
  out->write( result_i ).

  result_i = 5 * 3.
  out->write( result_i ).

  result_p = 5 / 3.
  out->write( result_p ).

  result_i = 5 div 3.
  out->write( result_i ).

  result_i = 5 mod 3.
  out->write( result_i ).

  result_i = 5 ** 3.
  out->write( result_i ).

  result_i = result_i + 1.
  out->write( result_i ).
  result_i += 1.
  out->write( result_i ).
  "add 1 to result_i.
  "out->write( result_i ).

**********************************************************************
*Numerische Funktionen
**********************************************************************

  result_i = sqrt( 9 ).
  out->write( result_i ).

  result_p = round( val = '47.895' dec = 2 ).
  out->write( result_p ).







  ENDMETHOD.
ENDCLASS.
