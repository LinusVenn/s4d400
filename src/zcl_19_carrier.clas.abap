CLASS zcl_19_carrier DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  data name type string READ-ONLY.
  data airplanes TYPE TABLE OF REF TO ZCL_19_airplane READ-ONLY.

  METHODS constructor
    importing name type string.

  METHODS add_airplane
    importing airplane type REF TO ZCL_19_airplane.

  methods get_biggest_cargo_plane
    RETURNING VALUE(result) type ref to zcl_19_airplane.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_19_carrier IMPLEMENTATION.
  METHOD add_airplane.
    APPEND airplane to airplanes.

  ENDMETHOD.

  METHOD constructor.
    me->name = name.
  ENDMETHOD.

  METHOD get_biggest_cargo_plane.

  ENDMETHOD.

ENDCLASS.
