require_relative 'client/model/strata_mapping_registry.rb'

class ClientModelStrataMapper < XSD::Mapping::Mapper
  def initialize
    super(ClientModelStrataMappingRegistry::Registry)
  end
end
