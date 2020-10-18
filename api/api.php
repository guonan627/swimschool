<?php
include("db.php"); // ALL SQL Actions go here
include("se.php"); // ALL Session Management goes here
include("util.php"); // ALL generic utilities

date_default_timezone_set('Australia/Brisbane');

session_start();

try {
    // database object
    $db = new DB();
    // session object
    $se = new sessionObject();

    // parse json data in request body (from javascript fetch())
    $data = json_decode(file_get_contents("php://input"));

    // assign session object
    if (!isset($_SESSION['sessionObj'])) {
        $_SESSION['sessionObj'] = $se;
        // $_SESSION['sessionObj'] = new sessionObject();
    }

    // Security
    // set session variables
    $_SESSION['sessionObj']->setIp($_SERVER['REMOTE_ADDR']);

    // general rate limiter: 1 request/sec
    if (isset($_SESSION['LAST_CALL'])) {  
        $last = strtotime($_SESSION['LAST_CALL']); 
        $curr = strtotime(date("Y-m-d h:i:s")); //record the time current request
        $sec = abs($curr - $last);  // calculate how many seconds past from the last request
        if ($sec <= 1) {
            throw new APIException("Rate limit exceeded");
            http_response_code(429);
            return false;
            die();
        }
    }
    $_SESSION['LAST_CALL'] = date("Y-m-d h:i:s");

    // session rate limiter: 1000 requests/day
    if ($_SESSION['sessionObj']->oneDayRateLimit() === false) { //calculate in se.php
        throw new APIException("Daily rate limit exceeded");
        die();
        http_response_code(429);
        return false;
    }
    // debug
    // die(json_encode($_SESSION['sessionObj']->oneDayRateLimit()));

    
    if (isset($_GET['action'])) {
        $validated_action = validate($_GET['action'], 'alpha');
        if ($validated_action == false) {
            throw new APIException("Action code is not valid");
        }
        // Validate all incoming variables from frontend
        if (isset($data->email)) {
            $email = filter_var($data->email, FILTER_VALIDATE_EMAIL);
            if ($email == false) {
                throw new APIException("Email not valid");
            }
        }
        if (isset($data->username)) {
            $username = validate($data->username, 'alphanumeric');
            if ($username == false) {
                throw new APIException("Username not valid");
            }
        }
        if (isset($data->password)) {
            $password = validate($data->password, 'alphanumeric');
            if ($password == false) {
                throw new APIException("Password not valid");
            }
        }
        if (isset($data->class_id)) {
            $class_id = validate($data->class_id, 'primarykey');
            if ($class_id == false) {
                throw new APIException("Class ID not valid");
            }
        }
        if (isset($data->login_id)) {
            $login_id = validate($data->login_id, 'primarykey');
            if ($login_id == false) {
                throw new APIException("Login ID not valid");
            }
        }
        if (isset($data->givenname)) {
            $givenname = validate($data->givenname, 'alpha');
            if ($givenname == false) {
                throw new APIException("Givenname not valid");
            }
        }
        if (isset($data->surname)) {
            $surname = validate($data->surname, 'alpha');
            if ($surname == false) {
                throw new APIException("Surname not valid");
            }
        }
        if (isset($data->gender)) {
            $gender = validate($data->gender, 'alpha');
            if ($gender == false) {
                throw new APIException("Gender value not valid");
            }
        }
        if (isset($data->address)) {
            $address = validate($data->address, 'alphanumeric_space');
            if ($address == false) {
                throw new APIException("Address not valid");
            }
        }
        if (isset($data->phone)) {
            $phone = validate($data->phone, 'integer');
            if ($phone == false) {
                throw new APIException("Phone number not valid");
            }
        }
        if (isset($data->dob)) {
            $dob = validate($data->dob, 'alphanumeric_space');
            if ($dob == false) {
                throw new APIException("Date of birth format not valid");
            }
        }
        if (isset($data->health)) {
            $health = validate($data->health, 'alphanumeric_space');
        } else {
            $health = "";
        }
        if (isset($_GET['program_id'])) {
            $program_id = validate($_GET['program_id'], 'primarykey');
            if ($program_id == false) {
                throw new APIException("Program ID not valid");
            }
        }
        if (isset($_GET['class_id'])) {
            $class_id = validate($_GET['class_id'], 'primarykey');
            if ($class_id == false) {
                throw new APIException("class day not valid");
            }
        }
        if (isset($_GET['userid'])) {
            $user_id = validate($_GET['userid'], 'primarykey');
            if ($user_id == false) {
                throw new APIException("class day not valid");
            }
        }
        if (isset($data->program_name)) {
            $program_name = validate($data->program_name, 'alphanumeric_space');
            if ($program_name == false) {
                throw new APIException("Program Name not valid");
            }
        }
        if (isset($data->description)) {
            $description = validate($data->description, 'alphanumeric_space');
            if ($description == false) {
                throw new APIException("Description not valid");
            }
        }
        if (isset($data->program_level)) {
            $program_level = validate($data->program_level, 'alphanumeric_space');
            if ($program_level == false) {
                throw new APIException("Program level value not valid");
            }
        }
        if (isset($data->price)) {
            $price = validate($data->price, 'integer');
            if ($price == false) {
                throw new APIException("Price value not valid");
            }
        }
        if (isset($data->prerequisites)) {
            $prerequisites = validate($data->prerequisites, 'alphanumeric_space');
            if ($prerequisites == false) {
                throw new APIException("Prerequisites value not valid");
            }
        }
        if (isset($data->duration)) {
            $duration = validate($data->duration, 'alphanumeric_space');
            if ($duration == false) {
                throw new APIException("Duration value not valid");
            }
        }
        if (isset($_GET['day'])) {
            $day = validate($_GET['day'], 'alpha');

            if ($day == false) {
                throw new APIException("class day not valid");
            }
        }


        // ACTION BASE CASE
        switch ($validated_action) {

            //login
            case "login":
                // $_SESSION['sessionObj']->setRequestCounter($counter + 1);
                $response = new Response();
                if (isset($username) && isset($password)) {
                    $result = $db->login($username, $password); // verify password
                    if ($result['username'] != -1) {
                        $result = $_SESSION['sessionObj']->setAuth($result); // set session variables
                        $response->setHttpStatusCode(200);
                        $response->setSuccess(true);
                        $response->setData($result);
                        $db->logging($username . ' logged in');
                        logFile($username . ' logged in');
                    } else {
                        $response->setHttpStatusCode(401);
                        $response->setSuccess(false);
                        $response->addMessage("Incorrect username or password");
                    }
                } else {
                    $response->setHttpStatusCode(400);
                    $response->setSuccess(false);
                    $response->addMessage("Please provide username and password");
                }
                $response->send();
                exit;
                break;

            //log out
            case "logout":
                $response = new Response();
                $_SESSION['sessionObj'] = null;
                session_destroy();
                $response->setHttpStatusCode(200);
                $response->setSuccess(true);
                $response->addMessage("You logged out successfully");
                $response->send();
                exit;
                break;

            //register
            case "signup":
                $response = new Response();
                if (isset($username) && isset($email) && isset($password)) {
                    $emailList = $db->findAllEmails();
                    if (in_array(array("email" => $email), $emailList)) {
                        $response->setHttpStatusCode(409);
                        $response->setSuccess(false);
                        $response->addMessage("Email already exists, please try another one");
                    } else {
                        $result = $db->signUp($username, $email, $password);
                        $response->setHttpStatusCode(201);
                        $response->setSuccess(true);
                        $response->addMessage("You registered successfully");
                        $db->logging($email . ' signed up');
                        logFile($email . ' signed up');
                    }
                } else {
                    $response->setHttpStatusCode(400);
                    $response->setSuccess(false);
                    $response->addMessage("Please provide username, email and password");
                }
                $response->send();
                exit;
                break;

            //enroll
            case "enroll":
                $response = new Response();
                if ($_SESSION['sessionObj']->isLoggedIn()) { //check the user is logged in or not
                    if (isset($login_id) && isset($class_id) && isset($givenname) && isset($surname) && isset($address) && isset($email) && isset($phone) && isset($dob) && isset($health)) {
                        $enrollments = $db->findEnrollmentsByUser($login_id);
                        $class = $db->getClassById($class_id);
                        if ($class["cur_number"] < $class["max_number"]) {
                            if (count($enrollments) > 0) {
                                $response->setHttpStatusCode(409);
                                $response->setSuccess(false);
                                $response->addMessage("You can only enroll in one class");
                            } else {
                                $cur_number = $class["cur_number"] + 1;
                                $result = $db->enroll($login_id, $class_id, $cur_number, $givenname, $surname, $gender, $address, $email, $phone, $dob, $health);
                                $response->setHttpStatusCode(201);
                                $response->setSuccess(true);
                                $response->addMessage("You have enrolled successfully");
                                $db->logging("User ID: " . $login_id . ' enrolled class ' . $class_id);
                                logFile("User ID: " . $login_id . ' enrolled class ' . $class_id);
                            }
                        } else {
                            $response->setHttpStatusCode(400);
                            $response->setSuccess(false);
                            $response->addMessage("This class is already full, please try another class");
                        }
                    } else {
                        $response->setHttpStatusCode(400);
                        $response->setSuccess(false);
                        $response->addMessage("Missing information");
                    }
                } else {
                    $response->setHttpStatusCode(401);
                    $response->setSuccess(false);
                    $response->addMessage("You are not logged in.");
                }

                $response->send();
                exit;
                break;

            //check all the enrolled students
            case "allenrollments":
                $response = new Response();
                $result = $db->getAllEnrollments();
                $response->setHttpStatusCode(200);
                $response->setSuccess(true);
                $response->setData($result);
                $response->send();
                $db->logging('Fetched all enrollments');
                logFile('Fetched all enrollments');
                exit;
                break;

            // check the own enrolled class
            case "myenrolledclass":
                $response = new Response();
                if ($_SESSION['sessionObj']->isLoggedIn()) { // check the user is logged in or not
                    if (isset($user_id)) {
                        $result = $db->findEnrollmentsByUser($user_id);
                        if (count($result) == 0) {
                            $response->setHttpStatusCode(404);
                            $response->setSuccess(false);
                            $response->addMessage("You have not enrolled any class");
                        } else {
                            $my_class_id = (int)$result[0]["class_id"];
                            $my_class = $db->getClassById($my_class_id);
                            $response->setHttpStatusCode(200);
                            $response->setSuccess(true);
                            $response->setData($my_class);
                            $db->logging('Fetched all enrollments');
                            logFile('Fetched all enrollments');
                        }
                    } else {
                        $response->setHttpStatusCode(400);
                        $response->setSuccess(false);
                        $response->addMessage("Please provide user ID");
                    }
                }else {
                    $response->setHttpStatusCode(401);
                    $response->setSuccess(false);
                    $response->addMessage("You are not logged in.");
                }
                $response->send();
                exit;
                break;

            // check all programs
            case "allprograms":
                $response = new Response();
                $result = $db->getAllPrograms();
                $response->setHttpStatusCode(200);
                $response->setSuccess(true);
                $response->setData($result);
                $response->send();
                $db->logging('Fetched all programs');
                logFile('Fetched all programs');
                exit;
                break;
            
            // check a specific program
            case "findprogram":
                $response = new Response();
                if (isset($program_id)) {
                    $result = $db->getProgram($program_id);
                    // die(json_encode($result));
                    if ($result == false) {
                        $response->setHttpStatusCode(404);
                        $response->setSuccess(false);
                        $response->addMessage("Can't find the program with that ID");
                    } else {
                        $response->setHttpStatusCode(200);
                        $response->setSuccess(true);
                        $response->setData($result);
                        $db->logging('Fetched program ID: ' . $program_id);
                        logFile('Fetched program ID: ' . $program_id);
                    }
                } else {
                    $response->setHttpStatusCode(400);
                    $response->setSuccess(false);
                    $response->addMessage("Please specify program ID");
                }
                $response->send();
                exit;
                break;
            
            // add a program
            case "addprogram":
                $response = new Response();
                if ($_SESSION['sessionObj']->isLoggedIn()) {
                    if (isset($program_name) && isset($description) && isset($program_level) && isset($price) && isset($prerequisites) && isset($duration)) {
                        $result = $db->addProgram($program_name, $description, $program_level, $price, $prerequisites, $duration);
                        $response->setHttpStatusCode(200);
                        $response->setSuccess(true);
                        $response->setData($result);
                        $db->logging('Added new program: ' . $program_name);
                        logFile('Added new program: ' . $program_name);
                    } else {
                        $response->setHttpStatusCode(400);
                        $response->setSuccess(false);
                        $response->addMessage("Please provide program name, description, program level, price, prerequisites and duration.");
                    }
                } else {
                    $response->setHttpStatusCode(401);
                    $response->setSuccess(false);
                    $response->addMessage("You are not logged in.");
                }

                $response->send();
                exit;
                break;

            // update a program
            case "editprogram":
                $response = new Response();
                if (isset($program_id) && isset($program_name) && isset($description) && isset($program_level) && isset($price) && isset($prerequisites) && isset($duration)) {
                    $result = $db->updateProgram($program_name, $description, $program_level, $price, $prerequisites, $duration, $program_id);
                    if ($result == false) {
                        $response->setHttpStatusCode(404);
                        $response->setSuccess(false);
                        $response->addMessage("Can't find the program with that ID");
                    } else {
                        $response->setHttpStatusCode(200);
                        $response->setSuccess(true);
                        $response->setData($result);
                        $db->logging('Updated program: ' . $program_name);
                        logFile('Updated program: ' . $program_name);
                    }
                } else {
                    $response->setHttpStatusCode(400);
                    $response->setSuccess(false);
                    $response->addMessage("Please provide program name, description, program level, price, prerequisites and duration.");
                }
                $response->send();
                exit;
                break;

            // delete a program
            case "removeprogram":
                $response = new Response();
                if ($_SERVER['REQUEST_METHOD'] == "DELETE") {
                    if (isset($program_id)) {
                        $result = $db->deleteProgram($program_id);
                        $response->setHttpStatusCode(204);
                        $response->setSuccess(true);
                        $response->addMessage("Program deleted");
                        $db->logging('Removed program: ' . $program_name);
                        logFile('Removed program: ' . $program_name);
                    } else {
                        $response->setHttpStatusCode(400);
                        $response->setSuccess(false);
                        $response->addMessage("Please provide program ID.");
                    }
                } else {
                    $response->setHttpStatusCode(400);
                    $response->setSuccess(false);
                    $response->addMessage("Incorrect request method");
                }
                $response->send();
                exit;
                break;

            // check classes by day
            case "classesbyday":
                $response = new Response();
                if (isset($day)) {
                    $result = $db->getAllClasses($day);
                    // die(json_encode($result));
                    if ($result == false) {
                        $response->setHttpStatusCode(404);
                        $response->setSuccess(false);
                        $response->addMessage("Can't find the class on that day");
                    } else {
                        $response->setHttpStatusCode(200);
                        $response->setSuccess(true);
                        $response->setData($result);
                        $db->logging('find classes by : ' . $day);
                        logFile('find classes by : ' . $day);
                    }
                } else {
                    $response->setHttpStatusCode(400);
                    $response->setSuccess(false);
                    $response->addMessage("Please select a day");
                }
                $response->send();
                exit;
                break;

            //check classes by program name
            case "classesbyprogram":
                $response = new Response();
                if (isset($program_id)) {
                    $result = $db->getClassesByProgram($program_id);
                    // die(json_encode($result));
                    if ($result == false) {
                        $response->setHttpStatusCode(404);
                        $response->setSuccess(false);
                        $response->addMessage("Can't find the class under that program");
                    } else {
                        $response->setHttpStatusCode(200);
                        $response->setSuccess(true);
                        $response->setData($result);
                        $db->logging('find classes by : ' . $program_id);
                        logFile('find classes by : ' . $program_id);
                    }
                } else {
                    $response->setHttpStatusCode(400);
                    $response->setSuccess(false);
                    $response->addMessage("Please select a program");
                }
                $response->send();
                exit;
                break;

            // check a class by classID
            case "classbyid":
                $response = new Response();
                if (isset($class_id)) {
                    $result = $db->getClassById($class_id);
                    if ($result == false) {
                        $response->setHttpStatusCode(404);
                        $response->setSuccess(false);
                        $response->addMessage("Can't find the class with that ID");
                    } else {
                        $response->setHttpStatusCode(200);
                        $response->setSuccess(true);
                        $response->setData($result);
                        $db->logging('find classes by : ' . $class_id);
                        logFile('find classes by : ' . $class_id);
                    }
                } else {
                    $response->setHttpStatusCode(400);
                    $response->setSuccess(false);
                    $response->addMessage("Please provide a class ID");
                }
                $response->send();
                exit;
                break;


            default:
                throw new APIException("incorrect action code");
                break;
        }
    } else {
        throw new APIException("Action code does not exist");
    }
    if ($result == false) {
        echo json_encode(array('result' => 'false'));
    }
} catch (APIException $ex) {
    echo json_encode(array('Error' => $ex->getMessage()));
}
