require ::File.expand_path('../config/environment',  __FILE__)
use Rack::Static, :urls => ["/stylesheets"], :root => "tmp"
run Quicktodo::Application
