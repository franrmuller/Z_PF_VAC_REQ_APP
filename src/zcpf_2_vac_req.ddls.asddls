@EndUserText.label: 'Vacation Request'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Search.searchable: true
@Metadata.allowExtensions: true
define view entity ZCPF_2_VAC_REQ as projection on ZRPF_VAC_REQ
{
        key VacationRequestId,
    
    @Consumption.valueHelpDefinition: [{ entity: {name: 'ZIPF_APPROVERVH', element: 'Id' } }]
    Applicant,
    Approver,
    BeginDate,
    EndDate,
    VacationDays,
    @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold: 0.7
    Commentary,
    Status,
   
    /* Administrative Data */
    CreatedBy,
    CreatedAt,
    LastChangedBy,
    LastChangedAt,
    
    /* Associations */
    _Employee : redirected to parent ZCPF_2_EMPLOYEE
  
}
