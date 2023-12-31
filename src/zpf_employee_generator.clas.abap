CLASS zpf_employee_generator DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .
  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun .
"  PROTECTED SECTION.
"  PRIVATE SECTION.
ENDCLASS.



CLASS ZPF_EMPLOYEE_GENERATOR IMPLEMENTATION.


   METHOD if_oo_adt_classrun~main.

   Data hmaieruuid type sysuuid_x16.
   data lmuelleruuid type sysuuid_x16.
   Data pschmidtuuid type sysuuid_x16.

   hmaieruuid = cl_system_uuid=>create_uuid_x16_static( ).
   lmuelleruuid = cl_system_uuid=>create_uuid_x16_static( ).
   pschmidtuuid = cl_system_uuid=>create_uuid_x16_static( ).

    DATA employee TYPE zpf_employee.
    DATA employees TYPE TABLE OF zpf_employee.

    data vacationEntitlement type ZPF_VAC_ENT.
    data vacationEntitlements type table of ZPF_VAC_ENT.

    data vacationRequest type zpf_vac_req.
    data vacationRequests type table of zpf_vac_req.


" Delete DBT Employee
DELETE FROM zpf_employee.
out->write(  |Deleted Employees: { sy-dbcnt }| ).

" Delete DBT Vacation Entitlements
delete from zpf_vac_ent.
out->write(  |Deleted Vacation Entitlements: { sy-dbcnt }| ).

" Delete DBT Vacation Requests
delete from zpf_vac_req.
out->write(  |Deleted Vacation Requests: { sy-dbcnt }| ).

"Create Employees
  employee-client        = sy-mandt.
  employee-employee_number = 1.
  employee-first_name = 'Hans'.
  employee-last_name = 'Maier'.
  employee-entry_date = '20000501'.
  employee-created_by = 'GENERATOR'.
  employee-id = hmaieruuid.
  GET TIME STAMP FIELD employee-created_at.
  employee-last_changed_by = 'GENERATOR'.
  GET TIME STAMP FIELD employee-last_changed_at.
  APPEND employee TO employees.

  employee-employee_number = 2.
  employee-client        = sy-mandt.
  employee-first_name = 'Lisa'.
  employee-last_name = 'Müller'.
  employee-entry_date = '20100207'.
  employee-created_by = 'GENERATOR'.
  employee-id = lmuelleruuid.
  GET TIME STAMP FIELD employee-created_at.
  employee-last_changed_by = 'GENERATOR'.
  GET TIME STAMP FIELD employee-last_changed_at.
  APPEND employee TO employees.

  employee-employee_number = 3.
  employee-client        = sy-mandt.
  employee-first_name = 'Petra'.
  employee-last_name = 'Schmidt'.
  employee-entry_date = '20221001'.
  employee-created_by = 'GENERATOR'.
  employee-id = pschmidtuuid.
  GET TIME STAMP FIELD employee-created_at.
  employee-last_changed_by = 'GENERATOR'.
  GET TIME STAMP FIELD employee-last_changed_at.
  APPEND employee TO employees.

" Create Vacation Entitlements

vacationEntitlement-employee = hmaieruuid.
vacationEntitlement-client        = sy-mandt.
vacationEntitlement-year_of_vacation = 2022.
vacationEntitlement-number_of_vacation_days = 30.
vacationEntitlement-created_by = 'GENERATOR'.
vacationEntitlement-id = cl_system_uuid=>create_uuid_x16_static( ).
get time stamp field vacationEntitlement-created_at.
vacationEntitlement-last_changed_by = 'generator'.
get time stamp field vacationEntitlement-last_changed_at.
append vacationEntitlement to vacationEntitlements.

vacationEntitlement-employee = hmaieruuid.
vacationEntitlement-client        = sy-mandt.
vacationEntitlement-year_of_vacation = 2023.
vacationEntitlement-number_of_vacation_days = 30.
vacationEntitlement-created_by = 'GENERATOR'.
vacationEntitlement-id = cl_system_uuid=>create_uuid_x16_static( ).
get time stamp field vacationEntitlement-created_at.
vacationEntitlement-last_changed_by = 'generator'.
get time stamp field vacationEntitlement-last_changed_at.
append vacationEntitlement to vacationEntitlements.

vacationEntitlement-employee = lmuelleruuid.
vacationEntitlement-client        = sy-mandt.
vacationEntitlement-year_of_vacation = 2023.
vacationEntitlement-number_of_vacation_days = 30.
vacationEntitlement-created_by = 'GENERATOR'.
vacationEntitlement-id = cl_system_uuid=>create_uuid_x16_static( ).
get time stamp field vacationEntitlement-created_at.
vacationEntitlement-last_changed_by = 'generator'.
get time stamp field vacationEntitlement-last_changed_at.
append vacationEntitlement to vacationEntitlements.

