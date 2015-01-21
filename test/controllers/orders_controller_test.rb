require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  setup do
    @order = orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      post :create, order: { address1: @order.address1, address2: @order.address2, city: @order.city, country_code: @order.country_code, created_at: @order.created_at, first_name: @order.first_name, id: @order.id, last_name: @order.last_name, name: @order.name, province: @order.province, shop_id: @order.shop_id, zip: @order.zip }
    end

    assert_redirected_to order_path(assigns(:order))
  end

  test "should show order" do
    get :show, id: @order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @order
    assert_response :success
  end

  test "should update order" do
    patch :update, id: @order, order: { address1: @order.address1, address2: @order.address2, city: @order.city, country_code: @order.country_code, created_at: @order.created_at, first_name: @order.first_name, id: @order.id, last_name: @order.last_name, name: @order.name, province: @order.province, shop_id: @order.shop_id, zip: @order.zip }
    assert_redirected_to order_path(assigns(:order))
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete :destroy, id: @order
    end

    assert_redirected_to orders_path
  end
end
