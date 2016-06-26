local m =
{
  mongo = nil,
  db = nil,
  database = nil,
  collection = nil
}

function m:new( database, collection )
  self.database = database or nil
  self.collection = collection or nil

  local mongol = require('resty.mongol')

  self.mongo = mongol:new()
  local ok, err = self.mongo:connect('127.0.0.1')
  if not ok then
    return ok, err
  end

  self.db = self.mongo:new_db_handle( self.database )
  self.coll = self.db:get_col( self.collection )

  self.insert = function( insert_obj )
    return self.coll:insert({ insert_obj })
  end

  self.find = function( find_query )
    local _, res, info = self.coll:query( find_query )
    if info.QueryFailure then
      return nil, res
    end

    local recs = {}
    for _, rec in ipairs( res ) do
      rec.createdAt = rec._id:get_ts()
      rec._id = rec._id:tostring()
      table.insert( recs, rec )
    end
    return true, recs
  end

  self.update = function( update_query, update_obj, single )
    local single = single or 1
    return self.coll:update( update_query, {["$set"] = update_obj}, single )
  end

  self.delete = function( delete_query, single )
    local single = single or 1
    return self.coll:delete( delete_query, single )
  end

  return true, self
end


return m
