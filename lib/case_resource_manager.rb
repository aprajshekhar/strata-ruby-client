# To change this template, choose Tools | Templates
# and open the template in the editor.
require 'rest_client'
require 'pp'
require 'active_support'
require 'hashie/mash'

module Client
  #This class can be instantiated to access case resource of strata-api 

  class CaseResourceManager

    def initialize(url, user, password)
      @site = RestClient::Resource.new(url,:user=>user, :password=>password, :timeout=>1000 )
    end
    
    #Gets case by id
    def get_by_id(id)
      response = @site[id].get :accept=>'application/json'
      case_str = response.to_s
      kase_hash = ActiveSupport::JSON.decode case_str

      kase = Hashie::Mash.new(kase_hash)
      return kase
    end

    def list(options={}, csv_output=false)
      query_param = build_query_param(options)
      if csv_output == true
        accept = 'text/csv'
      else
        accept = 'application/json'
      end

      puts 'query param:'+query_param
      puts accept

      response = @site[query_param].get :accept=>accept

      case_str = response.to_s

      unless csv_output == true
        kase_hash = ActiveSupport::JSON.decode case_str
        kases = Hashie::Mash.new(kase_hash)
        return kases
      else
        return case_str
      end
    end

    private
    def build_query_param(options={})
      query_param = ''

      query_param = '?group='+options[:group][:param] unless options[:group].nil?
      query_param = '?detail='+options[:detail] unless options[:details].nil?      
        
      unless options[:start_date].nil? || options[:end_date].nil?
        query_param = '?startDate='+options[:start_date] + '&endDate='+options[:end_date]
      else
        query_param = '?startDate='+options[:start_date] unless options[:start_date].nil? 
        query_param = '?endDate='+options[:end_date] unless options[:end_date].nil?   
      end     
      

      query_param = '?includeClosed='+options[:include_closed] unless options[:include_closed].nil?
      query_param = '?query='+options[:query] unless options[:q].nil?
      
      return query_param
    end

  end
end

