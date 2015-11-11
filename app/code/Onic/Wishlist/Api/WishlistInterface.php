<?php

namespace Onic\Wishlist\Api;

/**
 * Interface Subscribing email address
 *
 * @api
 */
interface WishlistInterface
{
    /**
     * Add product to wishlist
     *
     * @param string $product_id
     * @return bool Success flag
     * @throws \Magento\Framework\Exception\AuthenticationException
     */
    public function add($product_id);
}