require "application_system_test_case"

class AnimedcsTest < ApplicationSystemTestCase
  setup do
    @animedc = animedcs(:one)
  end

  test "visiting the index" do
    visit animedcs_url
    assert_selector "h1", text: "Animedcs"
  end

  test "should create animedc" do
    visit animedcs_url
    click_on "New animedc"

    fill_in "Anime name", with: @animedc.anime_name
    fill_in "Authour", with: @animedc.authour
    fill_in "Rating", with: @animedc.rating
    check "Watched" if @animedc.watched
    click_on "Create Animedc"

    assert_text "Animedc was successfully created"
    click_on "Back"
  end

  test "should update Animedc" do
    visit animedc_url(@animedc)
    click_on "Edit this animedc", match: :first

    fill_in "Anime name", with: @animedc.anime_name
    fill_in "Authour", with: @animedc.authour
    fill_in "Rating", with: @animedc.rating
    check "Watched" if @animedc.watched
    click_on "Update Animedc"

    assert_text "Animedc was successfully updated"
    click_on "Back"
  end

  test "should destroy Animedc" do
    visit animedc_url(@animedc)
    click_on "Destroy this animedc", match: :first

    assert_text "Animedc was successfully destroyed"
  end
end
