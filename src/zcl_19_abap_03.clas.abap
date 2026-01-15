CLASS zcl_19_abap_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_19_abap_03 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA operand1 type p length 10 decimals 2 VALUE '5.00'.
    DATA operand2 TYPE p length 10 decimals 2 VALUE '9.00'.
    DATA operator TYPE c VALUE 'p'.
    DATA result TYPE p length 10 decimals 2.

    DATA operand3 TYPE Z19_DECIMAL VALUE '5'.
    DATA operand4 TYPE Z19_DECIMAL VALUE '3'.
    DATA exp TYPE i VALUE 3.

    case operator.
      when '+'.
        result = operand1 + operand2.
        out->write( |{ operand1 NUMBER = USER } { operator } { operand2 NUMBER = USER } = { result NUMBER = USER }| ).

      when '-'.
        result = operand1 - operand2.
        out->write( |{ operand1 NUMBER = USER } { operator } { operand2 NUMBER = USER } = { result NUMBER = USER }| ).

      when '*'.
        result = operand1 * operand2.
        out->write( |{ operand1 NUMBER = USER } { operator } { operand2 NUMBER = USER } = { result NUMBER = USER }| ).

      when '/'.
        result = operand1 / operand2.
        out->write( |{ operand1 NUMBER = USER } { operator } { operand2 NUMBER = USER } = { result NUMBER = USER }| ).

      when 'p'.
        try.
          result = ZCL_ABAP_CALCULATOR=>CALCULATE_POWER( base = CONV Z00_DECIMAL( operand1 ) exponent = CONV i( operand2 ) ).
          out->write( result ).
        CATCH zcx_abap_exponent_too_high into data(x).
          out->write( x ).
        endtry.

      when '%'.
        result = ZCL_19_CALCULATOR=>CALCULATE_PERCENTAGE( percentage = CONV Z19_DECIMAL( operand3 ) base = CONV Z19_DECIMAL( operand4 ) ).
        out->write( result ).
    ENDCASE.





  ENDMETHOD.
ENDCLASS.
