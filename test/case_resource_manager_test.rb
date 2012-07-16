# To change this template, choose Tools | Templates
# and open the template in the editor.

$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'case_resource_manager'
require 'pp'
require 'client_config'
class CaseResourceManagerTest < Test::Unit::TestCase
  def setup
    #This URL is to test locally
    path = File.absolute_path('test_config.yml')
    config = Client::ClientConfig.new(path,'local')
        
    @manager = Client::CaseResourceManager.new(config.url, config.user, config.password)
  end
  def test_get_by_id
   puts '========get by id======'
   kase = @manager.get_by_id('00722685')
   pp kase
   assert kase.case_number == '00722685'
  end
  
  def test_list_for_group
    puts '=========list by group========'
     kase = @manager.list ({:group=>{
        :param=>'ALL'}      
        }
      )
      assert_not_nil(kase, "case list returned empty")
  end
  
  def test_list_for_start_date
    puts '==========list by start date======'
    kase = @manager.list ({:start_date=>'2011-01-22' 
        }
      )
      assert_not_nil(kase, "case list returned empty")
  end
  
  def test_list_for_start_and_end_date
    puts '===========list by start and end date======'
    kase = @manager.list ({:start_date=>'2011-01-22',
        :end_date=>'2012-01-22'
        }
      )
      assert_not_nil(kase, "case list returned empty")
  end
  
  def test_create
    puts '============test create=============='
    kase = {:summary=>'test case from ruby', :product=>'Red Hat Enterprise Linux',:version=>'6.0'}
    response = @manager.create kase
    puts response
  end
  
  def test_create_comment
    puts '============test create comment=============='
    comment = {:text=>'test comment from ruby'}
    response = @manager.add_comment(comment,'00722685')
    puts response
  end
  
  def test_list_comment
    puts'==========test list comment by detail'
    kase = @manager.list_comments({:detail=>'true'},'00722685')
  end
  
end
