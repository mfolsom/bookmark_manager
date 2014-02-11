class Tag
  require 'data_mapper'
  include DataMapper::Resource
  has n, :links, :through => Resource
  
  property :id, Serial
  property :text, String

end