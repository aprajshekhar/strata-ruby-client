# To change this template, choose Tools | Templates
# and open the template in the editor.
require 'rest_client'
require 'pp'
require 'active_support'
require 'hashie/mash'
require 'connection_pool'
require 'json'
require 'logging'
require 'xsd/mapping'
require_relative '../model/strata_mapper.rb'
require_relative '../model/strata.rb'
module Client
  module Managers
    Logging.logger.root.appenders = Logging.appenders.stdout
    Logging.logger.root.level = :info    
  
    class ArticlesResourceManager
      ARTICLES_URI = '/rs/articles/'
    
      def initialize(url, user, password)
        rest_url = url+ARTICLES_URI
        @memcached= ConnectionPool.new(:size=>5, :timeout=>10){
          RestClient::Resource.new(rest_url,:user=>user, :password=>password, :timeout=>1000 )
        }
        @log = Logging.logger[self]          
        @mapper = Client::Model::ClientModelStrataMapper.new
      end
    
      def get_by_id(article_id, is_published=true)
        @memcached.with_connection do|site|
          sub_url = article_id+'?isPublished='+is_published.to_s
          @log.info 'sub-url: '+sub_url
          response = site[sub_url].get :accept=>'application/xml'
          article_str = response.to_s
          article = @mapper.xml2obj(article_str);
          return article
        end
      end
     
      def create(article)
        @memcached.with_connection do |site|
          article_xml = @mapper.obj2xml(article)
          response = site.post article_xml, :content_type=>'application/xml', :accept=>'application/xml'
          return response
        end
      end
    
      def update(article, article_id)
        @memcached.with_connection do |site|
          article_xml = @mapper.obj2xml(article)
          response = site[article_id].put article_xml, :content_type=>'application/xml', :accept=>'application/xml'
          return response
        end
      end
    
    end
  end
end
