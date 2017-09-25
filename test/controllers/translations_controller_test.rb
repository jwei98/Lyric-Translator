require 'test_helper'

class TranslationsControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers
  setup do
    @translation = translations(:one)
  end
  
  test "should show translations" do
    
  end

  test "should get new" do
    get :new
    assert_response :success
  end
=begin
test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:translations)
  end
  test "should create translation" do
    assert_difference('Translation.count') do
      post :create, translation: { lyric: @translation.lyric, songID: @translation.songID, translation: @translation.translation }
    end

    assert_redirected_to translation_path(assigns(:translation))
  end
  test "should get edit" do
    get :edit, id: @translation
    assert_response :success
  end
  test "should show translation" do
    get :show, id: @translation
    assert_response :success
  end
  test "should destroy translation" do
    assert_difference('Translation.count', -1) do
      delete :destroy, id: @translation
    end

    assert_redirected_to translations_path
  end
  test "should update translation" do
    patch :update, id: @translation, translation: { lyric: @translation.lyric, songID: @translation.songID, translation: @translation.translation }
    assert_redirected_to translation_path(assigns(:translation))
  end
=end
  

end
