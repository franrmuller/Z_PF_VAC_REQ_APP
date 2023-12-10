CLASS lhc_Employee DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Employee RESULT result.


    METHODS showtestmessage FOR MODIFY
      IMPORTING keys FOR ACTION employee~showtestmessage.

    METHODS validatedates for validate on save
    importing keys for vacationRequest~validatedates.

    Methods determinestatus for determine on modify
    importing keys for vacationrequest~determinestatus.

    methods DetermineStatusRequestComment for determine on modify
    importing keys for vacationrequest~DetermineStatusRequestComment.

    methods get_instance_authorizations_1 for instance authorization
      importing keys request requested_authorizations for VacationRequest result result.

    methods ApproveRequest for modify
      importing keys for action VacationRequest~ApproveRequest result result.

    methods DeclineRequest for modify
      importing keys for action VacationRequest~DeclineRequest result result.

ENDCLASS.

CLASS lhc_Employee IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD showtestmessage.
    DATA message TYPE REF TO zcmpf_employee.

    message = NEW zcmpf_employee( severity  = if_abap_behv_message=>severity-success
                              textid    = zcmpf_employee=>test_message
                              user_name = sy-uname ).

    APPEND message TO reported-%other.
  ENDMETHOD.

  METHOD validatedates.
    DATA message TYPE REF TO zcmpf_employee.

    " Read Vacation Requests
    READ ENTITY IN LOCAL MODE ZRPF_VAC_REQ
         FIELDS ( BeginDate EndDate )
         WITH CORRESPONDING #( keys )
         RESULT DATA(vacationRequests).

    " Process Vacation Requests
    LOOP AT vacationRequests INTO DATA(vacationRequest).
      " Validate Dates and Create Error Message
      IF vacationRequest-EndDate < vacationRequest-BeginDate.
        message = NEW zcmpf_employee( textid = zcmpf_employee=>invalid_dates ).
        APPEND VALUE #( %tky = vacationRequest-%tky
                        %msg = message ) TO reported-vacationRequest.
        APPEND VALUE #( %tky = vacationrequest-%tky ) TO failed-vacationRequest.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD determinestatus.
    " Read Vacation Requests
    READ ENTITY IN LOCAL MODE zrpf_vac_req
         FIELDS ( Status )
         WITH CORRESPONDING #( keys )
         RESULT DATA(vacationrequests).

    " Modify Travels
    MODIFY ENTITY IN LOCAL MODE ZRpf_vac_req
           UPDATE FIELDS ( Status )
           WITH VALUE #( FOR v IN vacationrequests
                         ( %tky   = v-%tky
                           Status = 'B' ) ).
  ENDMETHOD.

  METHOD determinestatusrequestcomment.
    " Read Vacation Requests
    READ ENTITY IN LOCAL MODE ZRpf_vac_req
         FIELDS ( Status )
         WITH CORRESPONDING #( keys )
         RESULT DATA(vacationrequests).

    " Modify Travels
    MODIFY ENTITY IN LOCAL MODE ZRpf_vac_req
           UPDATE FIELDS ( Status )
           WITH VALUE #( FOR v IN vacationrequests
                         ( %tky   = v-%tky
                           Status = 'B' ) ).
  ENDMETHOD.
  METHOD get_instance_authorizations_1.
  ENDMETHOD.

  METHOD ApproveRequest.
  ENDMETHOD.

  METHOD DeclineRequest.
  ENDMETHOD.

ENDCLASS.
