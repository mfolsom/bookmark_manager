require File.join(File.dirname(__FILE__), 'app/bookmark_manager.rb')
use Rack::Static, 
        :urls => ['/stylesheets', '/javascript'], 
        :root => 'public'

run BookmarkManager