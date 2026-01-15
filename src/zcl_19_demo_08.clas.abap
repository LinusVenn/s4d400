CLASS zcl_19_demo_08 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_19_demo_08 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA connections TYPE TABLE OF /dmo/connection.
    DATA carrier_id TYPE /dmo/carrier_id VALUE 'LH'.
    DATA connection_id TYPE /dmo/connection_id VALUE '0400'.
    DATA connection3 TYPE z19_connection.
**********************************************************************
* Standardaufbau
* SELECT [Spalten] FROM [Datenbakquelle] WHERE [Bedingung]
**********************************************************************

**********************************************************************
* Lesen von Einzelsätzen
**********************************************************************
    DATA connection TYPE /dmo/connection.

    SELECT SINGLE FROM /dmo/connection
      FIELDS *
      WHERE carrier_id = @carrier_id AND connection_id = @connection_id
      INTO @connection.



**********************************************************************
* Lesen mehrerer Datensätze
**********************************************************************
    SELECT FROM /dmo/connection
      FIELDS *
      WHERE carrier_id = @carrier_id
      INTO TABLE @connections.

    out->write( connections ).




**********************************************************************
* Lesen mehrerer Datensätzen (per Select-Schleife)
**********************************************************************
    CLEAR connections.
    SELECT FROM /dmo/connection
      FIELDS *
      WHERE carrier_id = @carrier_id
      INTO @connection.
      APPEND connection TO connections.

    ENDSELECT.
    out->write( connections ).

**********************************************************************
* Definition der Zielvariablen
**********************************************************************

    " Option 1: Inlinedeklaration
    SELECT SINGLE FROM /dmo/connection
      FIELDS carrier_id, connection_id, airport_from_id, airport_to_id
      WHERE carrier_id = @carrier_id AND connection_id = @connection_id
      INTO @DATA(connection2).

    out->write( connection2 ).

    " Option 2: Angabe passender Felder
    SELECT SINGLE FROM /dmo/connection
      FIELDS carrier_id, connection_id, airport_from_id, airport_to_id
      WHERE carrier_id = @carrier_id AND connection_id = @connection_id
      INTO @connection3.

    out->write( connection3 ).


    "Option 3: Kopieren namensgleicher Felder
    SELECT SINGLE FROM /dmo/connection
      FIELDS carrier_id, connection_id, airport_from_id, airport_to_id
      WHERE carrier_id = @carrier_id AND connection_id = @connection_id
      INTO CORRESPONDING FIELDS OF @connection.

    out->write( connection ).

**********************************************************************
* Tabellen-Joins
**********************************************************************

    SELECT FROM /dmo/connection
      INNER JOIN /dmo/carrier ON /dmo/connection~carrier_id = /dmo/carrier~carrier_id
      FIELDS /dmo/connection~carrier_id, /dmo/connection~connection_id, /dmo/carrier~name
      INTO TABLE @DATA(connections2).

    out->write( connections2 ).


  ENDMETHOD.
ENDCLASS.






