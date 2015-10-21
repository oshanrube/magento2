<?php
/**
 * Copyright © 2015 Magento. All rights reserved.
 * See COPYING.txt for license details.
 */

namespace Magento\Backend\Test\Unit\Console\Command;

use Magento\Backend\Console\Command\CacheDisableCommand;
use Symfony\Component\Console\Tester\CommandTester;

class CacheDisableCommandTest extends AbstractCacheSetCommandTest
{
    public function setUp()
    {
        parent::setUp();
        $this->command = new CacheDisableCommand($this->cacheManager);
    }

    /**
     * @param array $param
     * @param array $enable
     * @param array $result
     * @param string $output
     * @dataProvider testExecuteDataProvider
     */
    public function testExecute($param, $enable, $result, $output)
    {
        $this->cacheManager->expects($this->once())->method('getAvailableTypes')->willReturn(['A', 'B', 'C']);
        $this->cacheManager->expects($this->once())->method('setEnabled')->with($enable, false)->willReturn($result);

        $commandTester = new CommandTester($this->command);
        $commandTester->execute($param);

        $this->assertEquals($output, $commandTester->getDisplay());
    }

    /**
     * {@inheritdoc}
     */
    public function getExpectedExecutionOutput(array $changes)
    {
        return $this->getExpectedChangeOutput($changes, false);
    }
}
