CLASS ltc_another_test DEFINITION FINAL
  FOR TESTING RISK LEVEL HARMLESS DURATION SHORT.

  PRIVATE SECTION.
    METHODS validate_content FOR TESTING RAISING cx_static_check.
ENDCLASS.


CLASS ltc_another_test IMPLEMENTATION.
  METHOD validate_content.
    DATA(helper) = NEW zcl_bs_teched_unittest( ).

    DATA(result) = helper->get_component( ).

    cl_abap_unit_assert=>assert_equals( exp = '20251104'
                                        act = result-date ).
  ENDMETHOD.
ENDCLASS.
