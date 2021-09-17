require 'pg'
require 'dotenv'

class Bookmark

  attr_reader :id, :title, :url

  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end 

 Dotenv.load

  puts ENV['DBNAME']

  def self.all()
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else 
      connection = PG.connect(dbname: 'bookmark_manager')
    end 

      result = connection.exec("SELECT * FROM bookmarks;")
      result.map do |bookmark|
      Bookmark.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url'])
      end 
    end

  def self.create(url:, title:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
      result = connection.exec("INSERT INTO bookmarks (url, title) VALUES ('#{url}', '#{title}') RETURNING id, title, url;")
      Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])

  end


  # def self.connect
  #   begin
  #     con = PG.connect :dbname => ENV['DBNAME'], :user => ENV['DBUSER'], :password => ENV['DBPASSWORD']
  #   rescue PG::Error => e
  #     puts e.message 
  #   ensure
  #     con.close if con
  #   end
  # end
end

