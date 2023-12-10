@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Vacation Request'
@Metadata.allowExtensions: true
define view entity ZCPF_VAC_REQ as projection on ZRPF_VAC_REQ
{
    key VacationRequestId,
    Applicant,
    Approver,
    BeginDate,
    EndDate,
    // VacationDays,
    Commentary,
    @Consumption.valueHelpDefinition: [{ entity: { name: 'ZIPF_StatusVH', element: 'Status' } }]
    Status,
    
    /* Administrative Data */
    CreatedBy,
    CreatedAt,
    LastChangedBy,
    LastChangedAt,
    
    /* Transient Data */
    StatusCriticality,
    
    /* Associations */
    _Employee : redirected to parent ZCPF_EMPLOYEE   
}
