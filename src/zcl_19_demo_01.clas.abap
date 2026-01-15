CLASS zcl_19_demo_01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_19_demo_01 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
**********************************************************************
*HalloWelt
**********************************************************************


    DATA text TYPE string. "Deklaration

    text = 'Hello World!'. " Wertzuweisung

* Ausgabe

    out->write( text ).

**********************************************************************
* Datentypen und Datenobjekte
**********************************************************************

    DATA age type i.                                  "Ganze Zahlen
    DATA salary_in_euro type p length 16 decimals 2.  "Kommazahlen
    DATA first_name type c length 40.                 "Zeichenketten fester Länge
    DATA matriculation_number type n length 7.        "Ziffernfolge
    DATA xmas type d.                                 "Datumsangaben
    DATA noon type t.                                 "Zeitangaben
    DATA flag.                                        "falscher boolscher Wahrheitswert

    DATA carrier_id type c length 3.
    DATA carrier_id2 type /dmo/carrier_id.

**********************************************************************
* Wertzuweisungen
**********************************************************************

    age = 44.
    salary_in_euro = '6000.52'.
    first_name = 'Hugo'.
    matriculation_number = '0815815'.
    xmas = '20191225'. "Nach dem Prinzip YYYYMMDD
    noon = '120000'. "Nach dem Prizip HHMMSS
    flag = 'X'.

    "Initialisierung
    flag = ''.
    flag = ' '.
    CLEAR flag.

    DATA last_name TYPE c LENGTH 40 VALUE 'Vennekold'. "Statische Vorbelegung

    data(size_in_cm) = 179. "Inlinedeklaration
    size_in_cm = '179'.


  ENDMETHOD.
ENDCLASS.


