local IntentRequest = {}

IntentRequest.new = function(request_tbl)
  local t = request_tbl
  local m = {}

  m.getVersion = function()
    return t.version
  end

  m.getRequest = function()
    return t.request
  end

  m.getSession = function()
    return t.session
  end

  m.isNewSession = function()
    return t.session.new
  end

  m.getSessionId = function()
    return t.session.sessionId
  end

  m.getApplication = function()
    return t.application
  end

  m.getApplicationId = function()
    return t.application.applicationId
  end

  m.getAttributes = function()
    return t.session.attributes
  end

  m.getUserId = function()
    return t.session.user.userId
  end

  m.getUser = function()
    return t.session.user
  end

  m.getRequestType = function()
    return t.request.type
  end

  m.getRequestId = function()
    return t.request.requestId
  end

  m.getRequestTimestamp = function()
    return t.request.timestamp
  end

  m.getRequestIntent = function()
    return t.request.intent
  end

  m.getRequestIntentName = function()
    return t.request.intent.name
  end

  m.getRequestIntentSlots = function()
    return t.request.intent.slots
  end

  return m
end

return IntentRequest
