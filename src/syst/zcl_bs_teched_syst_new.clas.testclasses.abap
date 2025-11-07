CLASS lth_syst DEFINITION FOR TESTING.
  PUBLIC SECTION.
    INTERFACES zif_syst PARTIALLY IMPLEMENTED.
ENDCLASS.


CLASS lth_syst IMPLEMENTATION.
  METHOD zif_syst~language_iso.
    RETURN 'FR'.
  ENDMETHOD.


  METHOD zif_syst~return_code.
    RETURN 0.
  ENDMETHOD.


  METHOD zif_syst~system_date.
    RETURN '20260101'.
  ENDMETHOD.


  METHOD zif_syst~system_time.
    RETURN '153000'.
  ENDMETHOD.
ENDCLASS.


CLASS ltc_validate DEFINITION FINAL
  FOR TESTING RISK LEVEL HARMLESS DURATION SHORT.

  PRIVATE SECTION.
    DATA cut TYPE REF TO zcl_bs_teched_syst_new.

    METHODS setup.

    METHODS always_authorization FOR TESTING RAISING cx_static_check.
    METHODS future_is_real       FOR TESTING RAISING cx_static_check.
    METHODS solution_text        FOR TESTING RAISING cx_static_check.
ENDCLASS.


CLASS ltc_validate IMPLEMENTATION.
  METHOD setup.
    zcl_syst_injector=>inject_syst( NEW lth_syst( ) ).
    cut = NEW zcl_bs_teched_syst_new( ).
  ENDMETHOD.


  METHOD always_authorization.
    DATA(result) = cut->has_authority( ).

    cl_abap_unit_assert=>assert_true( result ).
  ENDMETHOD.


  METHOD future_is_real.
    DATA(result) = cut->get_date_time( ).

    cl_abap_unit_assert=>assert_equals( exp = '20260101_153000'
                                        act = result ).
  ENDMETHOD.


  METHOD solution_text.
    DATA(result) = cut->get_text( ).

    cl_abap_unit_assert=>assert_equals( exp = `You got the right text`
                                        act = result ).
  ENDMETHOD.
ENDCLASS.
