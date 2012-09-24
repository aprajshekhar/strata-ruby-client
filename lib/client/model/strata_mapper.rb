require_relative '../model/strata_mapping_registry.rb'

module Client; module Model

class ClientModelStrataMapper < XSD::Mapping::Mapper
  def initialize
    super(ClientModelStrataMappingRegistry::Registry)
  end
end

end; end
