CLASS lhc_Employee DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Employee RESULT result.

    METHODS showtestmessage FOR MODIFY
      IMPORTING keys FOR ACTION employee~showtestmessage.

    methods get_instance_authorizations_1 for instance authorization
      importing keys request requested_authorizations for VacationRequest result result.

    METHODS validatedates for validate on save
    importing keys for VacationRequest~validatedates.

    Methods determinestatus for determine on modify
    importing keys for Vacationrequest~determinestatus.

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
                           Status = 'R' ) ).
  ENDMETHOD.

  METHOD get_instance_authorizations_1.
  ENDMETHOD.

  METHOD ApproveRequest.
     DATA message TYPE REF TO zcmpf_employee.

    " Read Vacation Requests
    READ ENTITY IN LOCAL MODE zrpf_vac_req
         ALL FIELDS
         WITH CORRESPONDING #( keys )
         RESULT DATA(vacationrequests).

    " Process Vacation Request
    LOOP AT vacationrequests REFERENCE INTO DATA(VacationRequest).
      " Validate Status and Create Error Message
      IF vacationrequest->Status = 'A'.
        message = NEW zcmpf_employee( textid = zcmpf_employee=>already_approved
                                  Commentary = VacationRequest->Commentary ).
        APPEND VALUE #( %tky     = vacationrequest->%tky
                        %element = VALUE #( Status = if_abap_behv=>mk-on )
                        %msg     = message ) TO reported-VacationRequest.
        APPEND VALUE #( %tky = vacationrequest->%tky ) TO failed-VacationRequest.
        DELETE VacationRequests INDEX sy-tabix.
        CONTINUE.
      ENDIF.

      " Set Status to Approved  and Create Success Message
      VacationRequest->Status = 'A'.
      message = NEW zcmpf_employee( severity = if_abap_behv_message=>severity-success
                                textid   = zcmpf_employee=>successfully_approved
                                Commentary   = VacationRequest->Commentary ).
      APPEND VALUE #( %tky     = VacationRequest->%tky
                      %element = VALUE #( Status = if_abap_behv=>mk-on )
                      %msg     = message ) TO reported-VacationRequest.
    ENDLOOP.

    " Modify Travels
    MODIFY ENTITY IN LOCAL MODE ZRPF_VAC_REQ
           UPDATE FIELDS ( Status )
           WITH VALUE #( FOR v IN vacationrequests
                         ( %tky = v-%tky Status = v-Status ) ).

    " Set Result
    result = VALUE #( FOR v IN vacationrequests
                      ( %tky   = v-%tky
                        %param = v ) ).
  ENDMETHOD.

  METHOD DeclineRequest.
     DATA message TYPE REF TO zcmpf_employee.

    " Read Vacation Requests
    READ ENTITY IN LOCAL MODE zrpf_vac_req
         ALL FIELDS
         WITH CORRESPONDING #( keys )
         RESULT DATA(vacationrequests).

    " Process Vacation Request
    LOOP AT vacationrequests REFERENCE INTO DATA(VacationRequest).
      " Validate Status and Create Error Message
      IF vacationrequest->Status = 'C'.
        message = NEW zcmpf_employee( textid = zcmpf_employee=>already_rejected
                                  Commentary = VacationRequest->Commentary ).
        APPEND VALUE #( %tky     = vacationrequest->%tky
                        %element = VALUE #( Status = if_abap_behv=>mk-on )
                        %msg     = message ) TO reported-VacationRequest.
        APPEND VALUE #( %tky = vacationrequest->%tky ) TO failed-VacationRequest.
        DELETE VacationRequests INDEX sy-tabix.
        CONTINUE.
      ENDIF.

      " Set Status to Approved  and Create Success Message
      VacationRequest->Status = 'C'.
      message = NEW zcmpf_employee( severity = if_abap_behv_message=>severity-success
                                textid   = zcmpf_employee=>successfully_approved
                                Commentary   = VacationRequest->Commentary ).
      APPEND VALUE #( %tky     = VacationRequest->%tky
                      %element = VALUE #( Status = if_abap_behv=>mk-on )
                      %msg     = message ) TO reported-VacationRequest.
    ENDLOOP.

    " Modify Travels
    MODIFY ENTITY IN LOCAL MODE ZRPF_VAC_REQ
           UPDATE FIELDS ( Status )
           WITH VALUE #( FOR v IN vacationrequests
                         ( %tky = v-%tky Status = v-Status ) ).

    " Set Result
    result = VALUE #( FOR v IN vacationrequests
                      ( %tky   = v-%tky
                        %param = v ) ).
  ENDMETHOD.

ENDCLASS.
