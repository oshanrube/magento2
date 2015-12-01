<?php

namespace SchumacherFM\AdvancedRESTPerms\Controller\Adminhtml\Integration;

use Magento\Backend\App\Action;
use Magento\Integration\Exception as IntegrationException;
use Magento\Integration\Model\IntegrationService;
use SchumacherFM\AdvancedRESTPerms\Service\V1\GuestAuthServiceInterface;

//use Magento\Authorization\Model\UserContextInterface;

class CreateGuest extends Action
{
    /** @var GuestAuthServiceInterface */
    protected $_guestAuthService = null;
    /** @var \Psr\Log\LoggerInterface */
    protected $_logger;
    /** @var \Magento\Backend\Helper\Data */
    protected $_coreHelper;
    /** @var \Magento\Framework\Escaper */
    protected $_escaper;
    /** @var IntegrationService */
    protected $_integrationFactory;

    /**
     * @param \Magento\Backend\App\Action\Context $context
     * @param \Psr\Log\LoggerInterface $logger
     * @param \Magento\Backend\Helper\Data $coreHelper
     * @param IntegrationService $integrationFactory
     * @param \Magento\Framework\Escaper $escaper
     * @param GuestAuthServiceInterface $guestAuthService
     */
    public function __construct(
        \Magento\Backend\App\Action\Context $context,
        \Psr\Log\LoggerInterface $logger,
        \Magento\Backend\Helper\Data $coreHelper,
        IntegrationService $integrationFactory,
        \Magento\Framework\Escaper $escaper,
        GuestAuthServiceInterface $guestAuthService
    )
    {
        parent::__construct($context);
        $this->_logger = $logger;
        $this->_coreHelper = $coreHelper;
        $this->_integrationFactory = $integrationFactory;
        $this->_escaper = $escaper;
        $this->_guestAuthService = $guestAuthService;
    }

    /**
     * Redirect merchant to 'Edit integration' or 'New integration' if error happened during integration save.
     *
     * @return void
     */
    protected function _redirectOnSaveError()
    {
        $this->_redirect('adminhtml/integration/index');

    }

    /**
     * Save integration action.
     *
     * @return void
     * @todo: Fix cyclomatic complexity.
     * @SuppressWarnings(PHPMD.CyclomaticComplexity)
     */
    public function execute()
    {
        try {
            $integrationData = [
                'name' => 'New Guest Access',
                'email' => '',
                'status' => 0,
                'consumer_id' => new \Zend_Db_Expr('NULL'),
                'setup_type' => '',
            ];

            // oauth not needed, bypass the service :-(
            /** @var \Magento\Integration\Model\Integration $integration */
            $integration = $this->_integrationFactory->create($integrationData);
            $integration->save();
            $resources = [
                'Magento_Catalog::catalog',
                'Magento_Catalog::catalog_inventory',
                'Magento_Catalog::products',
                'Magento_Catalog::categories',
                'Magento_Cms::block'
            ];
            $this->_guestAuthService->grantPermissions($integration->getId(), $resources);

            $this->messageManager->addSuccess(
                __(
                    'The integration \'%1\' has been created.',
                    $this->_escaper->escapeHtml($integration->getName())
                )
            );

            $this->_redirect('adminhtml/integration/index');
        } catch (IntegrationException $e) {
            $this->messageManager->addError($this->_escaper->escapeHtml($e->getMessage()));
            $this->_getSession()->setIntegrationData($integrationData);
            $this->_redirectOnSaveError();
        } catch (\Magento\Framework\Model\Exception $e) {
            $this->messageManager->addError($this->_escaper->escapeHtml($e->getMessage()));
            $this->_redirectOnSaveError();
        } catch (\Exception $e) {
            $this->_logger->critical($e);
            $this->messageManager->addError($this->_escaper->escapeHtml($e->getMessage()));
            $this->_redirectOnSaveError();
        }
    }
}
