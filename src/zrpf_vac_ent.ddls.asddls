@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Vacation Entitlement'
@Metadata.allowExtensions: true
define view entity ZRPF_VAC_ENT 
as select from zpf_vac_ent
association to parent ZRPF_EMPLOYEE as _Employee on $projection.Employee = _Employee.Id
// composition of target_data_source_name as _association_name
{
   @EndUserText: {label: 'Vacation Entitlement ID', quickInfo: 'Vac. Ent. ID'}
   key id as VacationEntitlementId,
   @EndUserText: {label: 'Employee ID', quickInfo: 'Employee ID'}
   employee as Employee,
   year_of_vacation as YearOfVacation,
   number_of_vacation_days as NumberOfVacationDays,
   
   /* Administrative Data*/
   @Semantics.user.createdBy: true
   created_by as CreatedBy,
   @Semantics.systemDateTime.createdAt: true
   created_at as CreatedAt,
   @Semantics.user.lastChangedBy: true
   last_changed_by as LastChangedBy,
   @Semantics.systemDateTime.lastChangedAt: true
   last_changed_at as LastChangedAt,
    
    _Employee
}
