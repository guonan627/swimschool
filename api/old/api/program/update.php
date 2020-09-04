<?php
// Headers
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');
header('Access-Control-Allow-Methods: PUT');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authorization, X-Requested-With');

include_once '../../Database.php';
include_once '../../models/Program.php';

// Instantiate DB & connect
$database = new Database();
$db = $database->connect();

// Instantiate blog post object
$program = new Program($db);

// Get raw posted data
$data = json_decode(file_get_contents("php://input"));

// Set ID to update
$program->program_id = $data->program_id;

$program->program_name = $data->program_name;
$program->description = $data->description;
$program->program_level = $data->program_level;
$program->price = $data->price;
$program->prerequisites = $data->prerequisites;
$program->duration = $data->duration;

// Update Program
if ($program->update()) {
  echo json_encode(
    array('message' => 'Program Updated')
  );
} else {
  echo json_encode(
    array('message' => 'Program Not Updated')
  );
}
