<?php

class DomainModel extends BaseModel
{
    protected $id = 'domainid';
    protected $table = 'domains';

    public function create($array)
    {
        list($domainname, $tld) = explode('.', $array['domainname'], 2);
        $tldinfo = $this->di->TldModel->getTld($tld, $this->parentid);
        $array['renew'] = 1;
        $array['supplier'] = $tldinfo['supplier'];
        $array['startdate'] = date('Y-m-d');
        $array['enddate'] = date('Y-m-d', strtotime('-1 day', strtotime('+1 year')));
        $array['renewdate'] = $array['enddate'];
        $domainid = parent::create($array);
        $this->di->ProductModel->create([
            'clientid' => $this->parentid,
            'type' => 2,
            'typeid' => $domainid,
            'invoiceline' => "Domeinnaam: {$array['domainname']} 1 Jaar",
            'startdate' => $array['startdate'],
            'enddate' => $array['enddate'],
            'renew' => $array['renew'],
            'price' => $tldinfo['price'],
        ]);
        $this->session->message = "Domeinnaam {$array['domainname']} geregistreerd";
        RedirectHelper::redirect("/admin/clienten/edit/{$this->parentid}");
    }

    public function list($table = null, $id = null)
    {
        $q = "SELECT * FROM `domains` INNER JOIN `clients` ON `domains`.`clientid` = `clients`.`clientid`";
        $this->page->partial(($table ?: 'list'), $q);
    }
}