select * from "BoltDrivers" where "CompanyId"=2 and "LastName" like '%Hassan%'

select *
f;


EXPLAIN ANALYZE
SELECT b."Id", b."BoltUuid", b."CompanyId", b."CreatedDate", b."Email", b."FirstName", b."HasCashPayment", b."IsBlocked", b."LastName", b."ModifiedDate", b."PartnerUuid", b."Phone", b."UserId", b."WorkStatus"
 FROM "BoltDrivers" AS b
 WHERE b."CompanyId" = 2 AND b."BoltUuid" = 'e2fc0c96-b74c-44c7-ac2f-00780a26e554'
 LIMIT 1

