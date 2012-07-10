# To change this template, choose Tools | Templates
# and open the template in the editor.
require 'yaml'
module Client
  class ClientConfig
    attr_accessor :url 
    attr_reader :user 
    attr_reader :password 
    def initialize(file_path, section)
      config = YAML.load_file(file_path)
      @url = config[section]['url']
      @user = config[section]['user']
      @password = config[section]['password']
    end
  end
end
