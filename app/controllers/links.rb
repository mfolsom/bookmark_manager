
module Controllers
  class Links < Base
    set :views, File.join(File.dirname(__FILE__),'../views')
    get '/' do
      @links = Link.all
      erb :index
    end

    post '/links' do
      url = params["url"]
      title = params["title"]
      tags = params["tags"].split(" ").map do |tag|
      Tag.first_or_create(:text => tag)
      end
      Link.create(:url => url, :title => title, :tags => tags)
      redirect to('/')
    end

    get '/tags/:text' do
      tag = Tag.first(:text => params[:text])
      @links = tag ? tag.links : []
      erb :index
    end
  end
end