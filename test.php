<?php

session_start();

echo session_id();

if(!isset($_SESSION['foo'])) {
  $_SESSION['foo'] = 'bar'；
  echo json_encode(Array('session'=>'err'));
} else
  echo json_encode(Array('session'=>$_SESSION['foo']));
}