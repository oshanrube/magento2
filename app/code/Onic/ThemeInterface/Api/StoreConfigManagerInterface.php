<?php
namespace Onic\ThemeInterface\Api;

use Magento\Framework\Exception\NoSuchEntityException;
use Magento\Store\Model\StoreIsInactiveException;

/**
 * Store config manager interface
 *
 * @api
 */
interface StoreConfigManagerInterface
{
    /**
     * @param string[] $storeCodes
     * @return \Onic\ThemeInterface\Api\Data\StoreConfigInterface[]
     */
    public function getStoreConfigs(array $storeCodes = null);
}
