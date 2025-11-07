CLASS zcl_bs_teched_syst_new DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

    METHODS constructor.

    METHODS comapre_features
      IMPORTING !out TYPE REF TO if_oo_adt_classrun_out.

    METHODS has_authority
      RETURNING VALUE(result) TYPE abap_boolean.

    METHODS get_date_time
      RETURNING VALUE(result) TYPE string.

    METHODS get_text
      RETURNING VALUE(result) TYPE string.

  PRIVATE SECTION.
    DATA sy TYPE REF TO zif_syst.
ENDCLASS.


CLASS zcl_bs_teched_syst_new IMPLEMENTATION.
  METHOD constructor.
    sy = zcl_syst=>create( ).
  ENDMETHOD.


  METHOD if_oo_adt_classrun~main.
    DATA(test) = NEW zcl_bs_teched_syst_new( ).
    out->write( test->has_authority( ) ).
    out->write( test->get_date_time( ) ).
    out->write( test->get_text( ) ).
  ENDMETHOD.


  METHOD has_authority.
    AUTHORITY-CHECK OBJECT 'ZRH_CONTACT'
                    ID 'ACTVT' FIELD '06'.

    RETURN xsdbool( sy->return_code( ) = 0 ).
  ENDMETHOD.


  METHOD get_date_time.
    RETURN |{ sy->system_date( ) }_{ sy->system_time( ) }|.
  ENDMETHOD.


  METHOD get_text.
    IF sy->language_iso( ) = 'FR'.
      RETURN `You got the right text`.
    ENDIF.
  ENDMETHOD.


  METHOD comapre_features.
    DATA(xco_user) = sy->user_id( ).
    out->write( xco_user ).

    DATA(context_alias) = sy->user_alias( ).
    out->write( context_alias ).

    DATA(syst_time) = sy->system_time( ).
    out->write( syst_time ).

    DATA(context_system_time) = sy->system_time( ).
    out->write( context_system_time ).

    DATA(xco_local_time) = sy->user_time( ).
    out->write( xco_local_time ).
  ENDMETHOD.
ENDCLASS.
