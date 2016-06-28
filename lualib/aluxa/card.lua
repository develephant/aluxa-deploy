local Card = {}

Card.SIMPLE = 'Simple'
Card.STANDARD = 'Standard'
Card.LINK_ACCOUNT = 'LinkAccount'

Card.new = function(type)
  local c =
  {
    cardObj =
    {
      type = type or Card.SIMPLE,
      title = nil,
      content = nil,
      text = nil,
      image =
      {
        smallImageUrl = nil,
        largeImageUrl = nil
      }
    }
  }

  function c:setType(type)
    self.cardObj.type = type or Card.SIMPLE
  end

  function c:setTitle(title)
    self.cardObj.title = title or nil
  end

  function c:setText(text)
    if self.cardObj.type == Card.SIMPLE then
      self.cardObj.content = text or nil
    else
      self.cardObj.text = text or nil
    end
  end

  function c:setSmallImageUrl(url)
    self.cardObj.image.smallImageUrl = url or nil
  end

  function c:setLargeImageUrl(url)
    self.cardObj.image.largeImageUrl = url or nil
  end

  function c:get()
    if (self.cardObj.image.smallImageUrl == nil) and (self.cardObj.image.largeImageUrl == nil) then
      self.cardObj.image = nil
    end

    return self.cardObj
  end

  return c
end


return Card
