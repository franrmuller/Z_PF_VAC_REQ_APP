@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Vacation Entitlement'
define view entity ZCPF_VAC_ENT 
as projection on ZRPF_VAC_ENT
{
    key VacationEntitlementID,
    Employee,
    YearOfVacation,
    NumberOfVacationDays,
    CreatedBy,
    CreatedAt,
    LastChangedBy,
    LastChangedAt,
    
    _Employee : redirected to parent ZCPF_EMPLOYEE
}
