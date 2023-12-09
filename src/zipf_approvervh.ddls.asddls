@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Approver Value Help'
define view entity ZIPF_APPROVERVH as select from zpf_employee
{
    key id as Id,
    first_name as FirstName,
    employee_number as EmployeeNumber,
    last_name as LastName,
    entry_date as EntryDate
}
