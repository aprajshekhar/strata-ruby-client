# To change this template, choose Tools | Templates
# and open the template in the editor.

$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'case_resource_manager'
require 'pp'

class CaseResourceManagerTest < Test::Unit::TestCase
  def setup
    @manager = Client::CaseResourceManager.new("http://127.0.0.1:8080/rs/cases/", "", "")
  end
  def test_get_by_id
   puts '========get by id======'
   kase = @manager.get_by_id('00627435')
   assert kase.case_number == '00627435'
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
end
