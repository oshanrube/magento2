<?php

namespace Onic\NewsLetter\Api;

/**
 * Interface Subscribing email address
 *
 * @api
 */
interface NewsLetterInterface
{
    /**
     * Create new newsletter subscription for the given email address
     *
     * @param string $email
     * @return bool Success flag
     * @throws \Magento\Framework\Exception\AuthenticationException
     */
    public function createNewSubscription($email);
}