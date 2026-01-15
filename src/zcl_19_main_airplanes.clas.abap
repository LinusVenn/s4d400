CLASS zcl_19_main_airplanes DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_19_main_airplanes IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA airplane  TYPE REF TO zcl_19_airplane.
    DATA airplanes TYPE TABLE OF REF TO zcl_19_airplane.

    out->write( zcl_19_airplane=>number_of_airplanes ).
    TRY.
        airplane = NEW #( id                   = 'D-ABUK'
                          plane_type           = 'Airbus A380-800'
                          empty_weight_in_tons = '227' ).
      CATCH zcx_abap_initial_parameter INTO DATA(z).
        out->write( z->get_text( ) ).
    ENDTRY.
    APPEND airplane TO airplanes.

    out->write( zcl_19_airplane=>number_of_airplanes ).

    TRY.
        airplane = NEW #( id                   = 'D-ABUK'
                          plane_type           = 'Airbus A380-800'
                          empty_weight_in_tons = '227' ).
      CATCH zcx_abap_initial_parameter INTO DATA(x).
        out->write( x->get_text( ) ).
    ENDTRY.

    APPEND airplane TO airplanes.

    out->write( zcl_19_airplane=>number_of_airplanes ).

    TRY.
        airplane = NEW #( id                   = 'D-ABUK'
                          plane_type           = 'Airbus A380-800'
                          empty_weight_in_tons = '227' ).
      CATCH zcx_abap_initial_parameter INTO DATA(y).
        out->write( y->get_text( ) ).
    ENDTRY.

    APPEND airplane TO airplanes.

    out->write( zcl_19_airplane=>number_of_airplanes ).

    LOOP AT airplanes INTO airplane.
      out->write( |{ airplane->id }, { airplane->plane_type }, { airplane->empty_weight_in_tons }t| ).
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
