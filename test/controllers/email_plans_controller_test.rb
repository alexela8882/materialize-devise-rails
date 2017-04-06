require 'test_helper'

class EmailPlansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @email_plan = email_plans(:one)
  end

  test "should get index" do
    get email_plans_url
    assert_response :success
  end

  test "should get new" do
    get new_email_plan_url
    assert_response :success
  end

  test "should create email_plan" do
    assert_difference('EmailPlan.count') do
      post email_plans_url, params: { email_plan: { expiration: @email_plan.expiration, name: @email_plan.name } }
    end

    assert_redirected_to email_plan_url(EmailPlan.last)
  end

  test "should show email_plan" do
    get email_plan_url(@email_plan)
    assert_response :success
  end

  test "should get edit" do
    get edit_email_plan_url(@email_plan)
    assert_response :success
  end

  test "should update email_plan" do
    patch email_plan_url(@email_plan), params: { email_plan: { expiration: @email_plan.expiration, name: @email_plan.name } }
    assert_redirected_to email_plan_url(@email_plan)
  end

  test "should destroy email_plan" do
    assert_difference('EmailPlan.count', -1) do
      delete email_plan_url(@email_plan)
    end

    assert_redirected_to email_plans_url
  end
end
