require 'test_helper'

class VideoconferencesControllerTest < ActionController::TestCase
  setup do
    @videoconference = videoconferences(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:videoconferences)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create videoconference" do
    assert_difference('Videoconference.count') do
      post :create, videoconference: { savee: @videoconference.savee, saver: @videoconference.saver }
    end

    assert_redirected_to videoconference_path(assigns(:videoconference))
  end

  test "should show videoconference" do
    get :show, id: @videoconference
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @videoconference
    assert_response :success
  end

  test "should update videoconference" do
    put :update, id: @videoconference, videoconference: { savee: @videoconference.savee, saver: @videoconference.saver }
    assert_redirected_to videoconference_path(assigns(:videoconference))
  end

  test "should destroy videoconference" do
    assert_difference('Videoconference.count', -1) do
      delete :destroy, id: @videoconference
    end

    assert_redirected_to videoconferences_path
  end
end
