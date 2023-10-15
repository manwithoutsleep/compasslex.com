<?php
namespace Compass\Controller;

use Compass\TableGateways\NewsletterGateway;

class NewsletterController {

    private $db;
    private $requestMethod;
    private $newsletterId;

    private $newsletterGateway;

    public function __construct($db, $requestMethod, $newsletterId)
    {
        $this->db = $db;
        $this->requestMethod = $requestMethod;
        $this->newsletterId = $newsletterId;

        $this->newsletterGateway = new NewsletterGateway($db);
    }

    public function processRequest()
    {
        switch ($this->requestMethod) {
            case 'GET':
                $result = $this->newsletterGateway->findAll();
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

    private function getAllNewsletters()
    {
        $result = $this->newsletterGateway->findAll();
        $response['status_code_header'] = 'HTTP/1.1 200 OK';
        $response['body'] = json_encode($result);
        return $response;
    }
}
