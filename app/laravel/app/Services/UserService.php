<?php

namespace App\Services;

class UserService
{
    /**
     * @return int
     */
    public function somme(int $a, int $b = 10, int $c = 0): int
    {
        return $c === 0 ? 0 : ($a + $b + $c); 
    }
}