# To change this template, choose Tools | Templates
# and open the template in the editor.

$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'client/managers/case_resource_manager'
require 'pp'
require 'client/client_config'
require 'logging'
 
Logging.logger.root.appenders = Logging.appenders.stdout
Logging.logger.root.level = :info   
 
class CaseResourceManagerTest < Test::Unit::TestCase
  def setup
    #This URL is to test locally
    path = File.absolute_path('test_config.yml')
    config = Client::ClientConfig.new(path,'local')
        
    @manager = Client::Managers::CaseResourceManager.new(config.url, config.user, config.password)
    @log = Logging.logger[self]
  end
  def test_get_by_id
   @log.info 'get by id'
   kase = @manager.get_by_id('00644583')
   #pp kase
   assert kase.case_number == '00644583'
  end
  
  def test_list_for_group
    @log.info 'list by group'
     kase = @manager.list ({:group=>{
        :param=>'ALL'}      
        }
      )
      assert_not_nil(kase, "case list returned empty")
  end
  
  def test_list_for_start_date
    @log.info 'list by start date'
    kase = @manager.list ({:start_date=>'2011-01-22' 
        }
      )
      assert_not_nil(kase, "case list returned empty")
  end
  
  def test_list_for_start_and_end_date
    @log.info 'list by start and end date'
    kase = @manager.list ({:start_date=>'2011-01-22',
        :end_date=>'2012-01-22'
        }
      )
      assert_not_nil(kase, "case list returned empty")
  end
  
  def test_create
    @log.info 'test create'
    kase = {:summary=>'test case from ruby', :product=>'Red Hat Enterprise Linux',:version=>'6.0'}
    response = @manager.create kase
    @log.info 'status'+response.code.to_s
    assert_equal(201, response.code, 'not created')
    puts response
  end
  
  def test_create_comment
    @log.info 'test create comment'
    comment = {:text=>'test comment from ruby'}
    response = @manager.add_comment(comment,'00722685')
     assert_equal(201, response.code, 'not created')
    @log.info 'status'+response.code.to_s
  end
  
  def test_list_comment
    @log.info 'test list comment by detail'
    comments = @manager.list_comments({:detail=>'true'},'00722685')
    assert_not_nil(comments,'comment list returned empty')
  end
  
  def test_add_attachment()
    @log.info 'test add attachment'
    response = @manager.add_attachment('00722685', File.absolute_path('test.txt'))
    assert_equal(201, response.code, 'not created')
    @log.info 'status'+response.code.to_s
  end
  
   def test_list_attachments
    @log.info 'test list attachments by detail'
    attachments = @manager.list_attachments({:detail=>'true'},'00722685')
    assert_not_nil(attachments,'comment list returned empty')
  end
  
end
