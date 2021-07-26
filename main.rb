# frozen_string_literal: true

require 'sinatra'
require 'speedtest'
require 'pry'

set :public_folder, __dir__ + '/public'

def test_result_to_json(test_result)
  %w[latency
     download_rate
     pretty_download_rate
     upload_rate
     pretty_upload_rate
     server].map { |prop| [prop, test_result.send(prop)] }.to_h.to_json
end

get '/speed' do
  test = Speedtest::Test.new(
    download_runs: 4,
    upload_runs: 4,
    ping_runs: 4,
    download_sizes: [750, 1500],
    upload_sizes: [10_000, 400_000],
    debug: true
  )

  results = test.run
  test_result_to_json(results)
end
