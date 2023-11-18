CLASS zpf_employee_generator DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .
  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZPF_EMPLOYEE_GENERATOR IMPLEMENTATION.


   METHOD if_oo_adt_classrun~main.

DATA employees TYPE TABLE OF zpf_employee.
    DATA employee TYPE zpf_employee.

" Delete DBT Employee
DELETE FROM zpf_employee.

"Create Employees
employee-employee_number = 1.
  employee-first_name = 'Hans'.
  employee-last_name = 'Maier'.
  employee-entry_date = '20000501'.
  employee-created_by = 'GENERATOR'.
  GET TIME STAMP FIELD employee-created_at.
  employee-last_changed_by = 'GENERATOR'.
  GET TIME STAMP FIELD employee-last_changed_at.
  APPEND employee TO employees.

 employee-employee_number = 2.
  employee-first_name = 'Lisa'.
  employee-last_name = 'Müller'.
  employee-entry_date = '2010207'.
  employee-created_by = 'GENERATOR'.
  GET TIME STAMP FIELD employee-created_at.
  employee-last_changed_by = 'GENERATOR'.
  GET TIME STAMP FIELD employee-last_changed_at.
  APPEND employee TO employees.

 employee-employee_number = 1.
  employee-first_name = 'Petra'.
  employee-last_name = 'Schmidt'.
  employee-entry_date = '20221001'.
  employee-created_by = 'GENERATOR'.
  GET TIME STAMP FIELD employee-created_at.
  employee-last_changed_by = 'GENERATOR'.
  GET TIME STAMP FIELD employee-last_changed_at.
  APPEND employee TO employees.


  "Insert DBT Employees
  INSERT zpf_employee FROM TABLE @employees.

  ENDMETHOD.
ENDCLASS.
