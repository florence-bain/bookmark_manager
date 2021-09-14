require 'bookmark'

describe Bookmark do
  let(:bookmark) { Bookmark.all}
  describe '.all' do
    it 'returns all bookmarks' do

      expect(bookmark).to include("http://www.makersacademy.com")
      expect(bookmark).to include("http://www.google.com")
      expect(bookmark).to include("http://www.destroyallsoftware.com")
    end
  end
end
