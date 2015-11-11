<?php
namespace Onic\Quote\Model\Quote;

use Magento\Framework\Api\AttributeValueFactory;
use Magento\Framework\Api\ExtensionAttributesFactory;
use Magento\Catalog\Helper\ImageFactory as HelperFactory;

class Item extends \Magento\Quote\Model\Quote\Item implements \Onic\Quote\Api\Data\CartItemInterface
{

    /**
     * @var HelperFactory
     */
    protected $helperFactory;

    /**
     * @param \Magento\Framework\Model\Context                        $context
     * @param \Magento\Framework\Registry                             $registry
     * @param ExtensionAttributesFactory                              $extensionFactory
     * @param AttributeValueFactory                                   $customAttributeFactory
     * @param \Magento\Catalog\Api\ProductRepositoryInterface         $productRepository
     * @param \Magento\Framework\Pricing\PriceCurrencyInterface       $priceCurrency
     * @param \Magento\Sales\Model\Status\ListFactory                 $statusListFactory
     * @param \Magento\Framework\Locale\FormatInterface               $localeFormat
     * @param \Magento\Quote\Model\Quote\Item\OptionFactory           $itemOptionFactory
     * @param \Magento\Quote\Model\Quote\Item\Compare                 $quoteItemCompare
     * @param \Magento\CatalogInventory\Api\StockRegistryInterface    $stockRegistry
     * @param \Magento\Framework\Model\ModelResource\AbstractResource $resource
     * @param \Magento\Framework\Data\Collection\AbstractDb           $resourceCollection
     * @param array                                                   $data
     * @SuppressWarnings(PHPMD.ExcessiveParameterList)
     */
    public function __construct(
        \Magento\Framework\Model\Context $context,
        \Magento\Framework\Registry $registry,
        ExtensionAttributesFactory $extensionFactory,
        AttributeValueFactory $customAttributeFactory,
        \Magento\Catalog\Api\ProductRepositoryInterface $productRepository,
        \Magento\Framework\Pricing\PriceCurrencyInterface $priceCurrency,
        \Magento\Sales\Model\Status\ListFactory $statusListFactory,
        \Magento\Framework\Locale\FormatInterface $localeFormat,
        \Magento\Quote\Model\Quote\Item\OptionFactory $itemOptionFactory,
        \Magento\Quote\Model\Quote\Item\Compare $quoteItemCompare,
        \Magento\CatalogInventory\Api\StockRegistryInterface $stockRegistry,
        HelperFactory $helperFactory,
        \Magento\Framework\Model\ModelResource\AbstractResource $resource = null,
        \Magento\Framework\Data\Collection\AbstractDb $resourceCollection = null,
        array $data = []
    )
    {
        $this->helperFactory = $helperFactory;
        parent::__construct(
            $context,
            $registry,
            $extensionFactory,
            $customAttributeFactory,
            $productRepository,
            $priceCurrency,
            $statusListFactory,
            $localeFormat,
            $itemOptionFactory,
            $quoteItemCompare,
            $stockRegistry,
            $resource,
            $resourceCollection,
            $data);
    }

    /**
     * {@inheritdoc}
     */
    public function getImage()
    {
        return $this->getData(self::KEY_IMAGE);
    }

    /**
     * {@inheritdoc}
     */
    public function setImage($image)
    {
        return $this->setData(self::KEY_IMAGE, $image);
    }

    /**
     * Setup product for quote item
     * @param \Magento\Catalog\Model\Product $product
     * @return $this
     */
    public function setProduct($product)
    {
        //init custom attributes
        $custom_attributes = $this->getCustomAttributes();
        //image size for nav cart
        $width  = 50;
        $height = 67;

        parent::setProduct($product);
        /** @var \Magento\Catalog\Helper\Image $helper */
        $helper = $this->helperFactory->create()->init($product, 'new_products_content_widget_grid', array('type' => 'thumbnail', 'width' => $width, 'height' => $height));
        $this->setImage($helper->getUrl());
        if (count($custom_attributes) == 0)
        {
            //remove it from the dataset
            unset($this->_data[self::CUSTOM_ATTRIBUTES]);
        }
        return $this;
    }
}
