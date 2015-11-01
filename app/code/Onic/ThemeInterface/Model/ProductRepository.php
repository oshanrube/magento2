<?php
namespace Onic\ThemeInterface\Model;

use Magento\Catalog\Api\Data\ProductInterface;
use Magento\Catalog\Model\Product\Gallery\MimeTypeExtensionMap;
use Magento\Catalog\Model\ResourceModel\Product\Collection;
use Magento\Catalog\Test\Fixture\CatalogProductSimple\CustomAttribute;
use Magento\Framework\Api\Data\ImageContentInterface;
use Magento\Framework\Api\Data\ImageContentInterfaceFactory;
use Magento\Framework\Api\ImageContentValidatorInterface;
use Magento\Framework\Api\ImageProcessorInterface;
use Magento\Framework\Api\SortOrder;
use Magento\Framework\Exception\InputException;
use Magento\Framework\Exception\NoSuchEntityException;
use Magento\Framework\Exception\StateException;
use Magento\Catalog\Model\ProductFactory;
use Magento\Catalog\Helper\ImageFactory as HelperFactory;

class ProductRepository extends \Magento\Catalog\Model\ProductRepository
{

    /**
     * @var HelperFactory
     */
    protected $helperFactory;

    /**
     * {@inheritdoc}
     */
    public function __construct(ProductFactory $productFactory, \Magento\Catalog\Controller\Adminhtml\Product\Initialization\Helper $initializationHelper, \Magento\Catalog\Api\Data\ProductSearchResultsInterfaceFactory $searchResultsFactory, \Magento\Catalog\Model\ResourceModel\Product\CollectionFactory $collectionFactory, \Magento\Framework\Api\SearchCriteriaBuilder $searchCriteriaBuilder, \Magento\Catalog\Api\ProductAttributeRepositoryInterface $attributeRepository, \Magento\Catalog\Model\ResourceModel\Product $resourceModel, \Magento\Catalog\Model\Product\Initialization\Helper\ProductLinks $linkInitializer, \Magento\Catalog\Model\Product\LinkTypeProvider $linkTypeProvider, \Magento\Store\Model\StoreManagerInterface $storeManager, \Magento\Framework\Api\FilterBuilder $filterBuilder, \Magento\Catalog\Api\ProductAttributeRepositoryInterface $metadataServiceInterface, \Magento\Framework\Api\ExtensibleDataObjectConverter $extensibleDataObjectConverter, \Magento\Catalog\Model\Product\Option\Converter $optionConverter, \Magento\Framework\Filesystem $fileSystem, ImageContentValidatorInterface $contentValidator, ImageContentInterfaceFactory $contentFactory, MimeTypeExtensionMap $mimeTypeExtensionMap, ImageProcessorInterface $imageProcessor, \Magento\Framework\Api\ExtensionAttribute\JoinProcessorInterface $extensionAttributesJoinProcessor, HelperFactory $helperFactory)
    {
        $this->helperFactory = $helperFactory;
        parent::__construct($productFactory, $initializationHelper, $searchResultsFactory, $collectionFactory, $searchCriteriaBuilder, $attributeRepository, $resourceModel, $linkInitializer, $linkTypeProvider, $storeManager, $filterBuilder, $metadataServiceInterface, $extensibleDataObjectConverter, $optionConverter, $fileSystem, $contentValidator, $contentFactory, $mimeTypeExtensionMap, $imageProcessor, $extensionAttributesJoinProcessor);
    }

    /**
     * {@inheritdoc}
     */
    public function getList(\Magento\Framework\Api\SearchCriteriaInterface $searchCriteria)
    {
        $width        = 180;
        $height       = 240;
        $searchResult = parent::getList($searchCriteria);
        $items        = array();
        foreach ($searchResult->getItems() as $item)
        {
            $item->getProductLinks();
            $item->getTierPrices();
            /** @var \Magento\Catalog\Helper\Image $helper */
            $helper = $this->helperFactory->create()->init($item, 'new_products_content_widget_grid', array('type' => 'image', 'width' => $width, 'height' => $height));
            $image  = $item->getCustomAttribute('small_image');
            $image->setValue($helper->getUrl());
            $items[] = $item;
        }
        $searchResult->setItems($items);
        return $searchResult;
    }
}
