@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Employee'
define root view entity ZRPF_EMPLOYEE as select from zpf_employee
// composition of target_data_source_name as _association_name
{
    key id as Id,
    employee_number as EmployeeNumber,
    first_name as FirstName,
    last_name as LastName,
    entry_date as EntryDate
//    _association_name // Make association public
}
