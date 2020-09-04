<?php
class databaseObject
{
    private $host = 'localhost:8889';
    private $db_name = 'school';
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


    // Get Programs
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
                return array("request" => "updated a program");
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
                return array("request" => "removed a program");
            }
        } catch (PDOException $e) {
            echo "get programs error";
            die();
        }
    }

    // Add Class
}
