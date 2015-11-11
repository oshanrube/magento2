<?php
/**
 * Copyright © 2015 Magento. All rights reserved.
 * See COPYING.txt for license details.
 */
namespace Onic\Quote\Api\Data;

/**
 * Interface CartItemInterface
 * @api
 */
interface CartItemInterface extends \Magento\Quote\Api\Data\CartItemInterface
{


    const KEY_IMAGE = 'image';

    /**
     * Returns the product Image.
     * @return string|null Product Image. Otherwise, null.
     */
    public function getImage();

    /**
     * Sets the product Image.
     *
     * @param string $image
     * @return $this
     */
    public function setImage($image);
}
