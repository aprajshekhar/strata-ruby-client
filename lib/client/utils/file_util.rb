# To change this template, choose Tools | Templates
# and open the template in the editor.

module Utils
  class FileUtil
    def self.is_new?(xsd_path,class_def_path)
      if File.exist?(class_def_path)
      return File.mtime(xsd_path) > File.mtime(class_def_path)?true:false
      else
        return true
      end
    end
  end
end
