CLASS lhc_rating DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS DetermineRatingDate FOR DETERMINE ON SAVE
      IMPORTING keys FOR Rating~DetermineRatingDate.

    METHODS DetermineUserName FOR DETERMINE ON SAVE
      IMPORTING keys FOR Rating~DetermineUserName.

ENDCLASS.

CLASS lhc_rating IMPLEMENTATION.

  METHOD DetermineRatingDate.

  DATA ratingDates TYPE TABLE FOR UPDATE zr_19_ratingTP.

    LOOP AT keys INTO DATA(key).
      APPEND VALUE #( %tky   = key-%tky
                      UserName = sy-uname ) TO ratingDates.
    ENDLOOP.

    MODIFY ENTITIES OF ZR_19_MovieTP IN LOCAL MODE
           ENTITY Rating
           UPDATE
           FIELDS ( RatingDate )
           WITH ratingDates.

  ENDMETHOD.

  METHOD DetermineUserName.

  DATA userNames TYPE TABLE FOR UPDATE zr_19_ratingTP.

    LOOP AT keys INTO DATA(key).
      APPEND VALUE #( %tky   = key-%tky
                      RatingDate = sy-datum ) TO userNames.
    ENDLOOP.

    MODIFY ENTITIES OF ZR_19_MovieTP IN LOCAL MODE
           ENTITY Rating
           UPDATE
           FIELDS ( UserName )
           WITH userNames.

  ENDMETHOD.

ENDCLASS.

CLASS lhc_Movie DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Movie RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR Movie RESULT result.
    METHODS ValidateGenre FOR VALIDATE ON SAVE
      IMPORTING keys FOR Movie~ValidateGenre.
    METHODS RateMovie FOR MODIFY
      IMPORTING keys FOR ACTION Movie~RateMovie. " RESULT result.


ENDCLASS.

CLASS lhc_Movie IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD ValidateGenre.

   DATA genres TYPE TABLE FOR READ RESULT ZR_19_MovieTP.
    " Read Travels

    READ ENTITIES OF ZR_19_MovieTP IN LOCAL MODE
         ENTITY Movie
         FIELDS ( Genre )
         WITH CORRESPONDING #( keys )
         RESULT genres.

    " Process Travels
    LOOP AT genres INTO DATA(movie).

      " Validate Customer and Create Error Message

      SELECT SINGLE FROM ddcds_customer_domain_value( P_domain_name = 'ZABAP_GENRE' ) FIELDS @abap_true WHERE value_low = @movie-genre INTO @DATA(exists).

      IF exists = abap_false.
        APPEND VALUE #( %tky = movie-%tky ) TO failed-movie.
        " TODO: variable is assigned but never used (ABAP cleaner)
        DATA(message) = NEW zcm_abap_movie( textid      = zcm_abap_movie=>no_genre_found
                                           Genre = movie-Genre
                                           severity    = if_abap_behv_message=>severity-error ).

        APPEND VALUE #( %tky = movie-%tky
               %msg = message
               %element-Genre = if_abap_behv=>mk-on ) TO reported-movie.
      ENDIF.

    ENDLOOP.
  ENDMETHOD.

  METHOD RateMovie.
    DATA ratings TYPE TABLE FOR CREATE ZR_19_MovieTP\_Ratings.

    DATA(valid_keys) = keys.

    " Process Movie-Keys
    LOOP AT keys INTO DATA(key).
      " Validate Rating
      IF key-%param-Rating >= 1 AND key-%param-Rating <= 10.
        CONTINUE.
      ENDIF.

      " Create error message
      DATA(message) = NEW zcm_abap_movie( textid   = zcm_abap_movie=>invalid_rating
                                          rating   = key-%param-Rating
                                          severity = if_abap_behv_message=>severity-error ).

      APPEND VALUE #( %tky              = key-%tky
                      %msg              = message
                      %action-RateMovie = if_abap_behv=>mk-on ) TO reported-movie.
      APPEND VALUE #( %tky = key-%tky ) TO failed-movie.
      DELETE valid_keys WHERE %tky = key-%tky.
    ENDLOOP.

    " Check Movie-Keys
    IF valid_keys IS INITIAL.
      RETURN.
    ENDIF.

    " Create Ratings
    LOOP AT valid_keys INTO key.
      APPEND VALUE #( %tky = key-%tky %target = value #( ( Rating = key-%param-Rating ) ) ) TO ratings.
    ENDLOOP.

    MODIFY ENTITIES OF ZR_19_MovieTP IN LOCAL MODE
           ENTITY Movie
           CREATE BY \_Ratings
           AUTO FILL CID
           FIELDS ( Rating )
           WITH ratings.


  ENDMETHOD.

ENDCLASS.
