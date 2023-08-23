# Plays-Playwrights ORM

In tonight's videos, you saw how to implement an ORM for the `plays` database.
Your homework is to expand this ORM!  

## Setup

Let's start with the code from the video lectures. Clone the starter repo from
the `Download Project` button below.

Next, create your database. In SQLite, databases are just files that store all
of your data. They are updated by executing SQL commands (creating/updating
tables and rows). Your __import_db.sql__ has all the code to create your tables
and some seed data. You can create your database with the following command:

```sh
cat import_db.sql | sqlite3 plays.db
```

This will apply all the SQL commands in __import_db.sql__ to __plays.db__ from
the `sqlite3` console. You should now see a __plays.db__ file in your project
directory. Let's get started!

## Enhancing Functionality

Add the following methods to your ORM:

* `Play::find_by_title(title)`
* `Play::find_by_playwright(name)` (returns all plays written by playwright)

In addition, create a `Playwright` class and add the following methods:

* `Playwright::all`
* `Playwright::find_by_name(name)`
* `Playwright#new` (this is the initialize method)
* `Playwright#create`
* `Playwright#update`
* `Playwright#get_plays` (returns all plays written by playwright)

Remember, your `PlayDBConnection` class accesses the database stored in
__plays.db__, which includes both the `plays` and `playwrights` tables.

## Testing your ORM

* Open up pry and load the __plays.rb__ file.
* Initialize an instance of the `Playwright` class by calling `Playwright#new` and
  passing it the necessary arguments.
  * Call `Playwright#create` on the instance that you just initialized. Then
    call `Playwright::all` to see that it was added to the database correctly.
* Similarly, test `Playwright#update` and `Playwright#get_plays` by calling them
  on instances of the `Playwright` class.

For a more detailed look at how to test your ORM, refer to the [ORM
Demo][orm-demo-video] (jump to 18m25s).
  
[orm-demo-video]: https://vimeo.com/167672029#t=18m24s
