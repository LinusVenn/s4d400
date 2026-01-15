CLASS zcl_19_vehicle DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    DATA make TYPE string READ-ONLY.
    DATA model TYPE string READ-ONLY.
    DATA speed_in_kmh TYPE i READ-ONLY.

    METHODS constructor
      IMPORTING
        make TYPE string
        model TYPE string.

   methods:

      accelerate importing value type i raising zcx_19_value_too_high,
      brake importing value type i raising zcx_19_value_too_high.


      CLASS-DATA number_of_vehicles type i READ-ONLY.


  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_19_vehicle IMPLEMENTATION.




  METHOD accelerate.

    if speed_in_kmh + value > 300.
      raise exception new zcx_19_value_too_high( value = value ).

    endif.
    speed_in_kmh += value.
  ENDMETHOD.

  METHOD brake.
    if value > speed_in_kmh.
      raise exception new zcx_19_value_too_high( value = value ).
    endif.
    speed_in_kmh -= value.
  ENDMETHOD.

  METHOD constructor.
    me->make  = make.
    me->model = model.

    number_of_vehicles += 1.
  ENDMETHOD.

ENDCLASS.
