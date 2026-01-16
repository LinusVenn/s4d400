CLASS zcl_19_airplane DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA id TYPE string READ-ONLY.
    DATA plane_type TYPE string READ-ONLY.
    DATA empty_weight_in_tons TYPE i READ-ONLY.

    CLASS-DATA number_of_airplanes TYPE i READ-ONLY.

    METHODS constructor
      IMPORTING
        id TYPE string
        plane_type TYPE string
        empty_weight_in_tons type i
        raising ZCX_ABAP_INITIAL_PARAMETER.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_19_airplane IMPLEMENTATION.


  METHOD constructor.
    me->id = id.
    me->plane_type = plane_type.
    me->empty_weight_in_tons = empty_weight_in_tons.
    number_of_airplanes += 1.

    IF id IS INITIAL OR plane_type IS INITIAL OR empty_weight_in_tons IS INITIAL.
      raise exception new ZCX_ABAP_INITIAL_PARAMETER( id ).
    endif.

  ENDMETHOD.

ENDCLASS.
