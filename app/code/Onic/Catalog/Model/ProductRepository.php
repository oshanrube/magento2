<?php
namespace Onic\Catalog\Model;

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
use Magento\Catalog\Model\Product\ImageFactory;


class ProductRepository extends \Magento\Catalog\Model\ProductRepository
{

    /**
     * @var HelperFactory
     */
    protected $helperFactory;

    /**
     * Product image factory
     * @var \Magento\Catalog\Model\Product\ImageFactory
     */
    protected $_productImageFactory;

    /**
     * {@inheritdoc}
     */
    public function __construct(ProductFactory $productFactory, \Magento\Catalog\Controller\Adminhtml\Product\Initialization\Helper $initializationHelper, \Magento\Catalog\Api\Data\ProductSearchResultsInterfaceFactory $searchResultsFactory, \Magento\Catalog\Model\ResourceModel\Product\CollectionFactory $collectionFactory, \Magento\Framework\Api\SearchCriteriaBuilder $searchCriteriaBuilder, \Magento\Catalog\Api\ProductAttributeRepositoryInterface $attributeRepository, \Magento\Catalog\Model\ResourceModel\Product $resourceModel, \Magento\Catalog\Model\Product\Initialization\Helper\ProductLinks $linkInitializer, \Magento\Catalog\Model\Product\LinkTypeProvider $linkTypeProvider, \Magento\Store\Model\StoreManagerInterface $storeManager, \Magento\Framework\Api\FilterBuilder $filterBuilder, \Magento\Catalog\Api\ProductAttributeRepositoryInterface $metadataServiceInterface, \Magento\Framework\Api\ExtensibleDataObjectConverter $extensibleDataObjectConverter, \Magento\Catalog\Model\Product\Option\Converter $optionConverter, \Magento\Framework\Filesystem $fileSystem, ImageContentValidatorInterface $contentValidator, ImageContentInterfaceFactory $contentFactory, MimeTypeExtensionMap $mimeTypeExtensionMap, ImageProcessorInterface $imageProcessor, \Magento\Framework\Api\ExtensionAttribute\JoinProcessorInterface $extensionAttributesJoinProcessor, HelperFactory $helperFactory, ImageFactory $productImageFactory)
    {
        $this->_productImageFactory = $productImageFactory;
        $this->helperFactory        = $helperFactory;
        parent::__construct($productFactory, $initializationHelper, $searchResultsFactory,
            $collectionFactory, $searchCriteriaBuilder, $attributeRepository, $resourceModel, $linkInitializer,
            $linkTypeProvider, $storeManager, $filterBuilder, $metadataServiceInterface, $extensibleDataObjectConverter,
            $optionConverter, $fileSystem, $contentValidator, $contentFactory, $mimeTypeExtensionMap, $imageProcessor, $extensionAttributesJoinProcessor);
    }

    public function get($sku, $editMode = false, $storeId = null, $forceReload = false)
    {
        $object = parent::get($sku, $editMode, $storeId, $forceReload);
        $media_gallery = $object->getMediaGalleryEntries();
        foreach ($media_gallery as &$media_entry)
        {
            $model = $this->_productImageFactory->create();
            $model->setDestinationSubdir('image');
            $images              = array();
            $images['original']  = $model->setBaseFile($media_entry->getFile())->saveFile()->getUrl();
            $images['large']     = $model->setSize('370x463')->setBaseFile($media_entry->getFile())->resize()->saveFile()->getUrl();
            $images['medium']    = $model->setSize('370x463')->setBaseFile($media_entry->getFile())->resize()->saveFile()->getUrl();
            $images['small']     = $model->setSize('180x240')->setBaseFile($media_entry->getFile())->resize()->saveFile()->getUrl();
            $images['thumbnail'] = $model->setSize('50x67')->setBaseFile($media_entry->getFile())->resize()->saveFile()->getUrl();

            $media_entry->setFile($images);

        }
        $object->setMediaGalleryEntries($media_gallery);

        return $object;
    }

    /**
     * {@inheritdoc}
     */
    public function getList(\Magento\Framework\Api\SearchCriteriaInterface $searchCriteria)
    {
        $searchResult = parent::getList($searchCriteria);
        $items        = array();
        foreach ($searchResult->getItems() as $item)
        {
            $item->load($item->getId());
            $item->getProductLinks();
            $item->getTierPrices();

            $model = $this->_productImageFactory->create();
            $model->setDestinationSubdir('image');

            $images              = array();
            $images['original']  = $model->setBaseFile($item->getImage())->saveFile()->getUrl();
            $images['large']     = $model->setSize('370x463')->setBaseFile($item->getImage())->resize()->saveFile()->getUrl();
            $images['medium']    = $model->setSize('370x463')->setBaseFile($item->getImage())->resize()->saveFile()->getUrl();
            $images['small']     = $model->setSize('180x240')->setBaseFile($item->getImage())->resize()->saveFile()->getUrl();
            $images['thumbnail'] = $model->setSize('50x67')->setBaseFile($item->getImage())->resize()->saveFile()->getUrl();
            $item->setImage($images);

            $media_gallery = $item->getMediaGalleryEntries();
            foreach ($media_gallery as &$media_entry)
            {
                $model = $this->_productImageFactory->create();
                $model->setDestinationSubdir('image');
                $images              = array();
                $images['original']  = $model->setBaseFile($media_entry->getFile())->saveFile()->getUrl();
                $images['large']     = $model->setSize('370x463')->setBaseFile($media_entry->getFile())->resize()->saveFile()->getUrl();
                $images['medium']    = $model->setSize('370x463')->setBaseFile($media_entry->getFile())->resize()->saveFile()->getUrl();
                $images['small']     = $model->setSize('180x240')->setBaseFile($media_entry->getFile())->resize()->saveFile()->getUrl();
                $images['thumbnail'] = $model->setSize('50x67')->setBaseFile($media_entry->getFile())->resize()->saveFile()->getUrl();

                $media_entry->setFile($images);
            }
            $item->setMediaGalleryEntries($media_gallery);

            $items[] = $item;
        }
        $searchResult->setItems($items);
        return $searchResult;
    }
}
