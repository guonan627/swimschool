<?php
if (!isset($_SERVER['PHP_AUTH_USER'])) {
  header('WWW-Authenticate: Basic realm="My Realm"');
  header('HTTP/1.0 401 Unauthorized');
  echo "Sorry, please login";
  exit;
} else {
  $username = "Nan";
  $password = "1234";
  if ($_SERVER['PHP_AUTH_USER'] == $username && $_SERVER['PHP_AUTH_PW'] == $password) {
    // Headers
    header('Access-Control-Allow-Origin: *');
    header('Content-Type: application/json');

    include_once '../../Database.php';
    include_once '../../models/Program.php';

    // Instantiate DB & connect
    $database = new Database();
    $db = $database->connect();

    // Instantiate program object
    $program = new Program($db);

    // program query
    $result = $program->read();
    // Get row count
    $num = $result->rowCount();

    // Check if any programs
    if ($num > 0) {
      // Programs array
      $programs_arr = array();
      // $programs_arr['data'] = array();

      while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
        extract($row);

        $program_item = array(
          'program_id' => $program_id,
          'program_name' => $program_name,
          'description' => $description,
          'program_level' => $program_level,
          'price' => $price,
          'prerequisites' => $prerequisites,
          'duration' => $duration
        );

        // Push to "data"
        array_push($programs_arr, $program_item);
        // array_push($programs_arr['data'], $program_item);
      }

      // Turn to JSON & output
      echo json_encode($programs_arr);
    } else {
      // No programs
      echo json_encode(
        array('message' => 'No programs Found')
      );
    }
  } else {
    header('WWW-Authenticate: Basic realm="My Realm"');
    header('HTTP/1.0 401 Unauthorized');
    echo "Incorrect username or password";
  }
}

