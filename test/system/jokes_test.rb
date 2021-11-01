# frozen_string_literal: true

require 'application_system_test_case'

class JokesTest < ApplicationSystemTestCase
  setup do
    @joke = jokes(:one)
  end

  test 'visiting the index' do
    visit jokes_url
    assert_selector 'h1', text: '🤣 笑話集'
  end

  test 'creating a Joke' do
    visit jokes_url
    fill_in 'joke[content]', with: @joke.content
    fill_in 'joke[title]', with: @joke.title
    click_on '建立'

    assert_text '成功建立笑話'
  end

  test 'updating a Joke' do
    visit jokes_url
    click_on '編輯', match: :first

    fill_in 'joke[content]', with: @joke.content
    fill_in 'joke[title]', with: @joke.title
    click_on '更新'

    assert_text '成功更新笑話'
  end

  test 'destroying a Joke' do
    visit jokes_url
    page.accept_confirm do
      click_on '刪除', match: :first
    end

    assert_text '成功刪除笑話'
  end
end
