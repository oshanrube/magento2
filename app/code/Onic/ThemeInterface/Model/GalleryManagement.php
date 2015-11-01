<?php

namespace Onic\ThemeInterface\Model;

use Magento\Catalog\Api\Data\ProductAttributeMediaGalleryEntryInterface;
use Magento\Catalog\Api\Data\ProductInterface as Product;
use Magento\Framework\Exception\InputException;
use Magento\Framework\Exception\NoSuchEntityException;
use Magento\Framework\Exception\StateException;
use Magento\Framework\Api\ImageContentValidatorInterface;
use Magento\Catalog\Helper\ImageFactory as HelperFactory;

class GalleryManagement extends \Magento\Catalog\Model\Product\Gallery\GalleryManagement
{


    /**
     * @var array
     */
    protected $attributes = [];

    /**
     * @var HelperFactory
     */
    protected $helperFactory;

    /**
     * {@inheritdoc}
     */
    public function __construct(\Magento\Store\Model\StoreManagerInterface $storeManager, \Magento\Catalog\Api\ProductRepositoryInterface $productRepository, ImageContentValidatorInterface $contentValidator, HelperFactory $helperFactory)
    {
        $this->helperFactory = $helperFactory;
        parent::__construct($storeManager, $productRepository, $contentValidator);
    }


    /**
     * Calculate image ratio
     * @param \Magento\Catalog\Helper\Image $helper
     * @return float|int
     */
    protected function getRatio(\Magento\Catalog\Helper\Image $helper)
    {
        $width  = $helper->getWidth();
        $height = $helper->getHeight();
        if ($width && $height)
        {
            return $height / $width;
        }
        return 1;
    }

    /**
     * Retrieve image custom attributes for HTML element
     * @return string
     */
    protected function getCustomAttributes()
    {
        $result = [];
        foreach ($this->attributes as $name => $value)
        {
            $result[] = $name . '="' . $value . '"';
        }
        return !empty($result) ? implode(' ', $result) : '';
    }

    /**
     * Return information about gallery entry
     * @param string $sku
     * @param int    $entryId
     * @param int    $width
     * @param int    $height
     * @throws \Magento\Framework\Exception\NoSuchEntityException
     * @return array
     */
    public function getImage($sku, $entryId, $width, $height)
    {
        try
        {
            $product = $this->productRepository->get($sku);
        }
        catch (\Exception $exception)
        {
            throw new NoSuchEntityException(__('Such product doesn\'t exist'));
        }
        /** @var \Magento\Catalog\Helper\Image $helper */
        $helper = $this->helperFactory->create()->init($product, 'new_products_content_widget_grid', array('type' => 'image', 'width' => $width, 'height' => $height));

        $template = $helper->getFrame() ? 'Magento_Catalog::product/image.phtml' : 'Magento_Catalog::product/image_with_borders.phtml';
        $imagesize = $helper->getResizedImageInfo();

        $data = ['data' => ['template' => $template, 'image_url' => $helper->getUrl(), 'width' => $helper->getWidth(), 'height' => $helper->getHeight(), 'label' => $helper->getLabel(), 'ratio' => $this->getRatio($helper), 'custom_attributes' => $this->getCustomAttributes(), 'resized_image_width' => !empty($imagesize[0]) ? $imagesize[0] : $helper->getWidth(), 'resized_image_height' => !empty($imagesize[1]) ? $imagesize[1] : $helper->getHeight(),],];
        return $data;
    }
}
