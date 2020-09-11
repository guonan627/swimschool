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
    // json data from request body (from javascript fetch())
    $data = json_decode(file_get_contents("php://input"));

    // set session object
    if (!isset($_SESSION['sessionObj'])) {
        $_SESSION['sessionObj'] = $session;
    }

    // rate limit
    if ($_SESSION['sessionObj']->rateLimit() == false) {
        throw new Exception("Rate limit exceeded");
    }

    if (isset($_GET['action'])) {
        $validated_action = validate($_GET['action'], 'alpha');
        if ($validated_action == false) {
            throw new Exception("Action code is not valid");
        }

        // VALIDATORS

        if (isset($data->email)) {
            $email = filter_var($data->email, FILTER_VALIDATE_EMAIL);
            if ($email == false) {
                throw new Exception("Email not valid");
            }
        }

        if (isset($data->username)) {
            $username = validate($data->username, 'alphanumeric');
            if ($username == false) {
                throw new Exception("Username not valid");
            }
        }

        if (isset($data->password)) {
            $password = validate($data->password, 'alphanumeric');
            if ($password == false) {
                throw new Exception("Password not valid");
            }
        }

        if (isset($data->program_id)) {
            $program_id = validate($data->program_id, 'integer');
            if ($program_id == false) {
                throw new Exception("Program ID not valid");
            }
        }

        if (isset($data->program_name)) {
            $program_name = validate($data->program_name, 'alphanumeric_space');
            if ($program_name == false) {
                throw new Exception("Program Name not valid");
            }
        }

        if (isset($data->description)) {
            $description = validate($data->description, 'alphanumeric_space');
            if ($description == false) {
                throw new Exception("Description not valid");
            }
        }

        if (isset($data->program_level)) {
            $program_level = validate($data->program_level, 'alphanumeric_space');
            if ($program_level == false) {
                throw new Exception("Program level value not valid");
            }
        }

        if (isset($data->price)) {
            $price = validate($data->price, 'integer');
            if ($price == false) {
                throw new Exception("Price value not valid");
            }
        }

        if (isset($data->prerequisites)) {
            $prerequisites = validate($data->prerequisites, 'alphanumeric_space');
            if ($prerequisites == false) {
                throw new Exception("Prerequisites value not valid");
            }
        }

        if (isset($data->duration)) {
            $duration = validate($data->duration, 'alphanumeric_space');
            if ($duration == false) {
                throw new Exception("Duration value not valid");
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
                        $response->addMessage("Login successful");
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
                if (isset($username) && isset($email) && isset($password)) {
                    $result = $db->signUp($username, $email, $password);
                } else {
                    throw new Exception("Register user error");
                }
                break;
            case "allprograms":
                $result = $db->getAllPrograms();
                break;
            case "findprogram":
                if (isset($program_id)) {
                    $result = $db->getProgram($program_id);
                } else {
                    throw new Exception("find program error");
                }
                break;
            case "addprogram":
                if (isset($program_name) && isset($description) && isset($program_level) && isset($price) && isset($prerequisites) && isset($duration)) {
                    $result = $db->addProgram($program_name, $description, $program_level, $price, $prerequisites, $duration);
                } else {
                    throw new Exception("create program error");
                }
                break;
            case "editprogram":
                if (isset($program_id) && isset($program_name) && isset($description) && isset($program_level) && isset($price) && isset($prerequisites) && isset($duration)) {
                    $result = $db->updateProgram($program_name, $description, $program_level, $price, $prerequisites, $duration, $program_id);
                } else {
                    throw new Exception("update program error");
                }
                break;
            case "removeprogram":
                if (isset($program_id)) {
                    $result = $db->deleteProgram($program_id);
                } else {
                    throw new Exception("delete program error");
                }
                break;
            default:
                throw new Exception("incorrect action code");
                break;
        }
    } else {
        throw new Exception("Action code does not exist");
    }
    if ($result == false) {
        echo json_encode(array('result' => 'false'));
    } else {
        echo json_encode($result);
    }
} catch (Exception $ae) {
    // echo $ae; // This is debug. INSTEAD: echo json_encode(Array('error'=>'true'));
    echo json_encode(array('error' => 'true'));
}
