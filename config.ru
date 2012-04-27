require ::File.dirname(__FILE__) + "/lib/seinfeld.rb"
require 'rack/rewrite'

use Rack::Rewrite do
  r301 '/', '/~siuying'
end

Seinfeld::App.set :environment, ENV['RACK_ENV'] || ENV['RAILS_ENV'] || :production
run Seinfeld::App
