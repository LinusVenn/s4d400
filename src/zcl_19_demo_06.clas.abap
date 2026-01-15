CLASS zcl_19_demo_06 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_19_demo_06 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    data connection TYPE Z19_CONNECTION.

    connection-carrier_id = 'LH'.
    connection-connection_id = '0400'.
    connection-airport_from_id = 'FRA'.
    connection-airport_to_id = 'JFK'.

    out->write( connection-carrier_id ).
    out->write( connection-connection_id ).
    out->write( connection-airport_from_id ).
    out->write( connection-airport_to_id ).

    out->write( connection ).


  ENDMETHOD.
ENDCLASS.
