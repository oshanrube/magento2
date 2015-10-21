<?php
/**
 * Copyright © 2015 Magento. All rights reserved.
 * See COPYING.txt for license details.
 */
namespace Magento\TestModule1\Controller\CookieTester;

use \Magento\Framework\App\RequestInterface;

/**
 */
class SetSensitiveCookie extends \Magento\TestModule1\Controller\CookieTester
{
    /**
     * Sets a sensitive cookie with data from url parameters
     *
     * @return void
     */
    public function execute(RequestInterface $request)
    {
        $sensitiveCookieMetadata = $this->getCookieMetadataFactory()->createSensitiveCookieMetadata();

        $cookieDomain = $request->getParam('cookie_domain');
        if ($cookieDomain !== null) {
            $sensitiveCookieMetadata->setDomain($cookieDomain);
        }
        $cookiePath = $request->getParam('cookie_domain');
        if ($cookiePath !== null) {
            $sensitiveCookieMetadata->setPath($cookiePath);
        }

        $cookieName = $request->getParam('cookie_name');
        $cookieValue = $request->getParam('cookie_value');
        $this->getCookieManager()->setSensitiveCookie($cookieName, $cookieValue, $sensitiveCookieMetadata);
    }
}
