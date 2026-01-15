CLASS zcl_19_calculator DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    class-methods divide
      importing
        operand1 TYPE Z19_DECIMAL
        operand2 TYPE Z19_DECIMAL
      RETURNING VALUE(result) type Z19_DECIMAL
      RAISING cx_sy_zerodivide.

    CLASS-methods calculate_percentage
      importing
        percentage TYPE Z19_DECIMAL
        base TYPE Z19_DECIMAL
      RETURNING VALUE(percentage_value) TYPE Z19_DECIMAL.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_19_calculator IMPLEMENTATION.



  METHOD divide.
  " Eingabeprüfung
    if operand2 is initial.
      raise exception TYPE cx_sy_zerodivide.
    endif.

    result = operand1 / operand2.
  ENDMETHOD.

  METHOD calculate_percentage.

    percentage_value = base * percentage.
  ENDMETHOD.

ENDCLASS.
