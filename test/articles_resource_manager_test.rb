# To change this template, choose Tools | Templates
# and open the template in the editor.

$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'client/managers/articles_resource_manager'
require 'pp'
require 'client/client_config'
require 'logging'
require 'client/model/strata'
 
Logging.logger.root.appenders = Logging.appenders.stdout
Logging.logger.root.level = :info  

class ArticlesResourceManagerTest < Test::Unit::TestCase
  
  def setup
    #This URL is to test locally
    path = File.absolute_path('test_config.yml')
    config = Client::ClientConfig.new(path,'local')
        
    @manager = Client::Managers::ArticlesResourceManager.new(config.url, config.user, config.password)
    @log = Logging.logger[self]
  end
  
#  def test_get_by_id
#    @log.info 'Get by ID test'
#    article = @manager.get_by_id('206503',false)
#    assert_equal('206503', article.id, 'Test by id failed for id=206503')
#  end
#    
#  def test_create_article
#    @log.info 'Create article'
#    article = Client::Model::Article.new
#    article.title = "Created from Ruby"
#    article.body = "Create from ruby"
#    article.kcsState="wip"
#    response = @manager.create article    
#    assert_equal(201, response.code, 'not created')
#              
#  end
  
  def test_update_article
    @log.info 'Update article'
    article = Client::Model::Article.new
    article.title ="Updated from ruby"
    article.body = "Updated from ruby client"
    response = @manager.update(article, '206513')
    assert_equal(202, response.code, 'not updated')
              
  end
  
end
