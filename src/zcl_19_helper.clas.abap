CLASS zcl_19_helper DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-METHODS get_travel_with_customer
      IMPORTING
                travel_id                   TYPE /dmo/travel_id
      RETURNING VALUE(travel_with_customer) TYPE zabap_travel_with_customer.

    CLASS-METHODS get_travels
      IMPORTING
                customer_id    TYPE /dmo/customer_id
      RETURNING VALUE(travels) TYPE z19_travels.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_19_helper IMPLEMENTATION.

  METHOD get_travel_with_customer.



    SELECT FROM /dmo/customer
      INNER JOIN /dmo/travel ON /dmo/customer~customer_id = /dmo/travel~customer_id
      FIELDS /dmo/travel~*
      WHERE /dmo/travel~travel_id = @travel_id
      INTO CORRESPONDING FIELDS OF @travel_with_customer.
    ENDSELECT.


  ENDMETHOD.


  METHOD get_travels.


    SELECT FROM /dmo/travel
      FIELDS *
      WHERE customer_id = @customer_id
      INTO TABLE @travels.


  ENDMETHOD.
ENDCLASS.








