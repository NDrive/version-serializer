require 'simplecov'

SimpleCov.profiles.define 'gem' do
  add_filter '/test/'
  add_filter '/bin/'
  add_filter '/coverage/'

  add_group 'Libraries', '/lib/'
end

SimpleCov.start 'gem'

require 'minitest/autorun'
