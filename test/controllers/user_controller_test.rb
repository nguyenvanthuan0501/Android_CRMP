require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get fullname:string" do
    get user_fullname:string_url
    assert_response :success
  end

  test "should get password:string" do
    get user_password:string_url
    assert_response :success
  end

  test "should get email:string" do
    get user_email:string_url
    assert_response :success
  end

  test "should get phone_number:string" do
    get user_phone_number:string_url
    assert_response :success
  end

  test "should get address:string" do
    get user_address:string_url
    assert_response :success
  end

  test "should get id_card_number:int" do
    get user_id_card_number:int_url
    assert_response :success
  end

end
