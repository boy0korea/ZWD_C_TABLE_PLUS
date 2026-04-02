METHOD get_zcl_wd_c_table_plus .
  DATA: lv_id      TYPE string,
        lt_id      TYPE TABLE OF string,
        lo_c_table TYPE REF TO cl_wd_c_table.

  SPLIT iv_id AT '___' INTO TABLE lt_id.
  lv_id = lt_id[ 1 ].
  lo_c_table ?= wd_comp_controller->mo_view->get_element( lv_id ).
  ro_instance = zcl_wd_c_table_plus=>get_instance( lo_c_table ).
ENDMETHOD.

METHOD onactiondispatch_sort .
*  wd_assist->dispatch_sort_event( io_event = wdevent ).
  get_zcl_wd_c_table_plus( id )->dispatch_sort_event( io_event = wdevent ).
ENDMETHOD.

METHOD onactionexport .
  get_zcl_wd_c_table_plus( id )->dispatch_export( ).
ENDMETHOD.

METHOD onactionopen_search .
*  wd_assist->on_open_search( ).
  get_zcl_wd_c_table_plus( id )->on_open_search( ).
ENDMETHOD.

METHOD ONACTIONSEARCH_CLOSE .
*  wd_assist->on_search_close( ).
  get_zcl_wd_c_table_plus( id )->on_search_close( ).
ENDMETHOD.

METHOD onactionsearch_execute .
*  wd_assist->on_do_search( ).
  get_zcl_wd_c_table_plus( id )->on_do_search( ).
ENDMETHOD.

METHOD onactionsearch_left .
*  wd_assist->on_search_jump_to_next_hit( iv_search_direction_next = abap_false ).
  get_zcl_wd_c_table_plus( id )->on_search_jump_to_next_hit( iv_search_direction_next = abap_true ).
ENDMETHOD.

METHOD onactionsearch_right .
*  wd_assist->on_search_jump_to_next_hit( iv_search_direction_next = abap_true ).
  get_zcl_wd_c_table_plus( id )->on_search_jump_to_next_hit( iv_search_direction_next = abap_true ).
ENDMETHOD.

method WDDOAFTERACTION .
endmethod.

method WDDOBEFOREACTION .
*  data lo_api_controller type ref to if_wd_view_controller.
*  data lo_action         type ref to if_wd_action.

*  lo_api_controller = wd_this->wd_get_api( ).
*  lo_action = lo_api_controller->get_current_action( ).

*  if lo_action is bound.
*    case lo_action->name.
*      when '...'.

*    endcase.
*  endif.
endmethod.

method WDDOEXIT .
endmethod.

method WDDOINIT .
endmethod.

method WDDOMODIFYVIEW .
endmethod.

method WDDOONCONTEXTMENU .
endmethod.

