<?php

class ClientModel extends BaseModel
{
    protected $id = 'clientid';
    protected $table = 'clients';

    public function read($value, $column = null)
    {
        $this->page->partial('list', "SELECT * FROM `products`");
        parent::read($value);
    }
}