@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Vacation Entitlement'
@Metadata.allowExtensions: true
define view entity ZCPF_VAC_ENT 
as projection on ZRPF_VAC_ENT
{
    key VacationEntitlementId,
    Employee,
    YearOfVacation,
    NumberOfVacationDays,
    
    /* Administrative Data */
    CreatedBy,
    CreatedAt,
    LastChangedBy,
    LastChangedAt,
    
    /* Associations */
    _Employee : redirected to parent ZCPF_EMPLOYEE
}
