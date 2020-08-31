<?php
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

// Get ID
$program->id = isset($_GET['id']) ? $_GET['id'] : die();

// Get program
$program->read_single();

// Create array
$program_arr = array(
  'program_id' => $program->id,
  'program_name' => $program->program_name,
  'description' => $program->description,
  'program_level' => $program->program_level,
  'price' => $program->price,
  'prerequisites' => $program->prerequisites,
  'duration' => $program->duration
);

// Make JSON
print_r(json_encode($program_arr));
