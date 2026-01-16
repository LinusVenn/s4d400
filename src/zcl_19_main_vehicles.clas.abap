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
    DATA truck type ref to zcl_19_truck.

    " ---------------------------------------------------------------------
    " Instanziierungen
    " ---------------------------------------------------------------------

    out->write( zcl_19_vehicle=>number_of_vehicles ).
    vehicle = NEW zcl_19_car( make  = 'Prosche'
                              model = '911'
                              seats = 2 ).

    APPEND vehicle TO vehicles.

    vehicle = NEW zcl_19_truck( make          = 'MAN'
                                model         = 'TGX'
                                cargo_in_tons = 36 ).

    APPEND vehicle TO vehicles.

    vehicle = NEW zcl_19_car( make  = 'Skoda'
                              model = 'Superb Kombi'
                              seats = 5 ).

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
      if vehicle is INSTANCE OF ZCL_19_truck.
        truck = cast #( vehicle ).
        truck->transform( ).
        out->write(  | { cond #( when truck->is_transformed = 'X'
                                 then 'Der LKW hat sich in einen Autobot transformiert.'
                                 else 'Der Autobot hat sich in einen LKW transformiert.' ) }| ).
      endif.
      out->write( vehicle->to_string( ) ).
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
