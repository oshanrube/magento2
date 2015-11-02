<?php

namespace Onic\NewsLetter\Api;

class NewsLetter
{
    public function createNew()
    {
        exit('asdasd');
        if ($this->getRequest()->isPost() && $this->getRequest()->getPost('email'))
        {
            $email = (string)$this->getRequest()->getPost('email');

            try
            {
                $this->validateEmailFormat($email);
                $this->validateGuestSubscription();
                $this->validateEmailAvailable($email);

                $status = $this->_subscriberFactory->create()->subscribe($email);
                if ($status == \Magento\Newsletter\Model\Subscriber::STATUS_NOT_ACTIVE)
                {
                    $this->messageManager->addSuccess(__('The confirmation request has been sent.'));
                }

                else
                {
                    $this->messageManager->addSuccess(__('Thank you for your subscription.'));
                }
            }
            catch (\Magento\Framework\Exception\LocalizedException $e)
            {
                $this->messageManager->addException($e, __('There was a problem with the subscription: %1', $e->getMessage()));
            }
            catch (\Exception $e)
            {
                $this->messageManager->addException($e, __('Something went wrong with the subscription.'));
            }
        }
    }
}