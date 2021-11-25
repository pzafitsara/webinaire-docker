<?php

namespace Tests\Unit;

use App\Services\UserService;
use PHPUnit\Framework\TestCase;

class UserServiceTest extends TestCase
{
    /**
     * A basic test example.
     *
     * @return void
     */
    public function test_somme()
    {
        $service = new UserService();
        // Code PHP < 8
        $somme = $service->somme(10,10,10); 
        $this->assertEquals(30, $somme);

        // Code PHP >= 8
        $somme = $service->somme(10,10, 10);
        $this->assertEquals(30, $somme);
    }
}