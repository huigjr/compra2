<?php

class ProductModel extends BaseModel
{
    protected $id = 'productid';
    protected $table = 'products';
    
    const PRODUCTTYPES = ['services' => 1, 'domains' => 2];
}