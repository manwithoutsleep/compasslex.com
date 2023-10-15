<?php
namespace Compass\Controller;

use Compass\TableGateways\CounselorGateway;

class CounselorController {

    private $db;
    private $requestMethod;
    private $counselorId;

    private $counselorGateway;

    public function __construct($db, $requestMethod, $counselorId)
    {
        $this->db = $db;
        $this->requestMethod = $requestMethod;
        $this->counselorId = $counselorId;

        $this->counselorGateway = new CounselorGateway($db);
    }

    public function processRequest()
    {
        switch ($this->requestMethod) {
            case 'GET':
                $result = $this->counselorGateway->findAll();
                $response['status_code_header'] = 'HTTP/1.1 200 OK';
                $json = json_encode($result);
                $response['body'] = $json;
                break;
            default:
                $response['status_code_header'] = 'HTTP/1.1 200 OK';
                $response['body'] = json_encode("HTTP method " + $this->requestMethod + " not allowed");
                break;
        }

        header($response['status_code_header']);
        
        if ($response['body']) {
            echo $response['body'];
        }
    }

    private function getAllCounselors()
    {
        $result = $this->counselorGateway->findAll();
        $response['status_code_header'] = 'HTTP/1.1 200 OK';
        $response['body'] = json_encode($result);
        return $response;
    }

    // private function getUser($id)
    // {
    //     $result = $this->counselorGateway->find($id);
    //     if (! $result) {
    //         return $this->notFoundResponse();
    //     }
    //     $response['status_code_header'] = 'HTTP/1.1 200 OK';
    //     $response['body'] = json_encode($result);
    //     return $response;
    // }

    // private function createUserFromRequest()
    // {
    //     $input = (array) json_decode(file_get_contents('php://input'), TRUE);
    //     if (! $this->validateCounselor($input)) {
    //         return $this->unprocessableEntityResponse();
    //     }
    //     $this->counselorGateway->insert($input);
    //     $response['status_code_header'] = 'HTTP/1.1 201 Created';
    //     $response['body'] = null;
    //     return $response;
    // }

    // private function updateUserFromRequest($id)
    // {
    //     $result = $this->counselorGateway->find($id);
    //     if (! $result) {
    //         return $this->notFoundResponse();
    //     }
    //     $input = (array) json_decode(file_get_contents('php://input'), TRUE);
    //     if (! $this->validateCounselor($input)) {
    //         return $this->unprocessableEntityResponse();
    //     }
    //     $this->counselorGateway->update($id, $input);
    //     $response['status_code_header'] = 'HTTP/1.1 200 OK';
    //     $response['body'] = null;
    //     return $response;
    // }

    // private function deleteUser($id)
    // {
    //     $result = $this->counselorGateway->find($id);
    //     if (! $result) {
    //         return $this->notFoundResponse();
    //     }
    //     $this->counselorGateway->delete($id);
    //     $response['status_code_header'] = 'HTTP/1.1 200 OK';
    //     $response['body'] = null;
    //     return $response;
    // }

    // private function validateCounselor($input)
    // {
    //     if (! isset($input['firstname'])) {
    //         return false;
    //     }
    //     if (! isset($input['lastname'])) {
    //         return false;
    //     }
    //     return true;
    // }

    // private function unprocessableEntityResponse()
    // {
    //     $response['status_code_header'] = 'HTTP/1.1 422 Unprocessable Entity';
    //     $response['body'] = json_encode([
    //         'error' => 'Invalid input'
    //     ]);
    //     return $response;
    // }

    // private function notFoundResponse()
    // {
    //     $response['status_code_header'] = 'HTTP/1.1 404 Not Found';
    //     $response['body'] = null;
    //     return $response;
    // }
}