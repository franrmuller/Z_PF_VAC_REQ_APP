@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Employee Text'
define view entity ZIPF_EMPLOYEETEXT
as select from zpf_employee
{
 
    key id as Id,
    employee_number as EmployeeNumber,
    first_name as FirstName,
    last_name as LastName,
    entry_date as EntryDate,
    created_by as CreatedBy,
    created_at as CreatedAt,
    last_changed_by as LastChangedBy,
    last_changed_at as LastChangedAt,

      /* Transient Data */
      concat_with_space(first_name, last_name, 1) as Name
      
      

}
