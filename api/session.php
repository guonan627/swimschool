<?php
session_start();
// rate limit
function() {
  if (isset($_SESSION['LAST_CALL'])) {
    $last = strtotime($_SESSION['LAST_CALL']);
    $curr = strtotime(date("Y-m-d h:i:s"));
    $sec =  abs($last - $curr);
    echo $last;
    echo "<br/>";
    echo $curr;
    echo "<br/>";

    if ($sec <= 1) {
      $data = 'Rate Limit Exceeded';  // too frequent use
      // header('Content-Type: application/json');
      die (json_encode($data));        
    }
  }
  $_SESSION['LAST_CALL'] = date("Y-m-d h:i:s");
 
  // normal use
  $data = "Data Returned from API";
  // header('Content-Type: application/json');
  die(json_encode($data)); 
}

//log event

?>