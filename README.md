## Introduction
This web App is an online class enrolment system supporting the Bright Star Swim School’s offline swim classes provided in the local swimming pool.

ENTITIES: admin, unenrolled_student, enrolled_student, class, program, photo
USERS: anonymous, admin,student

## Business Rules
* Any anonymous can browse the teaching programs introduction and find all classes filtered by program and class time.
* Anonymous users can register to be a student role. 
* The authenticated student must return a user token to the API supplied by the server during auth to access secure API functions.
* A student role can edit their own account profile and has permission to enrol any interested class under any program.
* Each student can only enrol one class during the same period of time.
* Each swim program contains several classes of different class time.
* The maximal number of students in each class is five, so the sixth student cannot enrol
the same class as it is fully booked.
* The student must be over 6 months which is the lowest age requirement.
* Any enrolled student can check their own class information including belonged program, status, fellow students, class time and teacher, and download class photos.
* An Admin role has full permissions to CRUD any user account, the information of any program, class and enrolled student of particular class.
* An Admin can upload and delete class photos to any particular class folder. Once a file is uploaded, a record will be inserted into the database.

## Technologies
* The website will decouple the front end (web app and admin panel) and the back end (web services). Web app is for public use. All anonymous users and registered students will use the web app to browse, enrol classes and download photos from the app. Admin panel is for admin staff to mange the programs, classes and enrolled students. 
* Web services will provide APIs for web app and admin panel to perform CRUD operations on the database. Web Service will support the activities of a user, but users must authenticate to use all web functions.
* A web app is developed using a client-side framework (materialized) to speed the development process with mobile components.
* Administration panel will be developed using React.

## API

#### Sign Up:
__POST__ *http://localhost:8888/swimschool/api/api.php?action=signup*  
__Required fields:__
* username
* email
* password

#### Login:
__POST__ *http://localhost:8888/swimschool/api/api.php?action=login*  
__Required fields:__
* username
* password

#### Get all programs:
__GET__ *http://localhost:8888/swimschool/api/api.php?action=allprograms*  
__Required fields:__
none

#### Get single program by ID:
__GET__ *http://localhost:8888/swimschool/api/api.php?action=findprogram&program_id=1*  
__Required fields:__
* program_id (in URL)

#### Create prorgram:
__POST__ *http://localhost:8888/swimschool/api/api.php?action=addprogram*  
__Required fields:__
* program_name
* description
* program_level
* price
* prerequisites
* duration

#### Update program:
__PATCH__ *http://localhost:8888/swimschool/api/api.php?action=editprogram&program_id=1*  
__Required fields:__
* program_id (in URL)
* program_name
* description
* program_level
* price
* prerequisites
* duration

#### Delete program:
__DELETE__ *http://localhost:8888/swimschool/api/api.php?action=removeprogram&program_id=11*  
__Required fields:__
* program_id (in URL)

#### Search Classes by Day:
__GET__ *http://localhost:8888/swimschool/api/api.php?action=classesbyday*  
__Required fields:__
* program_id (in URL)

## Security
* Logging feature that accounts for every request with IP, browser, timestamp and action
* Rate limit Web Service to one request per second per user session 
* Limit per session request to 1,000 in a 24hour period


## Current Status
* Frontend -  complete the prototype and fetched some information from database
* Backend - complete some of Web Services
* Admin panel - Not Started

## Major Priorities


## Long-term Priorities
