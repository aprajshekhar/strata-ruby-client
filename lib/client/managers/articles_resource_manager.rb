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
    end
    
    def get_by_id(article_id, is_published=true)
      @memcached.with_connection do|site|
        sub_url = article_id+'/?isPublished='+is_published.to_s
        @log.info 'sub-url: '+sub_url
        response = site[sub_url].get :accept=>'application/json'
        article_str = response.to_s
        article_hash = ActiveSupport::JSON.decode article_str        
        article = Hashie::Mash.new(article_hash)
        return article
      end
    end
     
    def create(article={})
      @memcached.with_connection do |site|
        article_json = article.to_json
        response = site.post article_json, :content_type=>'application/json', :accept=>'application/json'
        return response
      end
    end
    
     def update(article={}, article_id)
      @memcached.with_connection do |site|
        article_json = article.to_json
        response = site[article_id].put article_json, :content_type=>'application/json', :accept=>'application/json'
        return response
      end
    end
    
  end
end
