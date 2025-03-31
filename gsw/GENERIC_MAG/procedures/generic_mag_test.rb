require 'cosmos'
require 'cosmos/script'
require 'mission_lib.rb'

class MAG_LPT < Cosmos::Test
  def setup
    
  end

  def test_lpt
    start("tests/generic_mag_lpt_test.rb")
  end

  def teardown

  end
end

class MAG_CPT < Cosmos::Test
  def setup
      
  end

  def test_cpt
    start("tests/generic_mag_cpt_test.rb")
  end

  def teardown

  end
end

class Generic_mag_Test < Cosmos::TestSuite
  def initialize
      super()
      add_test('MAG_CPT')
      add_test('MAG_LPT')
  end

  def setup
  end
  
  def teardown
  end
end