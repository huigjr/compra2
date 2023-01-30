<?php

class HomeController extends BaseController
{
    protected $view = 'default.html';

    public function init()
    {
        $this->di->PageModel->read(1);
    }
}