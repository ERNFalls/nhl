require 'test_helper'

class SansSerifFontsControllerTest < ActionController::TestCase
  setup do
    @sans_serif_font = sans_serif_fonts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sans_serif_fonts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sans_serif_font" do
    assert_difference('SansSerifFont.count') do
      post :create, sans_serif_font: { name: @sans_serif_font.name }
    end

    assert_redirected_to sans_serif_font_path(assigns(:sans_serif_font))
  end

  test "should show sans_serif_font" do
    get :show, id: @sans_serif_font
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sans_serif_font
    assert_response :success
  end

  test "should update sans_serif_font" do
    patch :update, id: @sans_serif_font, sans_serif_font: { name: @sans_serif_font.name }
    assert_redirected_to sans_serif_font_path(assigns(:sans_serif_font))
  end

  test "should destroy sans_serif_font" do
    assert_difference('SansSerifFont.count', -1) do
      delete :destroy, id: @sans_serif_font
    end

    assert_redirected_to sans_serif_fonts_path
  end
end
