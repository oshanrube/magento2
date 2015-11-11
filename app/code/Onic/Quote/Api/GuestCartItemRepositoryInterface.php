<?php
namespace Onic\Quote\Api;

/**
 * Cart Item repository interface for guest carts.
 * @api
 */
interface GuestCartItemRepositoryInterface extends \Magento\Quote\Api\GuestCartItemRepositoryInterface
{
    /**
     * List items that are assigned to a specified cart.
     *
     * @param string $cartId The cart ID.
     * @return \Onic\Quote\Api\Data\CartItemInterface[] Array of items.
     * @throws \Magento\Framework\Exception\NoSuchEntityException The specified cart does not exist.
     */
    public function getList($cartId);

}
