require 'spec_helper'

describe Link do
  context "demonstration of how datamapper works" do
    it 'should be created and then retrieved from the db' do
      expect(Link.count).to eq(0)
      Link.create(:title =>"Makers Academy",
                  :url => "http://makersacademy.com")
      expect(Link.count).to eq(1)
      link = Link.first
      expect(link.url).to eq("http://makersacademy.com")
      expect(link.title).to eq("Makers Academy")
      DataMapper.auto_migrate!

      expect(Link.count).to eq(0)
    end
  end
end