<?php

class TldModel extends BaseModel
{
    protected $id = 'tldid';
    protected $table = 'tlds';
    
    public function getTld($tld, $parentid)
    {
        $row = $this->db->read($this->table, 'tld', $tld);
        if($row) return $row;
        else {
            $this->session->error = 'Er is geen provider voor dit TLD.';
            RedirectHelper::redirect("/admin/clienten/edit/{$parentid}");
        }
    }
}