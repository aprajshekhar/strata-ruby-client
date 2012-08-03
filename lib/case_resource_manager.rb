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
=begin
= SYNOPSIS
    A wrapper class for a Case resource.
= DESCRIPTION
    The functionalities provided are
==
    1. get case by Id
    2. list case - the query params can be details=true/false, include_closed=true/false, start_date, end_date and start_date..end_date
    3. create case
    4. update a case
    5. create comment
    
    To use this class
    1. Instantiate the class e.g manager = Client::CaseResourceManager.new(url, user_name, password)
                                   where url is the url of the host
    2. Call the required method e.g. kase = manger.get_by_id('00123000')
    3. The objects returned by get and list methods are Hashie objects i.e. hashes that can be used as objects
=end
 Logging.logger.root.appenders = Logging.appenders.stdout
 Logging.logger.root.level = :info         

  class CaseResourceManager
    CASE_URI = '/rs/cases/'
    COMMENTS_URI = '/comments/'
    
    def initialize(url, user, password)
      rest_url = url+CASE_URI
      @memcached= ConnectionPool.new(:size=>5, :timeout=>10){
        RestClient::Resource.new(rest_url,:user=>user, :password=>password, :timeout=>1000 )
      }
      @log = Logging.logger[self]
    end

=begin
= SYNOPSIS
 Returns the case for the specified <code>id</code>   
 
=end    
    
    def get_by_id(id)
      @memcached.with_connection do |site|
        response = site[id].get :accept=>'application/json'
        case_str = response.to_s
        kase_hash = ActiveSupport::JSON.decode case_str
        
        kase = Hashie::Mash.new(kase_hash)
        return kase
        
      end
    end

    def list(options={}, csv_output=false)
      @memcached.with_connection do |site|
        query_param = build_query_param(options)
        if csv_output == true
          accept = 'text/csv'
        else
          accept = 'application/json'
        end
        
        @log.info 'query param:'+query_param
        @log.info 'accept: '+ accept
        
        response = site[query_param].get :accept=>accept
        
        case_str = response.to_s
        
        unless csv_output == true
          kase_hash = ActiveSupport::JSON.decode case_str
          kases = Hashie::Mash.new(kase_hash)
          return kases
        else
          return case_str
        end
        
      end
    end
    
    def create(kase={})
      @memcached.with_connection do |site|
        str = kase.to_json
        puts str
        response = site.post str, :content_type=>'application/json', :accept=>'application/xml'
        return response
        
      end
    end
    
    def update(kase={}, id)
      @memcached.with_connection do |site|
        str = kase.to_json
        puts str
        response = site[id].put str, :content_type=>'application/json', :accept=>'application/xml'
        return response
        
      end
    end
    
    def add_comment(comment={}, case_id)
      @memcached.with_connection do |site|
        str = comment.to_json
        response = site[case_id+COMMENTS_URI].post str, :content_type=>'application/json', :accept=>'application/json'
        return response
        
      end
    end
    
    def update_comment(comment={}, case_id,comment_id)
      @memcached.with_connection do |site|
        str = comment.to_json
        response = site[case_id+COMMENTS_URI+comment_id].post str, :content_type=>'application/json', :accept=>'application/json'
        return response
        
      end
    end
    
    def set_comment_public(case_id, comment_id)
      @memcached.with_connection do |site|
        str = comment.to_json
        response = site[case_id+COMMENTS_URI+comment_id+'/status'].post str, :content_type=>'application/json', :accept=>'application/json'
        return response
        
      end
    end
    
    def list_comments(options={}, case_no)
      @memcached.with_connection do |site|
        query_param = build_query_param(options, true)
         
        puts 'query param:'+query_param
         
         
        response = site[case_no+COMMENTS_URI+query_param].get :accept=>'application/json'
         
        case_str = response.to_s
        kase_hash = ActiveSupport::JSON.decode case_str
        kases = Hashie::Mash.new(kase_hash)
        return kases
             
         
      end
    end
    
    def add_attachment(case_no,attachment_path, is_private=false )
      @memcached.with_connection do |site|
        response = site[case_no+'/attachments'].post :file => File.new(attachment_path, 'rb'), :accept=>'application/json'
        return response
      end
      
    end
    
    private
    def build_query_param(options={}, for_comments=false)
      query_param = ''

      query_param = '?group='+options[:group][:param] unless options[:group].nil?
      query_param = '?detail='+options[:detail] unless options[:details].nil?      
      
      if for_comments
        #noting to be done at present
      else
        unless options[:start_date].nil? || options[:end_date].nil?
          query_param = '?startDate='+options[:start_date] + '&endDate='+options[:end_date]
        else
          query_param = '?startDate='+options[:start_date] unless options[:start_date].nil? 
          query_param = '?endDate='+options[:end_date] unless options[:end_date].nil?   
        end   
      end  
        
      

      query_param = '?includeClosed='+options[:include_closed] unless options[:include_closed].nil?
      query_param = '?query='+options[:query] unless options[:q].nil?
      
      return query_param
    end

  end
end

