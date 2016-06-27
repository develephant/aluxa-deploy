local resp = {}

function resp.tell( speech, attr, card, type )
  if card then
    card = card:get()
  end

  local m =
  {
    version = "1.0",
    sessionAttributes = attr or nil,
    response =
    {
      outputSpeech =
      {
        type = "PlainText",
        text = speech
      },
      card = card or nil,
      shoudEndSession = true
    }
  }
  local s = json.encode( m )
  ngx.say( s )
  ngx.exit(200)
end

function resp.ask( speech, prompt, attr, card, type )
  if card then
    card = card:get()
  end

  local m =
  {
    version = "1.0",
    sessionAttributes = attr or nil,
    response =
    {
      outputSpeech =
      {
        type = "PlainText",
        text = speech
      },
      card = card or nil,
      reprompt =
      {
        outputSpeech =
        {
          type = "PlainText",
          text = prompt
        }
      },
      shoudEndSession = false
    }
  }
  local s = json.encode( m )
  ngx.say( s )
  ngx.exit(200)
end

return resp
