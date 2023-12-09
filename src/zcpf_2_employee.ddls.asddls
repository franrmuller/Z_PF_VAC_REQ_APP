@EndUserText.label: 'Employee'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Search.searchable: true
@Metadata.allowExtensions: true
define root view entity ZCPF_2_EMPLOYEE 
provider contract transactional_query
as projection on ZRPF_EMPLOYEE
{

    key Id,
    
    @Consumption.valueHelpDefinition: [{ entity: {name: 'ZIPF_EMPLOYEEVH', element: 'EmployeeNumber' } }]
    EmployeeNumber,
    
    @Consumption.valueHelpDefinition: [{ entity: {name: 'ZIPF_EMPLOYEEVH', element: 'FirstName' } }]
    @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold: 0.7
    FirstName,
    
    @Consumption.valueHelpDefinition: [{ entity: {name: 'ZIPF_EMPLOYEEVH', element: 'LastName' } }]
    @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold: 0.7
    LastName,
    
    @Consumption.valueHelpDefinition: [{ entity: {name: 'ZIPF_EMPLOYEEVH', element: 'EntryDate' } }]
    EntryDate,
    
    /* Administrative Data */
    CreatedBy,
    CreatedAt,
    LastChangedBy,
    LastChangedAt,
    
    /* Transient Data */
    EmployeeName
    
    /* Associations */
    
}
