require ::File.dirname(__FILE__) + "/lib/seinfeld.rb"
require 'rack/rewrite'

use Rack::Rewrite do
  r301 '/', '/~siuying'
  
  if ENV['RAILS_ENV'] == 'production'
    r301 %r{.*}, 'http://opensource.reality.hk$&', :if => Proc.new {|rack_env|
      rack_env['SERVER_NAME'] != 'opensource.reality.hk'
    }
  end
end

Seinfeld::App.set :environment, ENV['RACK_ENV'] || ENV['RAILS_ENV'] || :production
run Seinfeld::App
