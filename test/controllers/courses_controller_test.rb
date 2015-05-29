require 'test_helper'

class CoursesControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  #must be signed in to see course show page
  test "index page not signed in" do
  	get :index
  	assert_redirected_to new_user_session_path
  end

  #can see course show page if signed in
  test "index page signed in" do
  	user = FactoryGirl.create(:user)
  	sign_in user

  	get :index
  	assert_response :success
  end
end
