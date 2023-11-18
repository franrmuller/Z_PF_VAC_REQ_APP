@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Vacation Request'
define root view entity ZCPF_VAC_REQ as projection on ZRPF_VAC_REQ
{
    key Id,
    Applicant,
    Approver,
    BeginDate,
    EndDate,
    Commentary,
    Status,
    CreatedBy,
    CreatedAt,
    LastChangedBy,
    LastChangedAt

}
