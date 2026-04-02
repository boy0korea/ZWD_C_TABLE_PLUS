method ONACTIONDUMMY .
endmethod.

METHOD supply_sflight .
* General Notes
* =============
* A common scenario for a supply method is to aquire key
* informations from the parameter <parent_element> and then
* to invoke a data provider.
* A free navigation thru the context, especially to nodes on
* the same or deeper hierachical level is strongly discouraged,
* because such a strategy may easily lead to unresolvable
* situations!!

*  if necessary, get static attributes of parent element
*  DATA ls_parent_attributes TYPE wd_this->element_context.
*  parent_element->get_static_attributes(
*    IMPORTING
*      static_attributes = ls_parent_attributes ).


* data declaration
  DATA lt_sflight TYPE wd_this->Elements_sflight.
  DATA ls_sflight LIKE LINE OF lt_sflight.
* @TODO compute values
* e.g. call a data providing FuBa
  SELECT *
    INTO TABLE lt_sflight
    FROM sflight.

* bind all the elements
  node->bind_table(
    new_items            =  lt_sflight
    set_initial_elements = abap_true ).

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

METHOD wddomodifyview .
  IF first_time EQ abap_true.
    zcl_wd_c_table_plus=>upgrade_c_table(
      io_view_api = view
      io_c_table  = CAST #( view->get_element( 'C_TABLE_PLUS' ) )
    ).
  ENDIF.
ENDMETHOD.

method WDDOONCONTEXTMENU .
endmethod.

