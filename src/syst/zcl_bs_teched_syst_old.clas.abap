CLASS zcl_bs_teched_syst_old DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_bs_teched_syst_old IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA(xco_user) = xco_cp=>sy->user( )->name.
    out->write( xco_user ).

    DATA(context_alias) = cl_abap_context_info=>get_user_alias( ).
    out->write( context_alias ).

    DATA(syst_time) = sy-uzeit.
    out->write( syst_time ).

    DATA(context_system_time) = cl_abap_context_info=>get_system_time( ).
    out->write( context_system_time ).

    DATA(xco_local_time) = CONV t( xco_cp=>sy->time( xco_cp_time=>time_zone->user )->as( xco_cp_time=>format->abap )->value ).
    out->write( xco_local_time ).
  ENDMETHOD.
ENDCLASS.
