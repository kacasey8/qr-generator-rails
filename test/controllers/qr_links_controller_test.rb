require "test_helper"

class QrLinksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @qr_link = qr_links(:one)
  end

  test "should get index" do
    get qr_links_url
    assert_response :success
  end

  test "should get new" do
    get new_qr_link_url
    assert_response :success
  end

  test "should create qr_link" do
    assert_difference("QrLink.count") do
      post qr_links_url, params: { qr_link: { destination_url: @qr_link.destination_url, name: @qr_link.name } }
    end

    assert_redirected_to qr_link_url(QrLink.last)
  end

  test "should show qr_link" do
    get qr_link_url(@qr_link)
    assert_response :success
  end

  test "should get edit" do
    get edit_qr_link_url(@qr_link)
    assert_response :success
  end

  test "should update qr_link" do
    patch qr_link_url(@qr_link), params: { qr_link: { destination_url: @qr_link.destination_url, name: @qr_link.name } }
    assert_redirected_to qr_link_url(@qr_link)
  end

  test "should destroy qr_link" do
    assert_difference("QrLink.count", -1) do
      delete qr_link_url(@qr_link)
    end

    assert_redirected_to qr_links_url
  end
end
