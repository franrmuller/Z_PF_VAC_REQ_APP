@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Employee'
define root view entity ZRPF_EMPLOYEE 
as select from zpf_employee
composition [1..1] of ZRPF_VAC_ENT as _VacationEntitlements
composition [0..*] of ZRPF_VAC_REQ as _VacationRequests
{
    key id as Id,
    first_name as FirstName,
    employee_number as EmployeeNumber,
    last_name as LastName,
    entry_date as EntryDate,
    created_by as CreatedBy,
    created_at as CreatedAt,
    last_changed_by as LastChangedBy,
    last_changed_at as LastChangedAt,
    
    _VacationEntitlements,
    _VacationRequests
}
