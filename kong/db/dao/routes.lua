local insert = table.insert


local _Routes = {}


local function host_to_headers(entity)
  if not entity then
    return
  end

  if type(entity.hosts) == "table" then
    for _, host in ipairs(entity.hosts) do
      if not entity.headers then
        entity.headers = {}
      end

      if not entity.headers.host then
        entity.headers.host = {}
      end

      insert(entity.headers.host, host)
    end
  end

  entity.hosts = nil

  return entity
end


function _Routes:insert(entity, options)
  entity = host_to_headers(entity)
  return self.super.insert(self, entity, options)
end


function _Routes:update(pk, entity, options)
  entity = host_to_headers(entity)
  return self.super.update(self, pk, entity, options)
end


function _Routes:update_by_name(name, entity, options)
  entity = host_to_headers(entity)
  return self.super.update_by_name(self, name, entity, options)
end


function _Routes:upsert(pk, entity, options)
  entity = host_to_headers(entity)
  return self.super.upsert(self, pk, entity, options)
end


function _Routes:upsert_by_name(name, entity, options)
  entity = host_to_headers(entity)
  return self.super.upsert_by_name(self, name, entity, options)
end


return _Routes
