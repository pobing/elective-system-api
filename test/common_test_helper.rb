module CommonTestHelper
	 def create_teacher name='test_teacher'
  	Teacher.create name: name
  end
end