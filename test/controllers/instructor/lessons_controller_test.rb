require 'test_helper'

class Instructor::LessonsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  #make sure can't get to new lesson page page if not signed in
  test "new not signed in" do
  	section = FactoryGirl.create(:section)

  	get :new, :section_id => section.id
  	assert_redirected_to new_user_session_path
  end

  #make sure can get to new lesson page if signed in
  test "new signed in" do
  	section = FactoryGirl.create(:section)
  	user = FactoryGirl.create(:user)
  	sign_in user

  	get :new, :section_id => section.id
  	assert_response :success
  end



  #make sure can't create a new lesson if not signed in
  test "create not signed in" do
  	section = FactoryGirl.create(:section)

  	assert_no_difference 'Lesson.count' do
  		post :create, :section_id => section.id
  	end

  	assert_redirected_to new_user_session_path
  end

  #make sure can create a new lesson if signed in
  test "create signed in" do

  	user = FactoryGirl.create(:user)
  	sign_in user
  	section = FactoryGirl.create(:section)
  	lesson = FactoryGirl.create(:lesson)

  	assert_difference 'Lesson.count' do
  		post :create, :section_id => section.id, :lesson => { lesson }
  	end

  	assert_redirected_to instructor_course_path(assigns(section.course))
  	assert_equal 1, user.lessons.count
  end
end
