CLASS zcl_19_main_vehicles DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_19_main_vehicles IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    " ---------------------------------------------------------------------
    " Deklarationen
    " ---------------------------------------------------------------------

    DATA vehicle  TYPE REF TO zcl_19_vehicle.
    DATA vehicles TYPE TABLE OF REF TO zcl_19_vehicle.

    " ---------------------------------------------------------------------
    " Instanziierungen
    " ---------------------------------------------------------------------

    out->write( zcl_19_vehicle=>number_of_vehicles ).
    vehicle = NEW #( make  = 'Prosche'
                     model = '911' ).

    APPEND vehicle TO vehicles.

    vehicle = NEW #( make  = 'MAN'
                     model = 'TGX' ).

    APPEND vehicle TO vehicles.

    vehicle = NEW #( make  = 'Skoda'
                     model = 'Superb Kombi' ).

    APPEND vehicle TO vehicles.

    LOOP AT vehicles INTO vehicle.
      out->write( |{ vehicle->make } { vehicle->model }| ).
      TRY.
          vehicle->accelerate( 30 ).
          vehicle->brake( 10 ).
          vehicle->accelerate( 50 ).
        CATCH zcx_19_value_too_high.
          out->write( |Maimum speed reached.| ).
      ENDTRY.
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
