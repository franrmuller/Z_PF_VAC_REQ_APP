@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Employee Text'
define view entity ZIPF_EMPLOYEETEXT
as select from zpf_employee
{
  key id                                 as Id,
      first_name as FirstName,
    employee_number as EmployeeNumber,
    last_name as LastName,

      /* Transient Data */
      concat_with_space(first_name, last_name, 1) as Name

}
