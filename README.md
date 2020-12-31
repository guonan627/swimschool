## Introduction

This web App is an online enrolment system supporting the Bright Star Swim School’s offline swim classes provided in the local swimming pool.

ENTITIES: admin, unenrolled_student, enrolled_student, class, program, photo
USERS: anonymous, admin,student

## Github Address

- web app - https://github.com/guonan627/swimschool
- Admin panel - https://github.com/guonan627/swimschool-admin-panel

## Deployed Online

- Web app is deployed on https://nanguo666.com/swimschool/ using VipControl shared web hosting(Apache)
- Admin panel is deployed on https://swimschool-admin-panel.vercel.app/ using vercel.com(Nginx)

## Installation Guidance

change api address in var api = "http://localhost/swimschool/api/api.php" in app.js;

## Business Rules

- Any anonymous can browse the teaching programs introduction and find all classes filtered by program and class time.
- Anonymous users can register to be a student role.
- The authenticated student must return a user token to the API supplied by the server during auth to access secure API functions.
- A student role can edit their own account profile and has permission to enrol any interested class under any program.
- Each student can only enrol one class during the same period of time.
- Each swim program contains several classes of different class time.
- The maximal number of students in each class is five, so the sixth student cannot enrol
  the same class as it is fully booked.
- The student must be over 6 months which is the lowest age requirement.
- Any enrolled student can check their own class information including belonged program, status, fellow students, class time and teacher, and download class photos.
- An Admin role has full permissions to CRUD any user account, the information of any program, class and enrolled student of particular class.
- An Admin can upload and delete class photos to any particular class folder. Once a file is uploaded, a record will be inserted into the database.

## Technologies

- The website decouples the front end (web app and admin panel) and the back end (web services). Web app is for public use. All anonymous users and registered students will use the web app to browse, enrol classes and download photos from the app. Admin panel is for admin staff to mange the programs, classes and enrolled students.
- Web services provide APIs for web app and admin panel to perform CRUD operations on the database. Web Service will support the activities of a user, but users must authenticate to use all web functions.
- Fetch is used in Javascript to transfer data.
- The APIs are developed by PHP(7.3.9) and MySQL(5.7.26)
- The web app is using a client-side framework Materialized(1.0.0) to speed the development process with mobile components.
- AddressFinder API used to provide better user experience when fill in web forms.
- Administration panel is developed by React("^17.0.1") integrated with Axios("^0.21.0") and React-Router-Dom("^5.2.0").
- Administration panel is using Bootstarp(4.5.x) to build up the web layout.

## API setting

#### Sign Up:

**POST** _http://localhost/swimschool/api/api.php?action=signup_  
**Required fields:**

- username
- email
- password

#### Login:

**POST** _http://localhost/swimschool/api/api.php?action=login_  
**Required fields:**

- username
- password

#### Logout:

**POST** _http://localhost/swimschool/api/api.php?action=logout_  
**Required fields:**
none

#### Get all programs:

**GET** _http://localhost/swimschool/api/api.php?action=allprograms_  
**Required fields:**
none

#### Get single program by programID: (for admin panel)

**GET** _http://localhost/swimschool/api/api.php?action=findprogram&program_id=1_  
**Required fields:**

- program_id (in URL)

#### Create prorgram: (for admin panel)

**POST** _http://localhost/swimschool/api/api.php?action=addprogram_  
**Required fields:**

- program_name
- description
- program_level
- price
- prerequisites
- duration

#### Update program: (for admin panel)

**PATCH** _http://localhost/swimschool/api/api.php?action=editprogram&program_id=1_  
**Required fields:**

- program_id (in URL)
- program_name
- description
- program_level
- price
- prerequisites
- duration

#### Delete program: (for admin panel)

**DELETE** _http://localhost/swimschool/api/api.php?action=removeprogram&program_id=11_  
**Required fields:**

- program_id (in URL)

#### Search Classes by Day:

**GET** _http://localhost:8888/swimschool/api/api.php?action=classesbyday&day=Tue_
**Required fields:**

- day(in URL)

#### Search Classes by Program Name:

**GET** _http://localhost:8888/swimschool/api/api.php?action=classesbyprogram&program_id=3_
**Required fields:**

- program_id(in URL)

#### Enroll a class:

**POST** _http://localhost/swimschool/api/api.php?action=enroll_  
**Required fields:**

- login_id
- class_id
- class_time
- givenname
- surname
- address
- email
- phone
- dob
- health

#### Check my enrolled class by userid:

**GET** _http://localhost/swimschool/api/api.php?action=myenrolledclass&userid=19_
**Required fields:**

- userid(in URL)

## Security

- Logging feature that accounts for every request with IP, browser, timestamp and action and record them in the database and txt document
- Rate limit to control one request per second per user session
- Limit per session request to 1,000 in a 24hour period
- Get userid from backend when enroll a class and view the enrolled class instead of from localstorage

## What to do next (roadmap)

### web app

- Jason Web Token/OAuth to be used to increase authentication security
- Add "view my classesmates" and "view class-time photos" features in "my class" page
- Allow enrolled user to cancel their enrollment in "my class" page
- Add the bithday input validation when fill in enroll form (must be over the program age requirement )
- Add the rating feature linking with each enrolled class.
- Allow one login user to enroll several classes instead of only one to make the app more practical.
- Add more features in "my account setting" page, for example, change user passwords

### admin panel

- Finalize CRUD classes
- Finalize CRUD enrollment
- Bueatify the web if needed.
