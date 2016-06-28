local m = {}

function m.new(result_arr)
  local rs =
  {
    result = result_arr or {}
  }

  function rs:count()
    return #self.result
  end

  function rs:first()
    return self.result[1]
  end

  function rs:last()
    return self.result[self:count()]
  end

  function rs:get(pos)
    return self.result[pos]
  end

  function rs:all()
    return self.result
  end

  function rs:put(pos, record)
    return table.insert(self.result, pos, record)
  end

  function rs:del(pos)
    return table.remove(self.result, pos)
  end

  function rs:flush()
    self.result = {}
    return true
  end

  return rs
end

return m
