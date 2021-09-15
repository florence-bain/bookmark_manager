feature 'index page has content' do
  scenario 'page has content' do
    visit('/')
    expect(page).to have_content("Bookmark Manager")
  end
end

feature 'Viewing bookmarks' do
  scenario 'User can see all bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    Bookmark.create(url:  "http://www.makersacademy.com")
    Bookmark.create(url: "http://www.google.com")
    Bookmark.create(url: "http://www.destroyallsoftware.com")

    visit('/bookmarks')

    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.google.com"
    expect(page).to have_content"http://www.destroyallsoftware.com"
  end
end
