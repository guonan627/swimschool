<?php
include("db.php"); // ALL SQL Actions go here
include("se.php"); // ALL Session Management goes here
include("util.php"); // ALL generic utilities

session_start();
$db = new databaseObject();

try {
    // if(!isset($_SESSION['sessionOBJ'])) {
    //     $_SESSION['sessionOBJ'] = new sessionObject();
    // }

    // $_SESSION['sessionOBJ']->logEvent();
    // $_SESSION['sessionOBJ']->domainLock();

    // if($_SESSION['sessionOBJ']->rateLimit() == false) {
    //     throw new APIException("Rate limit exceeded");
    // }

    if (isset($_GET['action'])) {
        $validated_action = validate($_GET['action'], 'alpha');
        if ($validated_action == false) {
            throw new APIException("Action code is not valid");
        }
        // raw json data from request body
        $data = json_decode(file_get_contents("php://input"));

        if (isset($data->program_id)) {
            $program_id = validate($data->program_id, 'integer');
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

        // base case
        switch ($validated_action) {
            case "allprograms":
                $result = $db->getAllPrograms();
                break;
            case "findprogram":
                if (isset($program_id)) {
                    $result = $db->getProgram($program_id);
                } else {
                    throw new APIException("find program error");
                }
                break;
            case "addprogram":
                if (isset($program_name) && isset($description) && isset($program_level) && isset($price) && isset($prerequisites) && isset($duration)) {
                    $result = $db->addProgram($program_name, $description, $program_level, $price, $prerequisites, $duration);
                } else {
                    throw new APIException("create program error");
                }
                break;
            case "editprogram":
                if (isset($program_id) && isset($program_name) && isset($description) && isset($program_level) && isset($price) && isset($prerequisites) && isset($duration)) {
                    $result = $db->updateProgram($program_name, $description, $program_level, $price, $prerequisites, $duration, $program_id);
                } else {
                    throw new APIException("update program error");
                }
                break;
            case "removeprogram":
                if (isset($program_id)) {
                    $result = $db->deleteProgram($program_id);
                } else {
                    throw new APIException("delete program error");
                }
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
    } else {
        echo json_encode($result);
    }
} catch (APIException $ae) {
    echo $ae; // This is debug. INSTEAD: echo json_encode(Array('error'=>'true'));
}
