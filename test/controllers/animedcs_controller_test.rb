require "test_helper"

class AnimedcsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @animedc = animedcs(:one)
  end

  test "should get index" do
    get animedcs_url
    assert_response :success
  end

  test "should get new" do
    get new_animedc_url
    assert_response :success
  end

  test "should create animedc" do
    assert_difference("Animedc.count") do
      post animedcs_url, params: { animedc: { anime_name: @animedc.anime_name, authour: @animedc.authour, rating: @animedc.rating, watched: @animedc.watched } }
    end

    assert_redirected_to animedc_url(Animedc.last)
  end

  test "should show animedc" do
    get animedc_url(@animedc)
    assert_response :success
  end

  test "should get edit" do
    get edit_animedc_url(@animedc)
    assert_response :success
  end

  test "should update animedc" do
    patch animedc_url(@animedc), params: { animedc: { anime_name: @animedc.anime_name, authour: @animedc.authour, rating: @animedc.rating, watched: @animedc.watched } }
    assert_redirected_to animedc_url(@animedc)
  end

  test "should destroy animedc" do
    assert_difference("Animedc.count", -1) do
      delete animedc_url(@animedc)
    end

    assert_redirected_to animedcs_url
  end
end
