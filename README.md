# Code Platoon Alumni App
You're working on an existing code base that a bunch of other developers are working in. This is a pretty hard challenge.

## Application Setup
-  Fork over repo to personal github
#### Django Backend Setup
1. `cd` into the `cp_backend` directory (same level as `requirements.txt`)
2. Install all Python packages (`pip install -r requirements.txt`)
3. Create a new database called `cp_alumni`
4. In the `seeds.sql` file, update the every instance of `ALTER TABLE public.api_cohort OWNER TO taprete;` and replace `taprete` with your Mac's name. 
5. Seed the database `psql cp_alumni < seeds.sql` (this will create all the tables and seed the database with data)
6. Start the server `python manage.py runserver`
- **Admin User Credentials**: is `admin@email.com` password `CodePlatoon1@`
- All users have the password of `CodePlatoon1@`

#### React Frontend Setup
1. `cd` into the `cp-frontend` directory (same level as `package.json`)
2. Install all Node dependencies (`npm install`)
3. Start the React application `npm start`


## High Level Obective
Django comes with a built in Admin Dashboard but most applications need their own Admin Dashboard. Your job is to create an Admin Dashboard that only users who have the `is_staff` value set to `True` have access to. The Admin Dashboard should display all the users in the application in a Table. From the list of users you should be able to change the user's `is_staff` attribute, `is_active` attribute, and `is_verified`attribute boolean values and update the users in the database.

The table should show the following information about each user
- First Name
- Last Name
- Email
- Staff status (attribute that can be changed)
- Active status (attribute that can be changed)
- Verified status (attribute that can be changed)

## Design Requirements
Please utilize Material-UI library for the front-end. It's already installed as a dependency.

- [Material UI](https://material-ui.com/)
- [Material UI Tables](https://material-ui.com/components/tables/)

## Release 0
Read through the code base and try to understand where the data is flowing from the Djagno backend to the React frontend.

**Reminder: Coding is 80% reading, 20% coding.**

## Release 1
Create an `AdminPage.js` component and Route to `/admin` on the front end. When you land on this page (`/admin`) it should make an api request to the Django Backend to retreive all the users. Look in the `UserAPI.js` to see if that API method was already created for you. Before you move on ensure you're able to successfully serve all the users to the frontend.

## Release 2
Please utilize Material-UI Table component to display all the users in the application with a checkbox or switch to toggle a user's Staff status, Verified status, and Active status.

- [Material UI](https://material-ui.com/)
- [Material UI Tables](https://material-ui.com/components/tables/)
- [Material UI Switch](https://material-ui.com/components/switches/)

