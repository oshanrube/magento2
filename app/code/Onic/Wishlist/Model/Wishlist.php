<?php

namespace Onic\Wishlist\Model;


use Magento\Catalog\Api\ProductRepositoryInterface;
use Magento\Framework\Exception\NotFoundException;
use Magento\Framework\Exception\NoSuchEntityException;

class Wishlist implements \Onic\Wishlist\Api\WishlistInterface
{
    /**
     * @var \Magento\Wishlist\Controller\WishlistProviderInterface
     */
    protected $wishlistProvider;

    /**
     * @param \Magento\Customer\Model\Session                        $customerSession
     * @param \Magento\Wishlist\Controller\WishlistProviderInterface $wishlistProvider
     * @param ProductRepositoryInterface                             $productRepository
     */
    public function __construct(
        \Magento\Customer\Model\Session $customerSession,
        \Magento\Wishlist\Controller\WishlistProviderInterface $wishlistProvider,
        ProductRepositoryInterface $productRepository
    )
    {
        $this->_customerSession  = $customerSession;
        $this->wishlistProvider  = $wishlistProvider;
        $this->productRepository = $productRepository;
    }

    /**
     * {@inheritdoc}
     */
    public function add($productId)
    {
        $wishlist = $this->wishlistProvider->getWishlist();
        if (!$wishlist)
        {
            throw new NotFoundException(__('Page not found.'));
        }

        $session = $this->_customerSession;
        if ($session->getBeforeWishlistRequest())
        {
            $requestParams = $session->getBeforeWishlistRequest();
            $session->unsBeforeWishlistRequest();
        }

        if (!$productId)
        {
            throw new NotFoundException(__('Product not found.'));
        }

        try
        {
            $product = $this->productRepository->getById($productId);
        }
        catch (NoSuchEntityException $e)
        {
            $product = null;
        }

        if (!$product || !$product->isVisibleInCatalog())
        {
            throw new NotFoundException(__('We can\'t specify a product.'));
        }

        try
        {
            $result = $wishlist->addNewItem($product);
            if (is_string($result))
            {
                throw new \Magento\Framework\Exception\LocalizedException(__($result));
            }
            $wishlist->save();

            $this->_eventManager->dispatch(
                'wishlist_add_product',
                ['wishlist' => $wishlist, 'product' => $product, 'item' => $result]
            );

            $referer = $session->getBeforeWishlistUrl();
            if ($referer)
            {
                $session->setBeforeWishlistUrl(null);
            }
            else
            {
                $referer = $this->_redirect->getRefererUrl();
            }

            $this->_objectManager->get('Magento\Wishlist\Helper\Data')->calculate();
            return true;
        }
        catch (\Magento\Framework\Exception\LocalizedException $e)
        {
            throw new \Exception(__('We can\'t add the item to Wish List right now: %1.', $e->getMessage()));
        }
        catch (\Exception $e)
        {
            throw new \Exception(__('We can\'t add the item to Wish List right now.'));
        }
        return false;
    }
}