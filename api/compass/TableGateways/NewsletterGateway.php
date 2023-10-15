<?php
namespace Compass\TableGateways;

use Compass\Models\Newsletter;
use Compass\Models\NewsletterList;

class NewsletterGateway {

    private $db = null;

    public function __construct($db)
    {
        $this->db = $db;
    }

    public function findAll()
    {
        $sql = "
            SELECT
                `description`,
                `id`,
                `quarter`,
                `title`,
                `year`
            FROM `newsletters`
            ORDER BY `year` DESC, `quarter` DESC;
        ";

        try {
            $query = $this->db->query($sql);
            $dbResultCollection = $query->fetchAll(\PDO::FETCH_ASSOC);
            $results = new NewsletterList();
            foreach ($dbResultCollection as $dbResult) {
                $results->newsletterList[] = $this->ToNewsletter($dbResult);
            }
            return $results;
        } catch (\PDOException $e) {
            exit($e->getMessage());
        }
    }

    private function ToNewsletter($dbResult) {
        $newsletter = new Newsletter();
        $newsletter->description = $dbResult["description"];
        $newsletter->id = $dbResult["id"];
        $newsletter->quarter = $dbResult["quarter"];
        $newsletter->title = $dbResult["title"];
        $newsletter->year = $dbResult["year"];
        return $newsletter;
    }
}

?>
