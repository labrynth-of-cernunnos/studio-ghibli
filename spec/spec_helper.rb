require "bundler/setup"
require "studio_ghibli"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  def api_response(obj)
    StudioGhibli::Api.new.fetch("#{obj}")
  end

  def single_response(obj)
    api_response(obj).sample
  end

  def response_keys(obj)
    single_response(obj).collect {|k,v|  k.to_sym if v != nil  }
  end
end
