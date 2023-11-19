@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Vacation Entitlement'
define view entity ZRPF_VAC_ENT 
as select from zpf_vac_ent
association to parent ZRPF_EMPLOYEE as _Employee on $projection.ID = _Employee.Id
// composition of target_data_source_name as _association_name
{
   key id as ID,
   employee as Employee,
   year_of_vacation as YearOfVacation,
   number_of_vacation_days as NumberOfVacationDays,
   created_by as CreatedBy,
   created_at as CreatedAt,
   last_changed_by as LastChangedBy,
   last_changed_at as LastChangedAt,
    
    _Employee
}
