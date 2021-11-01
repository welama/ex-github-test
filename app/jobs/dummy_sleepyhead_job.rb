# frozen_string_literal: true

class DummySleepyheadJob < ApplicationJob
  queue_as :low

  def perform
    logger = Logger.new($stdout)
    logger.debug 'zzz...'
    sleep 30
    logger.debug 'zzz...zzz...'
  end
end
