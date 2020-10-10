<?php
class DB
{
    private $host = 'localhost:8889';
    private $db_name = 'swimschool';
    private $username = 'root';
    private $password = 'root';
    private $conn;
    public function __construct()
    {
        try {
            $this->conn = new PDO('mysql:host=' . $this->host . ';dbname=' . $this->db_name, $this->username, $this->password);
            $this->conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        } catch (PDOException $e) {
            echo json_encode(array("error" => "Database Connection Error"));
            die();
        }
    }

    public function login($username, $password)
    {
        try {
            $auth = "SELECT * FROM login WHERE username = :username";
            $stmt = $this->conn->prepare($auth);
            $stmt->bindParam(':username', $username, PDO::PARAM_STR);
            $stmt->execute();
            $result = $stmt->fetch(PDO::FETCH_ASSOC);
            if ($result == false) {
                return array("username" => -1);
            } else {
                if (password_verify($password, $result['password'])) {
                    // if ($password == $result['password']) {
                    return $result;
                } else {
                    return array("username" => -1);
                }
            }
        } catch (PDOException $e) {
            echo "Login error";
            die();
        }
    }

    public function signUp($username, $email, $password)
    {
        try {
            $HashedPassword = password_hash($password, PASSWORD_DEFAULT);
            $query = 'INSERT INTO login (username, email, password)
                VALUES (:username, :email, :password)';
            $stmt = $this->conn->prepare($query);
            $stmt->bindParam(':username', $username);
            $stmt->bindParam(':email', $email);
            $stmt->bindParam(':password', $HashedPassword);
            $result = $stmt->execute();
            if ($result == false) {
                return false;
            } else {
                return $result;
                //$conn->lastInsertId();
            }
        } catch (PDOException $e) {
            echo $e;
            echo "Register user error";
            die();
        }
    }

    public function logging($action)
    {
        try {
            $ip = $_SERVER['REMOTE_ADDR'];
            $time = date('d/m/y h:i:sa', time());
            $ua = explode(" ", $_SERVER['HTTP_USER_AGENT']);
            $browser = $ua[count($ua) - 1];

            $query = 'INSERT INTO logging (action, time, ip, browser)
            VALUES (:action, :time, :ip, :browser)';
            $stmt = $this->conn->prepare($query);
            $stmt->bindParam(':action', $action);
            $stmt->bindParam(':time', $time);
            $stmt->bindParam(':ip', $ip);
            $stmt->bindParam(':browser', $browser);
            $result = $stmt->execute();
            if ($result == false) {
                return false;
            } else {
                return $result;
                //$conn->lastInsertId();
            }
        } catch (PDOException $e) {
            echo $e;
            echo "DB logging error";
            die();
        }
    }

    public function findAllEmails()
    {
        try {
            $query = 'SELECT email FROM login';
            $stmt = $this->conn->prepare($query);
            $stmt->execute();
            $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
            if ($result == false) {
                return false;
            } else {
                return $result;
            }
        } catch (PDOException $e) {
            echo "get accounts error";
            die();
        }
    }

    // Add Program
    public function addProgram($program_name, $description, $program_level, $price, $prerequisites, $duration)
    {
        try {
            // Create query
            $query = 'INSERT INTO program SET program_name = :program_name, description = :description, program_level = :program_level, price = :price, prerequisites = :prerequisites, duration = :duration';

            // Prepare statement
            $stmt = $this->conn->prepare($query);

            // Bind data
            $stmt->bindParam(':program_name', $program_name);
            $stmt->bindParam(':description', $description);
            $stmt->bindParam(':program_level', $program_level);
            $stmt->bindParam(':price', $price);
            $stmt->bindParam(':prerequisites', $prerequisites);
            $stmt->bindParam(':duration', $duration);

            // Execute query
            $result = $stmt->execute();
            //update playerid with $conn->lastInsertId();
            if ($result == false) {
                return false;
            } else {
                return array("request" => "created new program");
            }
        } catch (PDOException $e) {
            echo "create program error";
            die();
        }
    }


