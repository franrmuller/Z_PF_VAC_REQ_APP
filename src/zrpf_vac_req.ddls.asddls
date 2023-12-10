@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Vacation Request'
define view entity ZRPF_VAC_REQ as select from zpf_vac_req
association to parent ZRPF_EMPLOYEE as _Employee on $projection.Applicant = _Employee.Id
{   
  @EndUserText: {label: 'Vacation Request ID', quickInfo: 'Vac. Req. ID'}
  key id as VacationRequestId,
  @EndUserText: {label: 'Applicant ID', quickInfo: 'Applicant ID'}
  applicant       as Applicant,
  @EndUserText: {label: 'Approver ID', quickInfo: 'Approver ID'}
  approver        as Approver,
  begin_date      as BeginDate,
  end_date        as EndDate,
  vacation_days as VacationDays,
  commentary      as Commentary,
  status          as Status,
  
  /* Adaministrative Data */
  @Semantics.user.createdBy: true
  created_by as CreatedBy,
  @Semantics.systemDateTime.createdAt: true
  created_at as CreatedAt,
  @Semantics.user.lastChangedBy: true
  last_changed_by as LastChangedBy,
  @Semantics.systemDateTime.lastChangedAt: true
  last_changed_at as LastChangedAt,
  
  /*Transient Data */
  case status when 'A' then 3
             when 'C' then 1
             else 0
  end       as StatusCriticality,
  
  /* Associations */
  _Employee
     
}
