## User Stories

````
As a User
So that I can see my bookmarks
I want to be able to view the bookmarks I have in a list

* Noun = BookmarkManager (list)
* Verb = view_bookmarks()

--
As a User
So that I can customise my bookmarks
I want to be able to add new bookmarks to the list

* Noun = Bookmark
* Verb = add_bookmark(bookmark)

--
As a User
So that I can remove my bookmarks
I want to be able to delete bookmarks from the list

* Noun = BookmarkManager (list)
* Verb = delete_bookmark(bookmark)
```
--
```
1. Connect psql
2. Create a database using psql CREATE DATABASE bookmaker_manager;
3. Connect to the database using psql command \c bookmark_manager;
4. Run the query 01_create_bookmarks_table.sql
```
````
