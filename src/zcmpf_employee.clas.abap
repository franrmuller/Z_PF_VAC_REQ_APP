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
      BEGIN OF test_message,
        msgid TYPE symsgid      VALUE 'ZPF_EMPLOYEE',
        msgno TYPE symsgno      VALUE '003',
        attr1 TYPE scx_attrname VALUE 'USER_NAME',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF test_message.

  CONSTANTS:
       BEGIN OF days_exceeded,
        msgid TYPE symsgid      VALUE 'ZPF_EMPLOYEE',
        msgno TYPE symsgno      VALUE '001',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF days_exceeded.

  CONSTANTS:
       BEGIN OF invalid_dates,
        msgid TYPE symsgid      VALUE 'ZPF_EMPLOYEE',
        msgno TYPE symsgno      VALUE '002',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF invalid_dates.



      CONSTANTS:
       BEGIN OF successfully_approved,
        msgid TYPE symsgid      VALUE 'ZPF_EMPLOYEE',
        msgno TYPE symsgno      VALUE '004',
        attr1 TYPE scx_attrname VALUE 'Commentary',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF successfully_approved.

      CONSTANTS:
       BEGIN OF successfully_rejected,
        msgid TYPE symsgid      VALUE 'ZPF_EMPLOYEE',
        msgno TYPE symsgno      VALUE '005',
        attr1 TYPE scx_attrname VALUE 'Commentary',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF successfully_rejected.

      CONSTANTS:
       BEGIN OF already_approved,
        msgid TYPE symsgid      VALUE 'ZPF_EMPLOYEE',
        msgno TYPE symsgno      VALUE '006',
        attr1 TYPE scx_attrname VALUE 'Commentary',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF already_approved.

      CONSTANTS:
       BEGIN OF already_rejected,
        msgid TYPE symsgid      VALUE 'ZPF_EMPLOYEE',
        msgno TYPE symsgno      VALUE '007',
        attr1 TYPE scx_attrname VALUE 'Commentary',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF already_rejected.


    " Attributes
    data user_name type syuname.
    data begin_date type zpf_vac_req.
    data end_date type zpf_vac_req.
    data number_of_vacation_days type zpf_vac_ent.
    data Commentary type zpf_comment.


    " Constructor
    METHODS constructor
      IMPORTING
        severity     TYPE if_abap_behv_message=>t_severity DEFAULT if_abap_behv_message=>severity-error
        textid       LIKE if_t100_message=>t100key         DEFAULT if_t100_message=>default_textid
        !previous    LIKE previous                         OPTIONAL
        user_name    TYPE syuname                          OPTIONAL
        begin_date type zpf_vac_req OPTIONAL
        end_date type zpf_vac_req OPTIONAL
        number_of_vacation_days type zpf_vac_ent OPTIONAL
        Commentary type zpf_comment optional.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcmpf_employee IMPLEMENTATION.


  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    super->constructor(  previous = previous ).

    if_t100_message~t100key = textid.
    if_abap_behv_message~m_severity = severity.

    me->user_name = user_name.
    me->begin_date = begin_date.
    me->end_date = end_date.
    me->number_of_vacation_days = number_of_vacation_days.
    me->Commentary = Commentary.
  ENDMETHOD.

ENDCLASS.
