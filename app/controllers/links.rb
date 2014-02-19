
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
      tags = params["tags"].split(" ").map{|tag| Tag.first_or_create(:text => tag)}
      Link.create(:url => url, :title => title, :tags => tags)
      redirect to('/')
    end

    get '/links/new' do
      erb :"links/new", :layout => !request.xhr?
    end

    get '/tags' do
      erb :tags
    end

    post '/tags/:text' do
      tag = params[:search]
      redirect to('/tags/'+ tag)
    end

    get '/tags/:text' do
      tag = Tag.first(:text => params[:text])
      @links = tag ? tag.links : []
      erb :index
    end
  end
end