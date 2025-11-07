CLASS zcl_bs_teched_container DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

    TYPES: BEGIN OF json_file,
             letter      TYPE c LENGTH 1,
             number      TYPE i,
             combination TYPE string,
           END OF json_file.

    CONSTANTS git_file TYPE string VALUE `https://raw.githubusercontent.com/Xexer/abap-test-container/refs/heads/main/examples/big-file.json`.
ENDCLASS.


CLASS zcl_bs_teched_container IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA remote_content TYPE STANDARD TABLE OF json_file WITH EMPTY KEY.

    DATA(container) = zcl_test_container_factory=>create( NEW zcl_tdc_github_config( git_file ) ).
    container->get_json_data( CHANGING generic = remote_content ).

    DATA(sum) = 0.
    LOOP AT remote_content REFERENCE INTO DATA(remote).
      sum += remote->number.
    ENDLOOP.

    out->write( remote_content ).
    out->write( |The sum is: { sum }| ).
  ENDMETHOD.
ENDCLASS.
