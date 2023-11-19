@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Vacation Request'
define view entity ZRPF_VAC_REQ as select from zpf_vac_req
association to parent ZRPF_EMPLOYEE as _Employee on $projection.Id = _Employee.Id
{   
  key id       as Id,
  applicant       as Applicant,
  approver        as Approver,
  begin_date      as BeginDate,
  end_date        as EndDate,
  commentary      as Commentary,
  status          as Status,
  created_by as CreatedBy,
  created_at as CreatedAt,
  last_changed_by as LastChangedBy,
  last_changed_at as LastChangedAt,
  
  _Employee
   
}
