<?php
// Concept from here:
// https://developer.okta.com/blog/2019/03/08/simple-rest-api-php

require "../bootstrap.php";
use Compass\Controller\CounselorController;
use Compass\Controller\NewsletterController;

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: OPTIONS,GET,POST,PUT,DELETE");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

$uristring = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
$uri = explode( '/', $uristring );

// all of our endpoints start with /counselor or /newsletter
// everything else results in a 404 Not Found

$requestMethod = $_SERVER["REQUEST_METHOD"];

if ($uri[3] === 'counselor') {
    $controller = new CounselorController($dbConnection, $requestMethod, 0);
    $controller->processRequest();

} else if ($uri[3] === 'newsletter') {
    $controller = new NewsletterController($dbConnection, $requestMethod, 0);
    $controller->processRequest();
} else {
    var_dump($uri);
    $response['status_code_header'] = 'HTTP/1.1 200 OK';
    $response['body'] = json_encode("requested $requestMethod path $uristring not found");
    header($response['status_code_header']);
    echo $response['body'];

    // header("HTTP/1.1 404 Not Found");
    exit();
}

