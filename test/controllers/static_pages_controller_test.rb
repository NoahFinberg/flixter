require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  #makes sure index page is found
  test "static pages index" do
  	get :index
  	assert_response :success
  end


end
