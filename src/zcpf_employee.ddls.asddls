@EndUserText.label: 'Employee'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Search.searchable: true
@Metadata.allowExtensions: true
define root view entity ZCPF_EMPLOYEE
 provider contract transactional_query
 as projection on ZRPF_EMPLOYEE
{
    key Id,
    
    EmployeeNumber,
    
    @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold: 0.7
    FirstName,
    
    @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold: 0.7
    LastName,
    
    EntryDate,
    
    /* Administrative Data */
    CreatedBy,
    
    CreatedAt,
    
    LastChangedBy,
    
    LastChangedAt,
    
    /* Transient Data */
    EmployeeName,
    
    /* Associations */
    _VacationEntitlements : redirected to composition child ZCPF_VAC_ENT,
    _VacationRequests : redirected to composition child ZCPF_VAC_REQ
}
