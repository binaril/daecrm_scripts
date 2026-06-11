select *
from "MotivationRules" where "Name" like  'Proc';

select *
from "MotivationPercentGroups" where "MotivationRuleId" = 42;

select *
from "MotivationPercentages" where "MotivationPercentGroupId" = 305;

select *
from "MotivationPercentCarModels" where "MotivationPercentGroupId" = 305;