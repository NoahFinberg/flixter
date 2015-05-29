require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  #Make sure user includes title when creating a course
  test "course without title doesn't save" do
  	course = Course.new(title: nil, description: "yo yo yo", cost: 0.00)
  	assert_not course.save
  end

  #Make sure user includes a description when creating a course
  test "course without description doesn't save" do
  	course = Course.new(title: "Rails", description: nil, cost: 0.00)
  	assert_not course.save
  end

  #Make sure user includes a cost when creating a course
  test "course without cost doesn't save" do
  	course = Course.new(title: "Rails", description: "yo yo yo", cost: nil)
  	assert_not course.save
  end

  #Make sure cost cannot be negative number
  test "cost can't be negative" do
  	course = Course.new(title: "Rails", description: "yo yo yo", cost: -5)
  	assert_not course.save
  end

end
