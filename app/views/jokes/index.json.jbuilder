# frozen_string_literal: true

json.array! @jokes, partial: 'jokes/joke', as: :joke
