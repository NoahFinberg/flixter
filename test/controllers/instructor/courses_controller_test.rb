require 'test_helper'

class Instructor::CoursesControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  #make sure can't get to new course page if not signed in
  test "new not signed in" do
  	get :new
  	assert_redirected_to new_user_session_path
  end

  #make sure can get to new course page if signed in
  test "new signed in" do
  	user = FactoryGirl.create(:user)
  	sign_in user

  	get :new
  	assert_response :success
  end

  #make sure can't create a new course if not signed in
  test "create not signed in" do
  	course = FactoryGirl.create(:course)

  	assert_no_difference 'Course.count' do
  		post :create, { :course => course }
  	end

  	assert_redirected_to new_user_session_path
  end

  #make sure can create a new course if signed in
  test "create signed in" do

  	user = FactoryGirl.create(:user)
  	sign_in user

  	assert_difference 'Course.count' do
  		post :create, { :course => {
  			:title => "Rails 101",
    		:description => "Intro to Ruby on Rails",
    		:cost => 0.0 
    	}
    }
  	end

  	assert_redirected_to instructor_course_path(2)
  	assert_equal 1, user.courses.count
  end

  #must be signed in to see course show page
  test "show page not signed in" do
  	course = FactoryGirl.create(:course)
  	get :show, :id => course.id
  	assert_redirected_to new_user_session_path
  end

  #can see course show page if signed in
  test "show page signed in" do
  	user = FactoryGirl.create(:user)
  	sign_in user

  	course = FactoryGirl.create(:course)
  	get :show, :id => course.id

  	assert_response :success
  end
end
