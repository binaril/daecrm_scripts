select * from "YandexDrivers" yd
inner join "Users" u on yd."UserId" = u."Id"
where u."IsBlocked"

884
774
823


select * from "YandexDrivers" where "Id" in (884, 774, 823);


select * from "YandexOrders" where "YandexDriverId" in (823, 774);