vacationEntitlement-employee = pschmidtuuid.
vacationEntitlement-client        = sy-mandt.
vacationEntitlement-year_of_vacation = 2023.
vacationEntitlement-number_of_vacation_days = 7.
vacationEntitlement-created_by = 'GENERATOR'.
vacationEntitlement-id = cl_system_uuid=>create_uuid_x16_static( ).
get time stamp field vacationEntitlement-created_at.
vacationEntitlement-last_changed_by = 'generator'.
get time stamp field vacationEntitlement-last_changed_at.
append vacationEntitlement to vacationEntitlements.


" Create Vacation Requests

vacationRequest-applicant = hmaieruuid.
vacationRequest-client        = sy-mandt.
vacationRequest-approver = lmuelleruuid.
vacationRequest-begin_date = '20220701'.
vacationRequest-end_date = '20220710'.
vacationRequest-commentary = 'Sommerurlaub'.
vacationRequest-status = 'A'.
vacationRequest-id = cl_system_uuid=>create_uuid_x16_static( ).
get time stamp field vacationRequest-created_at.
vacationRequest-last_changed_by = 'generator'.
get time stamp field vacationRequest-last_changed_at.
append vacationRequest to vacationRequests.

vacationRequest-applicant = hmaieruuid.
vacationRequest-client        = sy-mandt.
vacationRequest-approver = lmuelleruuid.
vacationRequest-begin_date = '20221227'.
vacationRequest-end_date = '20221230'.
vacationRequest-commentary = 'Weihnachtsurlaub'.
vacationRequest-status = 'C'.
vacationRequest-id = cl_system_uuid=>create_uuid_x16_static( ).
get time stamp field vacationRequest-created_at.
vacationRequest-last_changed_by = 'generator'.
get time stamp field vacationRequest-last_changed_at.
append vacationRequest to vacationRequests.

vacationRequest-applicant = hmaieruuid.
vacationRequest-client        = sy-mandt.
vacationRequest-approver = lmuelleruuid.
vacationRequest-begin_date = '20221228'.
vacationRequest-end_date = '20221230'.
vacationRequest-commentary = 'Weihnachtsurlaub (2. Versuch'.
vacationRequest-status = 'A'.
vacationRequest-id = cl_system_uuid=>create_uuid_x16_static( ).
get time stamp field vacationRequest-created_at.
vacationRequest-last_changed_by = 'generator'.
get time stamp field vacationRequest-last_changed_at.
append vacationRequest to vacationRequests.

vacationRequest-applicant = hmaieruuid.
vacationRequest-client        = sy-mandt.
vacationRequest-approver = lmuelleruuid.
vacationRequest-begin_date = '20230527'.
vacationRequest-end_date = '20230614'.
vacationRequest-commentary = ''.
vacationRequest-status = 'A'.
vacationRequest-id = cl_system_uuid=>create_uuid_x16_static( ).
get time stamp field vacationRequest-created_at.
vacationRequest-last_changed_by = 'generator'.
get time stamp field vacationRequest-last_changed_at.
append vacationRequest to vacationRequests.

vacationRequest-applicant = hmaieruuid.
vacationRequest-client        = sy-mandt.
vacationRequest-approver = lmuelleruuid.
vacationRequest-begin_date = '20231220'.
vacationRequest-end_date = '20231231'.
vacationRequest-commentary = 'Winterurlaub'.
vacationRequest-status = 'R'.
vacationRequest-id = cl_system_uuid=>create_uuid_x16_static( ).
get time stamp field vacationRequest-created_at.
vacationRequest-last_changed_by = 'generator'.
get time stamp field vacationRequest-last_changed_at.
append vacationRequest to vacationRequests.

vacationRequest-applicant = pschmidtuuid.
vacationRequest-client        = sy-mandt.
vacationRequest-approver = hmaieruuid.
vacationRequest-begin_date = '20231227'.
vacationRequest-end_date = '20231231'.
vacationRequest-commentary = 'Weihnachtsurlaub'.
vacationRequest-status = 'R'.
vacationRequest-id = cl_system_uuid=>create_uuid_x16_static( ).
get time stamp field vacationRequest-created_at.
vacationRequest-last_changed_by = 'generator'.
get time stamp field vacationRequest-last_changed_at.
append vacationRequest to vacationRequests.

  "Insert DBT Employees
  INSERT zpf_employee FROM TABLE @employees.
  out->write( |Inserted Employees: { sy-dbcnt }| ).

  insert zpf_vac_req from table @vacationRequests.
  out->write( |Inserted Vacation Requests: { sy-dbcnt }| ).

  insert zpf_vac_ent from table @vacationEntitlements.
  out->write( |Inserted Vacation Entitlements: { sy-dbcnt }| ).

  ENDMETHOD.
ENDCLASS.
