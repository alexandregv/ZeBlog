ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)
ENV['TMPDIR'] ||= File.expand_path('../tmp/', __dir__)

require 'bundler/setup' # Set up gems listed in the Gemfile.

