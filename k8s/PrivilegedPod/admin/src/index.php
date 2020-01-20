<?php
$redis = new Redis();
$redis->connect('redis', 6379);

$token = $redis->get('token');

if (!$token) {
    $token = md5(mt_rand(1, 999999999999999999));
    $redis->set('token', $token);
}

if ($_GET['token'] == $token) {
    echo 'Welcome to admin area 👍';
} else {
    echo 'No access 🛑';
}
