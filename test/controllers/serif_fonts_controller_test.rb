require 'test_helper'

class SerifFontsControllerTest < ActionController::TestCase
  setup do
    @serif_font = serif_fonts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:serif_fonts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create serif_font" do
    assert_difference('SerifFont.count') do
      post :create, serif_font: { name: @serif_font.name }
    end

    assert_redirected_to serif_font_path(assigns(:serif_font))
  end

  test "should show serif_font" do
    get :show, id: @serif_font
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @serif_font
    assert_response :success
  end

  test "should update serif_font" do
    patch :update, id: @serif_font, serif_font: { name: @serif_font.name }
    assert_redirected_to serif_font_path(assigns(:serif_font))
  end

  test "should destroy serif_font" do
    assert_difference('SerifFont.count', -1) do
      delete :destroy, id: @serif_font
    end

    assert_redirected_to serif_fonts_path
  end
end
