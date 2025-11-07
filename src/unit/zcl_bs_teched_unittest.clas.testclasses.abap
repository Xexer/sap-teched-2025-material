CLASS ltc_unit DEFINITION FINAL
  FOR TESTING RISK LEVEL HARMLESS DURATION SHORT.

  PRIVATE SECTION.
    METHODS validate_content FOR TESTING RAISING cx_static_check.
ENDCLASS.


CLASS ltc_unit IMPLEMENTATION.
  METHOD validate_content.
    DATA(cut) = NEW zcl_bs_teched_unittest( ).

    DATA(result) = cut->get_component( ).

    cl_abap_unit_assert=>assert_equals( exp = '20251105'
                                        act = result-date ).
  ENDMETHOD.
ENDCLASS.
