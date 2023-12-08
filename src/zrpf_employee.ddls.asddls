@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Employee'
define root view entity ZRPF_EMPLOYEE 
as select from zpf_employee
composition [0..*] of ZRPF_VAC_ENT as _VacationEntitlements
composition [0..*] of ZRPF_VAC_REQ as _VacationRequests
association [1..1] to ZIPF_EMPLOYEETEXT as _EmployeeText on $projection.Id = _EmployeeText.Id
{
    @EndUserText: {label: 'Employee ID', quickInfo: 'Employee ID'}
    @ObjectModel.text.element: ['EmployeeName']
    key id as Id,
    first_name as FirstName,
    employee_number as EmployeeNumber,
    last_name as LastName,
    entry_date as EntryDate,
    
    /* Administative Data */
    @Semantics.user.createdBy: true
    created_by as CreatedBy,
    @Semantics.systemDateTime.createdAt: true
    created_at as CreatedAt,
    @Semantics.user.lastChangedBy: true
    last_changed_by as LastChangedBy,
    @Semantics.systemDateTime.lastChangedAt: true
    last_changed_at as LastChangedAt,
    
    /* Transient Data */
    _EmployeeText.Name as EmployeeName,
    
    /* Associations */
    _VacationEntitlements,
    _VacationRequests
}
