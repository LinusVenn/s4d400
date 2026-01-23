CLASS zcl_19_abap_cds_06 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_19_abap_cds_06 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
  SELECT
      FROM Z19_CUSTOMERKPIS( p_city = 'Mainz' )
      FIELDS *
      Order by TotalRevenue DESCENDING
      INTO TABLE @DATA(customers).

    out->write( customers ).
  ENDMETHOD.
ENDCLASS.
