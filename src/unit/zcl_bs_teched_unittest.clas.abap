CLASS zcl_bs_teched_unittest DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    TYPES: BEGIN OF test_component,
             field_1 TYPE string,
             field_2 TYPE string,
             field_3 TYPE string,
             date    TYPE d,
             time    TYPE t,
           END OF test_component.

    METHODS get_component
      RETURNING VALUE(result) TYPE test_component.
ENDCLASS.


CLASS zcl_bs_teched_unittest IMPLEMENTATION.
  METHOD get_component.
    RETURN VALUE #( field_1 = `A`
                    field_2 = `B`
                    field_3 = `C`
                    date    = '20251105'
                    time    = '132000' ).
  ENDMETHOD.
ENDCLASS.
