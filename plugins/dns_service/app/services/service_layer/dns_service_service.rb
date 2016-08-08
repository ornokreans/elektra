module ServiceLayer

  class DnsServiceService < Core::ServiceLayer::Service

    def driver
      @driver ||= DnsService::Driver::Fog.new({
        auth_url:   self.auth_url,
        region:     self.region,
        token:      self.token,
        domain_id:  self.domain_id,
        project_id: self.project_id  
      })
    end
    
    def available?(action_name_sym=nil)
      true  
    end
    
    def zones(filter={})
      driver.map_to(DnsService::Zone).list_zones(filter)
    end
    
    def find_zone(id)
      driver.map_to(DnsService::Zone).get_zone(id)
    end
    
    def recordsets(zone_id,options={})
      driver.map_to(DnsService::Recordset).list_recordsets(zone_id,options)
    end
    
    def find_recordset(zone_id,recordset_id)
      driver.map_to(DnsService::Recordset).get_recordset(zone_id,recordset_id)
    end
    
    def new_recordset(zone_id,attributes={})
      DnsService::Recordset.new(driver,attributes.merge(zone_id: zone_id))
    end
    
    def delete_recordset(zone_id,id)
      driver.delete_recordset(zone_id,id)
    end
  end
end