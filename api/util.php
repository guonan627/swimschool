<?php
class APIException extends Exception
{
}

// Response Object
class Response
{
    // define private variables
    private $_success;
    // create empty messages array
    private $_messages = array();
    // define data variable
    private $_data;
    // define http status code variable
    private $_httpStatusCode;
    // create empty response data array - will be returned as json response
    private $_responseData = array();

    // define setSuccess flag method - true or false
    public function setSuccess($success)
    {
        $this->_success = $success;
    }

    // define addMessage method - can add any error or information info
    public function addMessage($message)
    {
        $this->_messages[] = $message;
    }

    // define setData method - can be used to add any data
    public function setData($data)
    {
        $this->_data = $data;
    }

    // define setHttpStatusCode method - numeric status code
    public function setHttpStatusCode($httpStatusCode)
    {
        $this->_httpStatusCode = $httpStatusCode;
    }

    // define the send method - this will send the built response object to the browser
    // in json format
    public function send()
    {
        // setup CORS
        header('Content-type:application/json;charset=utf-8');
        header("Access-Control-Allow-Origin: *");
        header("Access-Control-Allow-Methods: HEAD, GET, POST, PUT, PATCH, DELETE, OPTIONS");
        header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method,Access-Control-Request-Headers, Authorization");
        // handle preflight request with the OPTIONS method
        $method = $_SERVER['REQUEST_METHOD'];
        if ($method == "OPTIONS") {
            header('Access-Control-Allow-Origin: *');
            header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method,Access-Control-Request-Headers, Authorization");
            header("HTTP/1.1 200 OK");
            exit(0);
        }

        // if response is not set up correctly, e.g. not numeric in status code or success not true or false
        // send a error response
        if (!is_numeric($this->_httpStatusCode) || ($this->_success !== false && $this->_success !== true)) {
            // set http status code in response header
            http_response_code(500);
            // set statusCode in json response
            $this->_responseData['statusCode'] = 500;
            // set success flag in json response
            $this->_responseData['success'] = false;
            // set custom error message
            $this->addMessage("Response creation error");
            // set messages in json response
            $this->_responseData['messages'] = $this->_messages;
        } else {
            // set http status code in response header
            http_response_code($this->_httpStatusCode);
            // set statusCode in json response
            $this->_responseData['statusCode'] = $this->_httpStatusCode;
            // set success flag in json response
            $this->_responseData['success'] = $this->_success;
            // set messages in json response
            $this->_responseData['messages'] = $this->_messages;
            // set data array in json response
            $this->_responseData['data'] = $this->_data;
        }

        // encode the responseData array to json response output
        echo json_encode($this->_responseData);
    }
}

// Helper functions
function logFile($action)
{
    try {
        $ip = $_SERVER['REMOTE_ADDR']; // IP address
        $time = date('d/m/y h:i:sa', time()); // current date and time
        // $browser = $_SERVER['HTTP_USER_AGENT'];
        $ua = explode(" ", $_SERVER['HTTP_USER_AGENT']);
        $browser = $ua[count($ua) - 1]; // find the last element in User Agent string

        // read existing logs
        $myfile = fopen("log.txt", "r") or die("Unable to open file!");
        $contents = '';
        while (!feof($myfile)) {
            $contents .= fgets($myfile);
        }
        fclose($myfile);

        // append new log
        $contents .= "$time\t$ip\t$browser\t$action\r";
        $myfile = fopen("log.txt", "w") or die("Unable to open file!");
        fwrite($myfile, $contents);
        fclose($myfile);
    } catch (Exception $ex) {
        echo json_encode(array('Error' => $ex->getMessage()));
    }
}

// if (isset($_SERVER['HTTP_REFERRER'])){
//     $this->referrer = $_SERVE['HTTP_REFERRER'];
// }else {
//     throw new APIException("No referrer");
// }

// // whitelist referral
// function domainLock(){
//     if ((strops($this->referrer,'localhost:8888') !== false)||
//         (strops($this->referrer,'swimschool') !== false)) {
//             return true;
//         } else {
//             // throw new APIException("invalid referrer");
//             return false;
//         }
// }

function sanatise($dirty_string)
{
    $clean_string = stripslashes($dirty_string);
    $clean_string = strip_tags($clean_string);
    $clean_string = trim($clean_string);
    return $clean_string;
}
function kill_session()
{
    session_destroy();
    die();
}
function validate($dirty_string, $action_code)
{
    switch ($action_code) {
        case 'alpha':
            if (ctype_alpha($dirty_string)) {
                return $dirty_string;
            }
            return false;
        case 'integer':
            if (is_numeric($dirty_string)) {
                return (int)$dirty_string;
            }
            return false;
        case 'key':
            if (is_numeric($dirty_string)) {
                if ((int)$dirty_string > 1) {
                    return $dirty_string;
                }
            }
            return false;
        case 'primarykey':
            if (is_numeric($dirty_string)) {
                if ((int)$dirty_string > 0 && (int)$dirty_string < 99999999999) {
                    return $dirty_string;
                }
            }
            return false;
        case 'IP':
            if (ip2long($dirty_string)) {
                return $dirty_string;
            }
            return false;
        case 'winloss':
            if (
                $dirty_string == 'win' || $dirty_string == 'loss'
                || $dirty_string == 'draw'
            ) {
                return $dirty_string;
            }
            return false;
        case 'colorcode':
            if (ctype_xdigit($dirty_string)) {
                return $dirty_string;
            }
            return false;
        case 'alpha':
            if (ctype_alpha($dirty_string)) {
                return $dirty_string;
            }
            return false;
        case 'alphanumeric':
            if (ctype_alnum($dirty_string)) {
                return $dirty_string;
            }
            return false;
        case 'alphanumeric_space':
            if (ctype_print($dirty_string)) {
                return $dirty_string;
            }
            return false;


        case 'filename':
            if (ctype_graph($dirty_string)) {
                return $dirty_string;
            }
            return false;
        case 'isodate':
            $dt = strtotime($dirty_string);
            $dt = DateTime::createFromFormat('Y-m-d', $dt);
            if ($dt != false) {
                return $dt->format('Y-m-d');
            }
            return false;
        case 'isodatetime':
            $dt = DateTime::createFromFormat('Y/m/d H:i:s', $dirty_string);
            if ($dt != false) {
                return $dt->format('Y-m-d H:i:s');
            }
            return false;
        default:
            return false;
    }
}
