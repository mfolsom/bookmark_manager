class Link
require 'data_mapper'

include DataMapper::Resource 
has n, :tags, :through => Resource

property :id,  Serial
property :url, String
property :title, String
end







