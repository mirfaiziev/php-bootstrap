<?php
namespace App\Test;

use PHPUnit\Framework\TestCase;
use App\Hello;

final class HelloTest extends TestCase
{
  function testWord() {
    $this->assertEquals("Hello word\n", (new Hello())->word());
  }
}