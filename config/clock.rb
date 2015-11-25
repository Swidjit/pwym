require File.expand_path('../boot',        __FILE__)
require File.expand_path('../environment', __FILE__)
require 'clockwork'

include Clockwork
module Clockwork
  handler do |job|
    puts "Running #{job}"
  end

  # handler receives the time when job is prepared to run in the 2nd argument
  # handler do |job, time|
  #   puts "Running #{job}, at #{time}"
  # end

  every(30.seconds, 'frequently.job') {
    `rake matches:update_status`
  }
end