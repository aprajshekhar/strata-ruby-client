require_relative 'client/utils/xml_util'
require_relative 'client/utils/file_util'

#check whether strata.xsd is newer than strata.rb
#if yes generate mapping classes
if Utils::FileUtil.is_new?('client/schema/strata.xsd', 'client/model/strata.rb')
 status = Utils::XmlUtil.genrate_class_def('client/schema/strata.xsd')
 exit(1) unless status == true
 #this is a crude hack. Need a better way
 
#  text = File.read("client/model/strata_mapper.rb")
#   replaced_text = text.gsub(/require/, 'require_relative') 
#   File.open("client/model/strata_mapper.rb", "w") { |file|
#     file.puts replaced_text
#      
#   }
#  text = File.read("/model/strata_mapping_registry.rb")
#  
#   replaced_text = text.gsub(/require 'client\/model\/strata.rb'/, "require_relative '../model/strata.rb'") 
#   File.open("client/model/strata_mapping_registry.rb", "w") { |file|
#     file.puts replaced_text
#      
#   } 
else
  puts "Model files are uptodate"  
end
