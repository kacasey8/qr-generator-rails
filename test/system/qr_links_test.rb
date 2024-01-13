require "application_system_test_case"

class QrLinksTest < ApplicationSystemTestCase
  setup do
    @qr_link = qr_links(:one)
  end

  test "visiting the index" do
    visit qr_links_url
    assert_selector "h1", text: "Qr links"
  end

  test "should create qr link" do
    visit qr_links_url
    click_on "New qr link"

    fill_in "Destination url", with: @qr_link.destination_url
    fill_in "Name", with: @qr_link.name
    click_on "Create Qr link"

    assert_text "Qr link was successfully created"
    click_on "Back"
  end

  test "should update Qr link" do
    visit qr_link_url(@qr_link)
    click_on "Edit this qr link", match: :first

    fill_in "Destination url", with: @qr_link.destination_url
    fill_in "Name", with: @qr_link.name
    click_on "Update Qr link"

    assert_text "Qr link was successfully updated"
    click_on "Back"
  end

  test "should destroy Qr link" do
    visit qr_link_url(@qr_link)
    click_on "Destroy this qr link", match: :first

    assert_text "Qr link was successfully destroyed"
  end
end
