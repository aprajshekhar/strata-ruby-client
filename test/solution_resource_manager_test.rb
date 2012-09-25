# To change this template, choose Tools | Templates
# and open the template in the editor.

$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'client/managers/solutions_resource_manager'
require 'pp'
require 'client/client_config'
require 'logging'
require 'client/model/strata'

Logging.logger.root.appenders = Logging.appenders.stdout
Logging.logger.root.level = :info  

class SolutionResourceManagerTest < Test::Unit::TestCase
  
  def setup
    #This URL is to test locally
    path = File.absolute_path('test_config.yml')
    config = Client::ClientConfig.new(path,'local')
        
    @manager = Client::Managers::SolutionsResourceManager.new(config.url, config.user, config.password)
    @log = Logging.logger[self]
  end
  
  def test_get_by_id
    @log.info 'Get by ID test'
    solution = @manager.get_by_id('81213')
    #pp solution
    assert_equal('81213', solution.id, 'Test by id failed for id=81213')
  end
  
  def test_get_by_keyword 
    @log.info 'Get by Keyword test'
    solutions = @manager.get_by_keyword('RHEV')
    #pp solution
    assert_not_nil solutions, 'List by keyword returned empty list' 
  end
  
  def test_create_solution
    @log.info 'Create solution'
    solution = Client::Model::Solution.new
    solution.title = 'Created from ruby'
    solution.kcsState = 'wip'
    environment = Client::Model::Solution::Environment.new
    environment.text = "test environment"
    solution.environment = environment
    response = @manager.create solution
    assert_equal(201, response.code, 'not created')
              
  end
  
  def test_update_solution
    @log.info 'Update solution'
    solution = Client::Model::Solution.new
    solution.title = 'Updated from ruby'
    solution.kcsState = 'wip'
    environment = Client::Model::Solution::Environment.new
    environment.text = "test environment"
    solution.environment = environment
    response = @manager.update(solution, '201193')
    assert_equal(200, response.code, 'not updated')
              
  end
  
end
