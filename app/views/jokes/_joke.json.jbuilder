# frozen_string_literal: true

json.extract! joke, :id, :title, :content, :created_at, :updated_at
json.url joke_url(joke, format: :json)
