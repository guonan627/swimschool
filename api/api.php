<?php
include("db.php"); // ALL SQL Actions go here
include("se.php"); // ALL Session Management goes here
include("util.php"); // ALL generic utilities

session_start();

// database object
$db = new DB();

// session object
$session = new sessionObject();

try {
    // parse json data in request body (from javascript fetch())
    $data = json_decode(file_get_contents("php://input"));

    // set session object
    if (!isset($_SESSION['sessionObj'])) {
        $_SESSION['sessionObj'] = $session;
    }

    // rate limit
    if ($_SESSION['sessionObj']->rateLimit() == false) {
        throw new APIException("Rate limit exceeded");
    }

    if (isset($_GET['action'])) {
        $validated_action = validate($_GET['action'], 'alpha');
        if ($validated_action == false) {
            throw new APIException("Action code is not valid");
        }

        // VALIDATORS

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

        if (isset($_GET['program_id'])) {
            $program_id = validate($_GET['program_id'], 'integer');
            if ($program_id == false) {
                throw new APIException("Program ID not valid");
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

        // ACTION BASE CASE

        switch ($validated_action) {
            case "login":
                $response = new Response();
                if (isset($username) && isset($password)) {
                    $result = $db->login($username, $password); // verify password
                    if ($result['username'] != -1) {
                        $result = $_SESSION['sessionObj']->setAuth($result); // set session variables
                        $response->setHttpStatusCode(200);
                        $response->setSuccess(true);
                        $response->setData($result);
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

            case "signup":
                $response = new Response();
                if (isset($username) && isset($email) && isset($password)) {
                    $emailList = $db->findAllEmails();
                    if (in_array(array("email" => $email), $emailList)) {
                        $response->setHttpStatusCode(400);
                        $response->setSuccess(false);
                        $response->addMessage("Email already exists, please try another one");
                    } else {
                        $result = $db->signUp($username, $email, $password);
                        $response->setHttpStatusCode(201);
                        $response->setSuccess(true);
                        $response->addMessage("You registered successfully");
                    }
                } else {
                    $response->setHttpStatusCode(400);
                    $response->setSuccess(false);
                    $response->addMessage("Please provide username, email and password");
                }
                $response->send();
                exit;
                break;

            case "allprograms":
                $response = new Response();
                $result = $db->getAllPrograms();
                $response->setHttpStatusCode(200);
                $response->setSuccess(true);
                $response->setData($result);
                $response->send();
                exit;
                break;

            case "findprogram":
                $response = new Response();
                if (isset($program_id)) {
                    $result = $db->getProgram($program_id);
                    if ($result == false) {
                        $response->setHttpStatusCode(404);
                        $response->setSuccess(false);
                        $response->addMessage("Can't find the program with that ID");
                    } else {
                        $response->setHttpStatusCode(200);
                        $response->setSuccess(true);
                        $response->setData($result);
                    }
                } else {
                    $response->setHttpStatusCode(400);
                    $response->setSuccess(false);
                    $response->addMessage("Please specify program ID");
                }
                $response->send();
                exit;
                break;

            case "addprogram":
                $response = new Response();
                if (isset($program_name) && isset($description) && isset($program_level) && isset($price) && isset($prerequisites) && isset($duration)) {
                    $result = $db->addProgram($program_name, $description, $program_level, $price, $prerequisites, $duration);
                    $response->setHttpStatusCode(200);
                    $response->setSuccess(true);
                    $response->setData($result);
                } else {
                    $response->setHttpStatusCode(400);
                    $response->setSuccess(false);
                    $response->addMessage("Please provide program name, description, program level, price, prerequisites and duration.");
                }
                $response->send();
                exit;
                break;

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
                    }
                } else {
                    $response->setHttpStatusCode(400);
                    $response->setSuccess(false);
                    $response->addMessage("Please provide program name, description, program level, price, prerequisites and duration.");
                }
                $response->send();
                exit;
                break;

            case "removeprogram":
                $response = new Response();
                if ($_SERVER['REQUEST_METHOD'] == "DELETE") {
                    if (isset($program_id)) {
                        $result = $db->deleteProgram($program_id);
                        $response->setHttpStatusCode(204);
                        $response->setSuccess(true);
                        $response->addMessage("Program deleted");
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
