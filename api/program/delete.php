<?php
// Headers
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');
header('Access-Control-Allow-Methods: DELETE');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authorization, X-Requested-With');

include_once '../../Database.php';
include_once '../../models/Program.php';

// Instantiate DB & connect
$database = new Database();
$db = $database->connect();

// Instantiate program object
$program = new Program($db);

// Get raw data
$data = json_decode(file_get_contents("php://input"));

// Set ID to update
$program->program_id = $data->program_id;

// Delete program
if ($program->delete()) {
  echo json_encode(
    array('message' => 'Program Deleted')
  );
} else {
  echo json_encode(
    array('message' => 'Program Not Deleted')
  );
}
