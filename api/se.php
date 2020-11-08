<?php
if (count($_COOKIE) < 1) {
    $header = 'Location: testsession.php?' . $_SERVER['QUERY_STRING'];
    header($header);
}

class sessionObject
{
    private $_token = null;
    private $_username = null;
    private $_userid = null;
    private $_role = null;
    private $_email = null;
    private $_ip = null;
    private $_startTime = null;
    private $_requestCounter = null;

    public function getUsername()
    {
        return $this->_username;
    }
    public function getUserId()
    {
        return $this->_userid;
    }
    public function getRole()
    {
        return $this->_role;
    }
    public function getEmail()
    {
        return $this->_email;
    }

    public function setIp($ip)
    {
        $this->_ip = $ip;
    }

    public function getIp()
    {
        return $this->_ip;
    }

    public function setStartTime($startTime)
    {
        $this->_startTime = $startTime;
    }

    public function getStartTime()
    {
        return $this->_startTime;
    }

    public function setRequestCounter($requestCounter)
    {
        $this->_requestCounter = $requestCounter;
    }

    public function getRequestCounter()
    {
        return $this->_requestCounter;
    }

    // 24 Hours Limit
    public function oneDayRateLimit()
    {   // check if sent request before, and set the first request time 
        if ($this->_startTime == null) {
            $this->_startTime = time();
        }
        $this->_requestCounter++; // add 1 time to the counter
        $hours = (time() - $this->_startTime / 3600); // calculate how many hours past from the first request
        if ($hours < 24 && $this->_requestCounter > 1000) { // rate limit control if it is over 24 hours 
            return false;
        } else if ($hours >= 24) { // counter go back to 0 if it is over 24 hours
            $this->_requestCounter = 0;
        }
        return $this->_requestCounter;
    }

    // set session variables upon successful login
    public function setAuth($incomingAuth)
    {
        $stringAuth = json_encode($incomingAuth);
        $this->_token = hash('md2', $stringAuth);
        $this->_userid = $incomingAuth['login_id'];
        $this->_username = $incomingAuth['username'];
        $this->_role = $incomingAuth['role'];
        return array('token' => $this->_token, 'username' => $this->_username, 'userid' => $this->_userid, 'role' => $this->_role);
    }

    public function unsetAuth()
    {
        $this->_token = null;
        $this->_username = null;
        $this->_userid = null;
        $this->_ip = null;
        $this->_role = null;
        return array("username" => "-1");
    }

    // Get the bearer token from Authorization Header of incoming HTTP requests
    private function getBearerToken()
    {
        $headers = null;
        if (isset($_SERVER['Authorization'])) {
            $headers = trim($_SERVER["Authorization"]);
        } else if (isset($_SERVER['HTTP_AUTHORIZATION'])) { //Nginx or fast CGI
            $headers = trim($_SERVER["HTTP_AUTHORIZATION"]);
        } elseif (function_exists('apache_request_headers')) {
            $requestHeaders = apache_request_headers();
            // Server-side fix for bug in old Android versions (a nice side-effect of this fix means we don't care about capitalization for Authorization)
            $requestHeaders = array_combine(array_map('ucwords', array_keys($requestHeaders)), array_values($requestHeaders));
            //print_r($requestHeaders);
            if (isset($requestHeaders['Authorization'])) {
                $headers = trim($requestHeaders['Authorization']);
            }
        }
        // HEADER: Get the access token from the header
        if (!empty($headers)) {
            if (preg_match('/Bearer\s(\S+)/', $headers, $matches)) {
                return $matches[1];
            }
        }
        return null;
    }

    // Check if it is authenticated
    public function isLoggedIn()
    {
        $bearerToken = $this->getBearerToken();
        if (isset($bearerToken) && $bearerToken == $this->_token)
            return true;
        return false;
    }
}
