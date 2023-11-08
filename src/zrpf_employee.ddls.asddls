@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Employee'
define root view entity ZRPF_EMPLOYEE as select from zpf_employee
//composition of target_data_source_name as _association_name
{
    key id as Id,
    first_name as FirstName,
    employee_number as EmployeeNumber,
    last_name as LastName,
    entry_date as EntryDate,
    created_by as CreatedBy,
    created_at as CreatedAt,
    last_changed_by as LastChangedBy,
    last_changed_at as LastChangedAt
//    _association_name // Make association public
}
