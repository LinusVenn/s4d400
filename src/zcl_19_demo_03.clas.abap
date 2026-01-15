CLASS zcl_19_demo_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_19_demo_03 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

**********************************************************************
* Einfache Verzweigungen
**********************************************************************

    "Vergleichsoperatoren: >, >=, <, <=, =, <> (Ungleich)
    " Logische Operatoren: AND, OR, NOT
    " + IS (NOT) INITIAL (Steht in der Variablen etwas drin oder ist die Variable initial?
    DATA age TYPE i value 55.
    DATA gender TYPE c LENGTH 1 value 'm'.
    data first_name type c length 40 value 'Peter'.
    data last_name type c length 40 Value 'Maier'.


    if age < 18.
      out->write( |Hallo { first_name }| ).
    ELSEIF gender = 'm' OR gender = 'M'.
       out->write( |Hallo Herr { last_name }| ).
     ELSEIF gender = 'w' OR gender = 'M'.
       out->write( |Hallo Frau { last_name }| ).
    endif.

    out->write( |Hallo { cond #( when age < 18 then first_name
                                  when gender = 'm' OR gender = 'M' then |Herr | && last_name
                                  when gender = 'w' OR gender = 'W' then |Frau | && last_name
                                  else last_name ) }| ).

    if age is INITIAL. "IF age = 0.
      out->write( |kein Alter angegeben. | ).
    endif.

**********************************************************************
*Fallunterscheidugnen
**********************************************************************

    case gender.
      when 'w' OR 'W'.
        out->write( |Hallo Frau { last_name }| ).
      when 'm' OR 'M'.
        out->write( |Hallo Herr { last_name }| ).
      when others.
        out->write( |Hallo { last_name }| ).
    endcase.

    out->write( |Hallo { switch #( gender when 'm' OR 'M' then |Herr | && last_name
                                          when 'w' OR 'W' then |Frau | && last_name
                                          ELSE last_name ) }| ).



  ENDMETHOD.
ENDCLASS.
