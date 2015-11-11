<?php

namespace Onic\NewsLetter\Model;

use Magento\Customer\Api\AccountManagementInterface as CustomerAccountManagement;
use Magento\Customer\Model\Session;
use Magento\Customer\Model\Url as CustomerUrl;
use Magento\Framework\App\Action\Context;
use Magento\Store\Model\StoreManagerInterface;
use Magento\Newsletter\Model\SubscriberFactory;

class NewsLetter implements \Onic\NewsLetter\Api\NewsLetterInterface
{

    /**
     * @var CustomerAccountManagement
     */
    protected $customerAccountManagement;

    /**
     * Customer session
     * @var Session
     */
    protected $_customerSession;

    /**
     * Subscriber factory
     * @var SubscriberFactory
     */
    protected $_subscriberFactory;

    /**
     * @var \Magento\Store\Model\StoreManagerInterface
     */
    protected $_storeManager;

    /**
     * @var CustomerUrl
     */
    protected $_customerUrl;

    /**
     * Initialize dependencies.
     * @param Context                   $context
     * @param SubscriberFactory         $subscriberFactory
     * @param Session                   $customerSession
     * @param StoreManagerInterface     $storeManager
     * @param CustomerUrl               $customerUrl
     * @param CustomerAccountManagement $customerAccountManagement
     */
    public function __construct(Context $context, SubscriberFactory $subscriberFactory, Session $customerSession, StoreManagerInterface $storeManager, CustomerUrl $customerUrl, CustomerAccountManagement $customerAccountManagement)
    {
        $this->customerAccountManagement = $customerAccountManagement;

        $this->_storeManager      = $storeManager;
        $this->_subscriberFactory = $subscriberFactory;
        $this->_customerSession   = $customerSession;
        $this->_customerUrl       = $customerUrl;
        $this->_objectManager     = $context->getObjectManager();
    }

    /**
     * Validates that the email address isn't being used by a different account.
     * @param string $email
     * @throws \Magento\Framework\Exception\LocalizedException
     * @return void
     */
    protected function validateEmailAvailable($email)
    {
        $websiteId = $this->_storeManager->getStore()->getWebsiteId();
        if ($this->_customerSession->getCustomerDataObject()->getEmail() !== $email && !$this->customerAccountManagement->isEmailAvailable($email, $websiteId)
        )
        {
            throw new \Magento\Framework\Exception\LocalizedException(__('This email address is already assigned to another user.'));
        }
    }

    /**
     * Validates that if the current user is a guest, that they can subscribe to a newsletter.
     * @throws \Magento\Framework\Exception\LocalizedException
     * @return void
     */
    protected function validateGuestSubscription()
    {
        if ($this->_objectManager->get('Magento\Framework\App\Config\ScopeConfigInterface')->getValue(\Magento\Newsletter\Model\Subscriber::XML_PATH_ALLOW_GUEST_SUBSCRIBE_FLAG, \Magento\Store\Model\ScopeInterface::SCOPE_STORE) != 1 && !$this->_customerSession->isLoggedIn()
        )
        {
            throw new \Magento\Framework\Exception\LocalizedException(__('Sorry, but the administrator denied subscription for guests. Please <a href="%1">register</a>.', $this->_customerUrl->getRegisterUrl()));
        }
    }

    /**
     * Validates the format of the email address
     * @param string $email
     * @throws \Magento\Framework\Exception\LocalizedException
     * @return void
     */
    protected function validateEmailFormat($email)
    {
        if (!\Zend_Validate::is($email, 'EmailAddress'))
        {
            throw new \Magento\Framework\Exception\LocalizedException(__('Please enter a valid email address.' . $email));
        }
    }

    /**
     * {@inheritdoc}
     */
    public function createNewSubscription($email)
    {
        $this->validateEmailFormat($email);
        $this->validateGuestSubscription();
        $this->validateEmailAvailable($email);

        $status = $this->_subscriberFactory->create()->subscribe($email);
        return ($status == \Magento\Newsletter\Model\Subscriber::STATUS_SUBSCRIBED);
    }
}