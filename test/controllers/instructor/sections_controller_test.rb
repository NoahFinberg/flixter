require 'test_helper'

class Instructor::SectionsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  #make sure can't get to new section page page if not signed in
  test "new not signed in" do
  	course = FactoryGirl.create(:course)

  	get :new, :course_id => course.id
  	assert_redirected_to new_user_session_path
  end

  #make sure can get to new section page if signed in
  test "new signed in" do
  	course = FactoryGirl.create(:course)
  	user = FactoryGirl.create(:user)
  	sign_in user

  	get :new, :course_id => course.id
  	assert_response :success
  end

  #make sure can't create a new section if not signed in
  test "create not signed in" do
  	course = FactoryGirl.create(:course)

  	assert_no_difference 'Section.count' do
  		post :create, :course_id => course.id
  	end

  	assert_redirected_to new_user_session_path
  end

  #make sure can create a new section if signed in
  test "create signed in" do

  	user = FactoryGirl.create(:user)
  	sign_in user
  	course = FactoryGirl.create(:course)

  	assert_difference 'Section.count' do
  		post :create, :course_id => course.id, :section => { section }
  	end

  	assert_redirected_to instructor_course_path(assigns(:course))
  	assert_equal 1, user.courses.count
  end

end
