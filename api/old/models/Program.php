<?php
class Program
{
  // DB stuff
  private $conn;
  private $table = 'program';

  // Program Properties
  public $program_id;
  public $program_name;
  public $description;
  public $program_level;
  public $price;
  public $prerequisites;
  public $duration;

  // Constructor with DB
  public function __construct($db)
  {
    $this->conn = $db;
  }

  // Get Programs
  public function read()
  {
    // Create query
    $query = 'SELECT * FROM ' . $this->table;

    // Prepare statement
    $stmt = $this->conn->prepare($query);

    // Execute query
    $stmt->execute();

    return $stmt;
  }

  // Get Single Program
  public function read_single()
  {
    // Create query
    $query = 'SELECT * FROM ' . $this->table . ' WHERE program_id = ?';

    // Prepare statement
    $stmt = $this->conn->prepare($query);

    // Bind ID
    $stmt->bindParam(1, $this->id);

    // Execute query
    $stmt->execute();

    $row = $stmt->fetch(PDO::FETCH_ASSOC);

    // Set properties
    $this->program_name = $row['program_name'];
    $this->description = $row['description'];
    $this->program_level = $row['program_level'];
    $this->price = $row['price'];
    $this->prerequisites = $row['prerequisites'];
    $this->duration = $row['duration'];
  }

  // Create Program
  public function create()
  {
    // Create query
    $query = 'INSERT INTO ' . $this->table . ' SET program_name = :program_name, description = :description, program_level = :program_level, price = :price, prerequisites = :prerequisites, duration = :duration';

    // Prepare statement
    $stmt = $this->conn->prepare($query);

    // Clean data
    $this->program_name = htmlspecialchars(strip_tags($this->program_name));
    $this->description = htmlspecialchars(strip_tags($this->description));
    $this->program_level = htmlspecialchars(strip_tags($this->program_level));
    $this->price = htmlspecialchars(strip_tags($this->price));
    $this->prerequisites = htmlspecialchars(strip_tags($this->prerequisites));
    $this->duration = htmlspecialchars(strip_tags($this->duration));

    // Bind data
    $stmt->bindParam(':program_name', $this->program_name);
    $stmt->bindParam(':description', $this->description);
    $stmt->bindParam(':program_level', $this->program_level);
    $stmt->bindParam(':price', $this->price);
    $stmt->bindParam(':prerequisites', $this->prerequisites);
    $stmt->bindParam(':duration', $this->duration);

    // Execute query
    if ($stmt->execute()) {
      return true;
    }

    // Print error if something goes wrong
    printf("Error: %s.\n", $stmt->error);

    return false;
  }

  // Update Program
  public function update()
  {
    // Create query
    $query = 'UPDATE ' . $this->table . ' SET program_name = :program_name, description = :description, program_level = :program_level, price = :price, prerequisites = :prerequisites, duration = :duration WHERE program_id = :program_id';

    // Prepare statement
    $stmt = $this->conn->prepare($query);

    // Clean data
    $this->program_name = htmlspecialchars(strip_tags($this->program_name));
    $this->description = htmlspecialchars(strip_tags($this->description));
    $this->program_level = htmlspecialchars(strip_tags($this->program_level));
    $this->price = htmlspecialchars(strip_tags($this->price));
    $this->prerequisites = htmlspecialchars(strip_tags($this->prerequisites));
    $this->duration = htmlspecialchars(strip_tags($this->duration));
    $this->program_id = htmlspecialchars(strip_tags($this->program_id));

    // Bind data
    $stmt->bindParam(':program_name', $this->program_name);
    $stmt->bindParam(':description', $this->description);
    $stmt->bindParam(':program_level', $this->program_level);
    $stmt->bindParam(':price', $this->price);
    $stmt->bindParam(':prerequisites', $this->prerequisites);
    $stmt->bindParam(':duration', $this->duration);
    $stmt->bindParam(':program_id', $this->program_id);

    // Execute query
    if ($stmt->execute()) {
      return true;
    }

    // Print error if something goes wrong
    printf("Error: %s.\n", $stmt->error);

    return false;
  }

  // Delete Post
  public function delete()
  {
    // Create query
    $query = 'DELETE FROM ' . $this->table . ' WHERE program_id = :program_id';

    // Prepare statement
    $stmt = $this->conn->prepare($query);

    // Clean data
    $this->program_id = htmlspecialchars(strip_tags($this->program_id));

    // Bind data
    $stmt->bindParam(':program_id', $this->program_id);

    // Execute query
    if ($stmt->execute()) {
      return true;
    }

    // Print error if something goes wrong
    printf("Error: %s.\n", $stmt->error);

    return false;
  }
}
