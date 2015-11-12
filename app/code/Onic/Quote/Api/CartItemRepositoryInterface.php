<?php
namespace Onic\Quote\Api;

/**
 * Interface CartItemRepositoryInterface
 * @api
 */
interface CartItemRepositoryInterface extends \Magento\Quote\Api\CartItemRepositoryInterface
{
    /**
     * Lists items that are assigned to a specified cart.
     *
     * @param int $cartId The cart ID.
     * @return \Onic\Quote\Api\Data\CartItemInterface[] Array of items.
     * @throws \Magento\Framework\Exception\NoSuchEntityException The specified cart does not exist.
     */
    public function getList($cartId);

}
