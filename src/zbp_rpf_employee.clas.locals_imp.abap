CLASS lhc_Employee DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Employee RESULT result.

    METHODS validatedates for validate on save
    importing keys for vacationRequest~validatedates.

    Methods determinestatus for determine on modify
    importing keys for vacationrequest~determinestatus.

    methods DetermineStatusRequestComment for determine on modify
    importing keys for vacationrequest~DetermineStatusRequestComment.

ENDCLASS.

CLASS lhc_Employee IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD validatedates.
    DATA message TYPE REF TO zcmpf_employee.

    " Read Vacation Requests
    READ ENTITY IN LOCAL MODE ZRPF_vac_REQ
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
    READ ENTITY IN LOCAL MODE ZRpf_vac_req
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
                           Status = 'R' ) ).
  ENDMETHOD.
ENDCLASS.
