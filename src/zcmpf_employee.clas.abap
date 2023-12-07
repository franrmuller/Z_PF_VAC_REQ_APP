CLASS zcmpf_employee DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  " Interfaces
  INTERFACES if_abap_behv_message.
  INTERFACES if_t100_message.
  INTERFACES if_t100_dyn_msg.

  " Message Constants
  CONSTANTS:
       BEGIN OF not_enough_days_available,
        msgid TYPE symsgid      VALUE 'ZPF_VAC_REQ',
        msgno TYPE symsgno      VALUE '001',
        attr1 TYPE scx_attrname VALUE 'begin_date',
        attr2 TYPE scx_attrname VALUE 'end_date',
        attr3 TYPE scx_attrname VALUE 'number_of_vacation_days',
        attr4 TYPE scx_attrname VALUE '',
      END OF not_enough_days_available.

  CONSTANTS:
       BEGIN OF dates_in_wrong_order,
        msgid TYPE symsgid      VALUE 'ZPF_VAC_REQ',
        msgno TYPE symsgno      VALUE '002',
        attr1 TYPE scx_attrname VALUE 'begin_date',
        attr2 TYPE scx_attrname VALUE 'end_date',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF dates_in_wrong_order.


    " Attributs
    DATA description TYPE /dmo/description.
    data begin_date type zpf_vac_req.
    data end_date type zpf_vac_req.
    data number_of_vacation_days type zpf_vac_ent.


    " Constructor
    METHODS constructor
      IMPORTING
        severity type if_abap_behv_message=>t_severity
        !textid   LIKE if_t100_message=>t100key OPTIONAL
        !previous LIKE previous OPTIONAL
        description type /dmo/description OPTIONAL
        begin_date type zpf_vac_req OPTIONAL
        end_date type zpf_vac_req OPTIONAL
        number_of_vacation_days type zpf_vac_ent OPTIONAL.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcmpf_employee IMPLEMENTATION.


  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    CALL METHOD super->constructor
      EXPORTING
        previous = previous.

    CLEAR me->textid.
    IF textid IS INITIAL.
      if_t100_message~t100key = if_t100_message=>default_textid.
    ELSE.
      if_t100_message~t100key = textid.
    ENDIF.

    me->description = description.
    if_abap_behv_message~m_severity = severity.

    me->begin_date = begin_date.
    me->end_date = end_date.
    me->number_of_vacation_days = number_of_vacation_days.
    if_abap_behv_message~m_severity = severity.
  ENDMETHOD.

ENDCLASS.
