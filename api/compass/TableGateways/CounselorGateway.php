<?php
namespace Compass\TableGateways;

use Compass\Models\Counselor;
use Compass\Models\CounselorList;

class CounselorGateway {

    private $db = null;

    public function __construct($db)
    {
        $this->db = $db;
    }

    public function findAll()
    {
        $sql = "
            SELECT
                `id`,
                `isactive`,
                `sortorder`,
                `firstname`,
                `lastname`,
                `phone`,
                `email`,
                `practitionerid`,
                `appointmentlink`,
                `directoryid`,
                `shortdescription`,
                `longdescription`
            FROM `counselors`
            WHERE `isactive` = 1
            ORDER BY `sortorder`;
        ";

        try {
            $query = $this->db->query($sql);
            $dbResultCollection = $query->fetchAll(\PDO::FETCH_ASSOC);
            $results = new CounselorList();
            foreach ($dbResultCollection as $dbResult) {
                $results->counselorList[] = $this->ToCounselor($dbResult);
            }
            return $results;
        } catch (\PDOException $e) {
            exit($e->getMessage());
        }
    }

    private function ToCounselor($dbResult) {
        $counselor = new Counselor();
        $counselor->id = $dbResult["id"];
        $counselor->firstname = $dbResult["firstname"];
        $counselor->lastname = $dbResult["lastname"];
        $counselor->phone = $dbResult["phone"];
        $counselor->email = $dbResult["email"];
        $counselor->practitionerid = $dbResult["practitionerid"];
        $counselor->directoryid = $dbResult["directoryid"];
        $counselor->appointmentlink = $dbResult["appointmentlink"];
        $counselor->shortdescription = $dbResult["shortdescription"];
        $counselor->longdescription = $dbResult["longdescription"];
        $counselor->credentials = $this->GetItemsByCounselorId($counselor->id, "SELECT `content` FROM `credentials` WHERE `counselorid` = ? AND `isactive` = 1 ORDER BY `sortorder`;");
        $counselor->insurance = $this->GetItemsByCounselorId($counselor->id, "SELECT `content` FROM `insurances` WHERE `counselorid` = ? AND `isactive` = 1 ORDER BY `sortorder`;");
        $counselor->memberships = $this->GetItemsByCounselorId($counselor->id, "SELECT `content` FROM `memberships` WHERE `counselorid` = ? AND `isactive` = 1 ORDER BY `sortorder`;");
        $counselor->titles = $this->GetItemsByCounselorId($counselor->id, "SELECT `content` FROM `titles` WHERE `counselorid` = ? AND `isactive` = 1 ORDER BY `sortorder`;");
        return $counselor;
    }

    private function GetItemsByCounselorId($id, $sql) {
        try {
            $query = $this->db->prepare($sql);
            $query->execute(array($id));
            $allItems = $query->fetchAll(\PDO::FETCH_ASSOC);
            $results = array();
            foreach ($allItems as $item) {
                $results[] = $item["content"];
            }
            return $results;
        } catch (\PDOException $e) {
            exit($e->getMessage());
        }
    }

    public function find($id)
    {
        $statement = "
            SELECT
                `email`,
                `firstname`,
                `id`,
                `lastname`,
                `longdescription`,
                `phone`,
                `practitionerid`,
                `shortdescription`,
                `directoryid`
            FROM
                `counselor`
            WHERE `id` = ?
              AND `isactive` = 1;
        ";

        try {
            $statement = $this->db->prepare($statement);
            $statement->execute(array($id));
            $result = $statement->fetchAll(\PDO::FETCH_ASSOC);
            return ToCounselor($result);
        } catch (\PDOException $e) {
            exit($e->getMessage());
        }    
    }

    public function insert(Array $input)
    {
        $statement = "
            INSERT INTO person 
                (firstname, lastname, firstparent_id, secondparent_id)
            VALUES
                (:firstname, :lastname, :firstparent_id, :secondparent_id);
        ";

        try {
            $statement = $this->db->prepare($statement);
            $statement->execute(array(
                'firstname' => $input['firstname'],
                'lastname'  => $input['lastname'],
                'firstparent_id' => $input['firstparent_id'] ?? null,
                'secondparent_id' => $input['secondparent_id'] ?? null,
            ));
            return $statement->rowCount();
        } catch (\PDOException $e) {
            exit($e->getMessage());
        }    
    }

    public function update($id, Array $input)
    {
        $statement = "
            UPDATE person
            SET 
                firstname = :firstname,
                lastname  = :lastname,
                firstparent_id = :firstparent_id,
                secondparent_id = :secondparent_id
            WHERE id = :id;
        ";

        try {
            $statement = $this->db->prepare($statement);
            $statement->execute(array(
                'id' => (int) $id,
                'firstname' => $input['firstname'],
                'lastname'  => $input['lastname'],
                'firstparent_id' => $input['firstparent_id'] ?? null,
                'secondparent_id' => $input['secondparent_id'] ?? null,
            ));
            return $statement->rowCount();
        } catch (\PDOException $e) {
            exit($e->getMessage());
        }    
    }

    public function delete($id)
    {
        $statement = "
            DELETE FROM person
            WHERE id = :id;
        ";

        try {
            $statement = $this->db->prepare($statement);
            $statement->execute(array('id' => $id));
            return $statement->rowCount();
        } catch (\PDOException $e) {
            exit($e->getMessage());
        }    
    }
}

?>
