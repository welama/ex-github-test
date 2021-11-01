# frozen_string_literal: true

require 'test_helper'

class JokesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @joke = jokes(:one)
  end

  test 'should get index' do
    get jokes_url
    assert_response :success
  end

  test 'should create joke' do
    assert_difference('Joke.count') do
      post jokes_url, params: { joke: { content: @joke.content, title: @joke.title } }
    end

    assert_redirected_to jokes_url
  end

  test 'should get edit' do
    get edit_joke_url(@joke)
    assert_response :success
  end

  test 'should update joke' do
    patch joke_url(@joke), params: { joke: { content: @joke.content, title: @joke.title } }
    assert_redirected_to jokes_url
  end

  test 'should destroy joke' do
    assert_difference('Joke.count', -1) do
      delete joke_url(@joke)
    end

    assert_redirected_to jokes_url
  end
end
