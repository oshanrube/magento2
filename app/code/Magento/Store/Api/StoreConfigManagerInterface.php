<?php
/**
 * copyright © 2015 magento. all rights reserved.
 * see copying.txt for license details.
 */
namespace magento\Store\Api;

use magento\Framework\Exception\Nosuchentityexception;
use magento\Store\Model\Storeisinactiveexception;

/**
 * store config manager interface
 *
 * @api
 */
interface storeconfigmanagerinterface
{
    /**
     * @param string[] $storecodes
     * @return \Magento\Store\Api\Data\Storeconfiginterface[]
     */
    public function getstoreconfigs(array $storecodes = null);
}
