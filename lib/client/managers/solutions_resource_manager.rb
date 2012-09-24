# To change this template, choose Tools | Templates
# and open the template in the editor.
require 'rest_client'
require 'pp'
require 'active_support'
require 'hashie/mash'
require 'connection_pool'
require 'json'
require 'logging'

module Client
  module Managers
    Logging.logger.root.appenders = Logging.appenders.stdout
    Logging.logger.root.level = :info      
  
    class SolutionsResourceManager
      SOLUTION_URI = '/rs/solutions/'
   
      def initialize(url, user, password)
        rest_url = url+SOLUTION_URI
        @memcached= ConnectionPool.new(:size=>5, :timeout=>10){
          RestClient::Resource.new(rest_url,:user=>user, :password=>password, :timeout=>1000 )
        }
        @log = Logging.logger[self]          
      end
    
      def get_by_id(solution_id, is_published=true)
        @memcached.with_connection do|site|
          sub_url = solution_id+'/?isPublished='+is_published.to_s
          @log.info 'sub-url: '+sub_url
          response = site[sub_url].get :accept=>'application/json'
          solution_str = response.to_s
          solution_hash = ActiveSupport::JSON.decode solution_str        
          solution = Hashie::Mash.new(solution_hash)
          return solution
        end
      end
    
      def get_by_keyword(keyword='')
        @memcached.with_connection do|site|
          sub_url = '/?keyword='+keyword
          response = site[sub_url].get :accept=>'application/json'
          solution_str = response.to_s
          solution_hash = ActiveSupport::JSON.decode solution_str        
          solutions = Hashie::Mash.new(solution_hash)
          return solutions
        end
      end
    
      def create(solution={})
        @memcached.with_connection do |site|
          solution_json = solution.to_json
          response = site.post solution_json, :content_type=>'application/json', :accept=>'application/json'
          return response
        end
      end
    
      def update(solution={}, solution_id)
        @memcached.with_connection do |site|
          solution_json = solution.to_json
          response = site[solution_id].put solution_json, :content_type=>'application/json', :accept=>'application/json'
          return response
        end
      end
    
    end
  end
end
