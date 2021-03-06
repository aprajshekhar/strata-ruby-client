# To change this template, choose Tools | Templates
# and open the template in the editor.
require 'rest_client'
require 'pp'
require 'active_support'
require 'hashie/mash'
require 'connection_pool'
require 'json'
require 'logging'
require_relative '../model/strata'
require_relative '../model/strata_mapper'
module Client
  
  module Managers
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
    2. Call the required method e.g. kase = manager.get_by_id('00123000')
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
        @mapper = Client::Model::ClientModelStrataMapper.new
      end

=begin
= SYNOPSIS
 Returns the case for the specified <code>id</code>   
 
=end    
    
      def get_by_id(id)
        @memcached.with_connection do |site|
          response = site[id].get :accept=>'application/xml'
          case_str = response.to_s
          kase = @mapper.xml2obj(case_str)
          return kase
        
        end
      end
=begin
= SYNOPSIS
 Returns list of cases based on  <code>options/code>   
 The options can be
 1. start_date
 2. end_date
 3. include_closed (values can be true/false)
 4. group (values can be ALL, NONE OR the ID of the group)
 5. details (values can be true/false)
=end   
      def list(options={}, csv_output=false)
        @memcached.with_connection do |site|
          query_param = build_query_param(options)
          if csv_output == true
            accept = 'text/csv'
          else
            accept = 'application/xml'
          end
        
          @log.info 'query param:'+query_param
          @log.info 'accept: '+ accept
        
          response = site[query_param].get :accept=>accept
        
          case_str = response.to_s
        
          unless csv_output == true
            kases = @mapper.xml2obj(case_str)
            return kases
          else
            return case_str
          end
        
        end
      end
    
      def create(kase)
        @memcached.with_connection do |site|
          str = @mapper.obj2xml(kase)
          puts str
          response = site.post str, :content_type=>'application/xml', :accept=>'application/xml'
          return response
        
        end
      end
    
      def update(kase, id)
        @memcached.with_connection do |site|
          str = @mapper.obj2xml(kase)
          puts str
          response = site[id].put str, :content_type=>'application/xml', :accept=>'application/xml'
          return response
        
        end
      end
    
      def add_comment(comment, case_id)
        @memcached.with_connection do |site|
          str = @mapper.xml2obj(comment)
          response = site[case_id+COMMENTS_URI].post str, :content_type=>'application/xml', :accept=>'application/xml'
          return response
        
        end
      end
    
      def update_comment(comment, case_id,comment_id)
        @memcached.with_connection do |site|
          str = @mapper.obj2xml(comment)
          response = site[case_id+COMMENTS_URI+comment_id].post str, :content_type=>'application/xml', :accept=>'application/xml'
          return response
        
        end
      end
    
      def set_comment_public(comment, case_id, comment_id)
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
    
      def get_attachment(case_no,uuid )
        @memcached.with_connection do |site|
          response = site[case_no+'/attachments/'+uuid].get :accept=>'application/octet-stream'
          return response
        end
      
      end
    
      def list_attachments(options={},case_no)
        @memcached.with_connection do |site|
          query_param = build_query_param(options)
         
          @log.info 'query param:'+query_param         
         
          response = site[case_no+'/attachments'+query_param].get :accept=>'application/json'
         
          attachments_str = response.to_s
          attachments_hash = ActiveSupport::JSON.decode attachments_str
          attachments = Hashie::Mash.new(attachments_hash)
          return attachments            
         
        end
      end
    
      private
      def build_query_param(options={}, for_comments=false)
        query_param = ''

        query_param = '?group='+options[:group][:param] unless options[:group].nil?
        query_param = '?detail='+options[:detail] unless options[:detail].nil?      
      
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
end

