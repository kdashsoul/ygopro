--差し戻し
function c47247413.initial_effect(c)
	--Activate
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_ACTIVATE)
	e1:SetCategory(CATEGORY_TODECK)
	e1:SetCode(EVENT_TO_HAND)
	e1:SetCondition(c47247413.condition)
	e1:SetTarget(c47247413.target)
	e1:SetOperation(c47247413.activate)
	c:RegisterEffect(e1)
end
function c47247413.condition(e,tp,eg,ep,ev,re,r,rp)
	return ep~=tp and eg:IsExists(Card.IsPreviousLocation,1,nil,LOCATION_GRAVE)
end
function c47247413.target(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return true end
	Duel.SetTargetCard(eg)
	Duel.SetOperationInfo(0,CATEGORY_TODECK,eg,1,0,0)
end
function c47247413.filter(c,e)
	return c:IsPreviousLocation(LOCATION_GRAVE) and c:IsRelateToEffect(e)
end
function c47247413.activate(e,tp,eg,ep,ev,re,r,rp)
	local g=eg:Filter(c47247413.filter,nil,e)
	if g:GetCount()==0 then return end
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_TODECK)
	local rg=g:Select(1-tp,1,1,nil)
	Duel.ConfirmCards(tp,rg)
	Duel.SendtoDeck(rg,nil,2,REASON_EFFECT)
end
