# Code Platoon Alumni App
Your working on an existing code base that a bunch of other developers are working in.

## Design Requirements
Please utilize Material-UI library for the front-end. It's already installed for you.

## Create Seperate Admin Dashboard
Django comes with a built in Admin Dashboard but most applications need their own Admin Dashboard. Your job is to create an Admin Dashboard that only users who have the `is_staff` value set to `True` have access to. The Admin Dashboard should display all the users in the application in a Table. From the list of users you should be able to change the user's `is_staff`, `is_active`, and `is_verified` boolean values and update the users in the database.

## Release 0
Create a Django route, corresponding view method(s), and serializer(s) to get all users in the database.

## Release 1
Create your routes in `urls.py`. Ultimately, we want to get to this app having 2 routes:
- `/posts`: All posts
- `/posts/:id`: Information about a post with that specific ID number. If a post has corresponding comments, we want to see that on this page as well.

## Release 2
Set up your database with your two associated models and migrate them into your database. Specifically, I want a `Post` to have a `title` and `body`. A `Comment` should have a `body` and belong to a `Post`

## Release 3
Populate the database using the Django shell. Create 3 posts with 2 comments associated with them.

## Release 4
Create your HTML views using helper methods
