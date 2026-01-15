CLASS zcl_19_abap_02 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_19_abap_02 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  "DATA customer type /dmo/customer.
  "customer-customer_id = '195649'.
  "customer-first_name = 'Anna'.
  "customer-last_name = 'Anne'.
  "customer-city = 'Kutztown'.
  "customer-country_code = 'US'.

  DATA customer_id TYPE /dmo/customer_id VALUE '159569'.
  DATA first_name TYPE /dmo/first_name Value 'Linus'.
  DATA last_name TYPE /dmo/last_name value 'Vennekold'.
  DATA city TYPE /dmo/city value 'Walldorf'.
  DATA country_code TYPE land1 Value 'DE'.


  out->write( | { customer_id }, { first_name } { last_name }, { city } ({ country_code }) | ).




  ENDMETHOD.
ENDCLASS.
