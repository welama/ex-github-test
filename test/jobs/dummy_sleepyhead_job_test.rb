# frozen_string_literal: true

require 'test_helper'

class DummySleepyheadJobTest < ActiveJob::TestCase
  test 'enqueue a dummy-sleepyhead job to the low queue' do
    DummySleepyheadJob.perform_later
    assert_enqueued_with(job: DummySleepyheadJob, queue: 'low')
  end
end
