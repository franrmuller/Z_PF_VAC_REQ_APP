@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Vacation Entitlement'
define root view entity ZCPF_VAC_ENT 
as projection on ZRPF_VAC_ENT
{
    key ID,
    
    YearOfVacation,
    NumberOfVacationDays,
    CreatedBy,
    CreatedAt,
    LastChangedBy,
    LastChangedAt
    
    //_association_name // Make association public
}