    // Get All Programs
    public function getAllPrograms()
    {
        try {
            $query = 'SELECT * FROM program';
            $stmt = $this->conn->prepare($query);
            $stmt->execute();
            $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
            if ($result == false) {
                return false;
            } else {
                return $result;
            }
        } catch (PDOException $e) {
            echo "get programs error";
            die();
        }
    }

    // Get Single Program
    public function getProgram($program_id)
    {
        try {
            $query = 'SELECT * FROM program WHERE program_id = ' . $program_id;
            $stmt = $this->conn->prepare($query);
            $stmt->execute();
            $row = $stmt->fetch(PDO::FETCH_ASSOC);
            if ($row == false) {
                return false;
            } else {
                return $row;
            }
        } catch (PDOException $e) {
            echo "get program error";
            die();
        }
    }


    // Update Program
    public function updateProgram($program_name, $description, $program_level, $price, $prerequisites, $duration, $program_id)
    {
        try {
            $query = 'UPDATE program SET program_name = :program_name, description = :description, program_level = :program_level, price = :price, prerequisites = :prerequisites, duration = :duration WHERE program_id = :program_id';

            $stmt = $this->conn->prepare($query);

            $stmt->bindParam(':program_name', $program_name);
            $stmt->bindParam(':description', $description);
            $stmt->bindParam(':program_level', $program_level);
            $stmt->bindParam(':price', $price);
            $stmt->bindParam(':prerequisites', $prerequisites);
            $stmt->bindParam(':duration', $duration);
            $stmt->bindParam(':program_id', $program_id);

            $result = $stmt->execute();
            if ($result == false) {
                return false;
            } else {
                return $this->getProgram($program_id);
            }
        } catch (PDOException $e) {
            echo "update program error";
            die();
        }
    }

    // Delete program
    public function deleteProgram($program_id)
    {
        try {
            $query = 'DELETE FROM program WHERE program_id = :program_id';

            $stmt = $this->conn->prepare($query);

            $stmt->bindParam(':program_id', $program_id);

            $result = $stmt->execute();
            if ($result == false) {
                return false;
            } else {
                return array("request" => "removed program");
            }
        } catch (PDOException $e) {
            echo "get programs error";
            die();
        }
    }

    // Search Classes by Time
    public function getAllClasses($day)
    {
        try {
            $query = 'SELECT * FROM class INNER JOIN program ON class.program_id = program.program_id WHERE daytime = "' . $day . '"';
            $stmt = $this->conn->prepare($query);
            $stmt->execute();
            $row = $stmt->fetchAll(PDO::FETCH_ASSOC);
            if ($row == false) {
                return false;
            } else {
                return $row;
            }
        } catch (PDOException $e) {
            echo $e;
            die();
        }
    }

    // Search Classes by Program
    // public function getClassesByProgram($program_id)
    // {
    //     try {
    //         $query = 'SELECT * FROM class WHERE program_id = ' . $program_id;
    //         $stmt = $this->conn->prepare($query);
    //         $stmt->execute();
    //         $row = $stmt->fetch(PDO::FETCH_ASSOC);
    //         if ($row == false) {
    //             return false;
    //         } else {
    //             return $row;
    //         }
    //     } catch (PDOException $e) {
    //         echo "get class error";
    //         die();
    //     }
    // }

    // View Own Class
    // public function viewOwnClass($class_id)
    // {
    //     try {
    //         $query = 'SELECT * FROM program';
    //         $stmt = $this->conn->prepare($query);
    //         $stmt->execute();
    //         $row = $stmt->fetch(PDO::FETCH_ASSOC);
    //         if ($row == false) {
    //             return false;
    //         } else {
    //             return $row;
    //         }
    //     } catch (PDOException $e) {
    //         echo "get program error";
    //         die();
    //     }
    // }





}
