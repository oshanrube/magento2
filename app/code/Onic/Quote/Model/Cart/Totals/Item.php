<?php
namespace Onic\Quote\Model\Cart\Totals;

use Magento\Quote\Api\Data\TotalsItemInterface;
use Magento\Framework\Api\AbstractExtensibleObject;

/**
 * Cart item totals.
 *
 * @codeCoverageIgnore
 */
class Item extends \Magento\Quote\Model\Cart\Totals\Item
{
    public function getCustomAttributes()
    {
        echo "";
    }

    public function setCustomAttribute($attributeCode, $attributeValue)
    {
        echo "";
    }
}
