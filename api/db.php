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

    // Login
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

    // Register
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

    // Record logging history into database
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

    // Check all the enrolled students
    public function getAllEnrollments()
    {
        try {
            $query = 'SELECT * FROM enrolled';
            $stmt = $this->conn->prepare($query);
            $stmt->execute();
            $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
            if ($result == false) {
                return false;
            } else {
                return $result;
            }
        } catch (PDOException $e) {
            echo "get enrolments error";
            die();
        }
    }

    // Check if the logged-in user has enrolled a class
    public function findEnrollmentsByUser($login_id)
    {
        try {
            $query = 'SELECT * FROM enrolled WHERE login_id = ' . $login_id;
            $stmt = $this->conn->prepare($query);
            $stmt->execute();
            $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
            if ($result == false) {
                return array();
            } else {
                return $result;
            }
        } catch (PDOException $e) {
            echo "get enrolments error";
            die();
        }
    }

    // Check email when log in
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

    // Add program
    public function addProgram($program_name, $description, $program_level, $price, $prerequisites, $duration, $pics)
    {
        try {
            // Create query
            $query = 'INSERT INTO program SET program_name = :program_name, description = :description, program_level = :program_level, price = :price, prerequisites = :prerequisites, duration = :duration, pics = :pics';

            // Prepare statement
            $stmt = $this->conn->prepare($query);

            // Bind data
            $stmt->bindParam(':program_name', $program_name);
            $stmt->bindParam(':description', $description);
            $stmt->bindParam(':program_level', $program_level);
            $stmt->bindParam(':price', $price);
            $stmt->bindParam(':prerequisites', $prerequisites);
            $stmt->bindParam(':duration', $duration);
            $stmt->bindParam(':pics', $pics);

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


    // Check all programs
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

    // Check a specific program
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


    // Update a program
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

    // Delete a program
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

    // Search classes by time
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

    //Search classes by program
    public function getClassesByProgram($program_id)
    {
        try {
            $query = 'SELECT * FROM class INNER JOIN program ON class.program_id = program.program_id WHERE class.program_id = "' . $program_id . '"';
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

    //Search class by classID
    public function getClassById($class_id)
    {
        try {
            $query = 'SELECT * FROM class INNER JOIN program ON class.program_id = program.program_id WHERE class.class_id = "' . $class_id . '"';
            $stmt = $this->conn->prepare($query);
            $stmt->execute();
            $row = $stmt->fetch(PDO::FETCH_ASSOC);
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

    // Enroll a class
    function enroll($login_id, $class_id, $cur_number, $givenname, $surname, $gender, $address, $email, $phone, $dob, $health)
    {
        try {
            $this->conn->beginTransaction();
            //Step 1: create student details in enrolled table
            $newstudent = "INSERT INTO enrolled(name, surname, gender, address, email, phone, dob, health, login_id, class_id) VALUES (:name, :surname, :gender, :address, :email, :phone, :dob, :health, :login_id, :class_id)";
            $stmt = $this->conn->prepare($newstudent);
            $stmt->bindValue(':name', $givenname);
            $stmt->bindValue(':surname', $surname);
            $stmt->bindValue(':gender', $gender);
            $stmt->bindValue(':address', $address);
            $stmt->bindValue(':email', $email);
            $stmt->bindValue(':phone', $phone);
            $stmt->bindValue(':dob', $dob);
            $stmt->bindValue(':health', $health);
            $stmt->bindValue(':login_id', $login_id);
            $stmt->bindValue(':class_id', $class_id);
            $stmt->execute();
            //Step 2: upgrade class status
            $updatedclass = "UPDATE class SET cur_number = :cur_number WHERE class_id = :class_id";
            $stmt = $this->conn->prepare($updatedclass);
            $stmt->bindValue(':class_id', $class_id);
            $stmt->bindValue(':cur_number', $cur_number);
            $stmt->execute();
            //Step 3: commit
            $this->conn->commit();
        } catch (PDOException $ex) {
            $this->conn->rollBack();
            throw $ex;
        }
    }

    //View my class
    public function viewOwnClass($user_id)
    {
        try {
            $query = 'SELECT * FROM class INNER JOIN enrolled ON class.class_id = enrolled.class_id INNER JOIN program ON class.program_id = program.program_id WHERE enrolled.login_id = "' . $user_id . '"';
            $stmt = $this->conn->prepare($query);
            $stmt->execute();
            $row = $stmt->fetch(PDO::FETCH_ASSOC);
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

    // Check all classes
    public function allClasses()
    {
        try {
            $query = 'SELECT * FROM class INNER JOIN program ON class.program_id = program.program_id';
            $stmt = $this->conn->prepare($query);
            $stmt->execute();
            $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
            if ($result == false) {
                return false;
            } else {
                return $result;
            }
        } catch (PDOException $e) {
            echo "get classes error";
            die();
        }
    }

    // Add class
    public function addClass($start_date, $end_date, $daytime, $time, $trainer_name, $max_number, $cur_number, $program_id, $class_id)
    {
        try {
            // Create query
            $query = 'INSERT INTO class SET start_date = :start_date, end_date = :end_date, daytime = :daytime, time = :time, trainer_name = :trainer_name, max_number = :max_number, cur_number = :cur_number, program_id = :program_id, class_id = :class_id';

            // Prepare statement
            $stmt = $this->conn->prepare($query);

            // Bind data
            $stmt->bindParam(':start_date', $start_date);
            $stmt->bindParam(':end_date', $end_date);
            $stmt->bindParam(':daytime', $daytime);
            $stmt->bindParam(':time', $time);
            $stmt->bindParam(':trainer_name', $trainer_name);
            $stmt->bindParam(':max_number', $max_number);
            $stmt->bindParam(':cur_number', $cur_number);
            $stmt->bindParam(':program_id', $program_id);
            $stmt->bindParam(':class_id', $class_id);

            // Execute query
            $result = $stmt->execute();
            //update playerid with $conn->lastInsertId();
            if ($result == false) {
                return false;
            } else {
                return array("request" => "created a new class");
            }
        } catch (PDOException $e) {
            echo "create class error";
            die();
        }
    }

    // Update a program
    public function updateClass($start_date, $end_date, $daytime, $time, $trainer_name, $max_number, $cur_number, $program_id)
    {
        try {
            $query = 'UPDATE class SET start_date = :start_date, end_date = :end_date, daytime = :daytime, time = :time, trainer_name = :trainer_name, max_number = :max_number, cur_number = :cur_number, program_id = :program_id WHERE class_id = :class_id';

            $stmt = $this->conn->prepare($query);

            // Bind data
            $stmt->bindParam(':start_date', $start_date);
            $stmt->bindParam(':end_date', $end_date);
            $stmt->bindParam(':daytime', $daytime);
            $stmt->bindParam(':time', $time);
            $stmt->bindParam(':trainer_name', $trainer_name);
            $stmt->bindParam(':max_number', $max_number);
            $stmt->bindParam(':cur_number', $cur_number);
            $stmt->bindParam(':program_id', $program_id);
            $stmt->bindParam(':class_id', $class_id);

            $result = $stmt->execute();
            if ($result == false) {
                return false;
            } else {
                return $this->getClassById($class_id);
            }
        } catch (PDOException $e) {
            echo "update class error";
            die();
        }
    }

    // Delete a program
    public function deleteClass($class_id)
    {
        try {
            $query = 'DELETE FROM class WHERE class_id = :class_id';

            $stmt = $this->conn->prepare($query);

            $stmt->bindParam(':class_id', $class_id);

            $result = $stmt->execute();
            if ($result == false) {
                return false;
            } else {
                return array("request" => "removed the class");
            }
        } catch (PDOException $e) {
            echo "get the class error";
            die();
        }
    }
}
