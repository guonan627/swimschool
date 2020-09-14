<?php
    if(count($_COOKIE) < 1) {
        $header = 'Location: testsession.php?' . $_SERVER['QUERY_STRING'];
        header($header);
    }

    class sessionObject {
        private $lastrequestArray = null;
        private $authCode = null;
        private $username = null;
        private $userid = null;
        private $role = null;

        // public function domainLock() {
        //     if((strpos($this->referrer, 'localhost') !== false) ||
        //             (strpos($this->referrer, 'LANLadder') !== false)) {
        //         return true;
        //     } else {
        //         throw new APIException("invalid referrer");
        //     }
        // }

        // public function rateLimit1(){
        //     if (isset($_SESSION['LAST_CALL'])) {
        //         $last = strtotime($_SESSION['LAST_CALL']);
        //         $curr = strtotime(date("Y-m-d h:i:s"));
        //         $sec =  abs($last - $curr);

        //         if ($sec <= 1) {
        //           $data = 'Rate Limit Exceeded'; // too frequent
        //           die (json_encode($data));
        //         }
        //       }
        //       $_SESSION['LAST_CALL'] = date("Y-m-d h:i:s");
             
        //       // normal use
        //       $data = "Data Returned from API";
        //       die(json_encode($data)); 
        // }

        public function rateLimit() {
            $temprequestArray = Array();
            if($this->lastrequestArray == null) {
                $this->lastrequestArray = Array(time());
            }
            if(time() == end($this->lastrequestArray)) {
                array_push($this->lastrequestArray, time());
                foreach($this->lastrequestArray AS $thisone) {
                    if($thisone == time()) {
                        array_push($temprequestArray, $thisone);
                    }
                }
                if(count($temprequestArray) > 10) {
                    return false;
                }
            } else {
                array_push($this->lastrequestArray, time());
            }
            foreach($this->lastrequestArray AS $thisone) {
                if($thisone > (time() - 86400)) {
                    array_push($temprequestArray, $thisone);
                }
                if(count($temprequestArray) > 10000) {
                    $lastrequestArray = $temprequestArray;
                    return false;
                }
            }
            return true;
        }



        function isAuth() {
            if($this->authCode !== null) {
                return Array('auth'=>$this->authCode, 'username'=>$this->username, 'userid'=>$this->userid, 'role'=>$this->role);
            } else {
                return Array('auth'=>-1);
            }
        }

        // set session variables upon successful login
        function setAuth($incomingAuth) {
            $stringAuth = json_encode($incomingAuth);
            $this->authCode = hash('md2', $stringAuth);
            $this->userid = $incomingAuth['login_id'];
            $this->username = $incomingAuth['username'];
            $this->role = $incomingAuth['role'];
            return Array('auth'=>$this->authCode, 'username'=>$this->username, 'userid'=>$this->userid, 'role'=>$this->role);
        }
        function unsetAuth() {
            $this->authCode = null;
            $this->uid = null;
            $this->role = null;
            return Array("username"=>"-1");
        }
        
    }
