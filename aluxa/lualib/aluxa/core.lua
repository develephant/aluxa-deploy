local Aluxa = {}
function Aluxa:new()
  local response = require('aluxa.response')

  local IntentRequest = require('aluxa.intentRequest')
  local LaunchRequest = require('aluxa.launchRequest')
  local SessionEndedRequest = require('aluxa.endedRequest')

  local skill = ngx.var.skill

  --body
  ngx.req.read_body()
  local d = ngx.req.get_body_data()

  local t = json.decode( d )

  local intent_type = t.request.type

  ngx.ctx.alexa = t

  local alx = {}
  alx.Intents = require(skill..'.Intents')

  local function intentHasFunction(intent_name)
    if alx.Intents[intent_name] then
      if type(alx.Intents[intent_name]) == 'function' then
        return true
      end
    end

    return false
  end

  if intent_type == 'LaunchRequest' then
    if intentHasFunction('LaunchIntent') then
      alx.Intents['LaunchIntent'](response, LaunchRequest.new(t))
    end
  elseif intent_type == 'IntentRequest' then
    ngx.ctx.intent = t.request.intent
    if intentHasFunction(ngx.ctx.intent.name) then
      alx.Intents[ngx.ctx.intent.name](response, IntentRequest.new(t))
    end
  elseif intent_type == 'SessionEndedRequest' then
    if intentHasFunction('EndIntent') then
      alx.Intents['EndIntent'](t.request.reason, SessionEndedRequest.new(t))
    end
  end

  return alx
end
return Aluxa
