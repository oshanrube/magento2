<?php

namespace Onic\ProductUpdate\Console\Command;

use Magento\Catalog\Api\ProductRepositoryInterface;
use Magento\Catalog\Model\Product;
use Magento\Catalog\Model\Product\Image\Cache as ImageCache;
use Magento\Catalog\Model\Product\Image\CacheFactory as ImageCacheFactory;
use Magento\Catalog\Model\ResourceModel\Product\Collection as ProductCollection;
use Magento\Catalog\Model\ResourceModel\Product\CollectionFactory as ProductCollectionFactory;
use Magento\Framework\App\State as AppState;
use Magento\Framework\Exception\NoSuchEntityException;
use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;

/**
 * Command for updating products
 */
class ProductUpdateCommand extends Command
{
    /**
     * @var AppState
     */
    protected $appState;

    /**
     * @var ProductCollectionFactory
     */
    protected $productCollectionFactory;

    /**
     * @var ProductRepositoryInterface
     */
    protected $productRepository;

    /**
     * @var ImageCacheFactory
     */
    protected $imageCacheFactory;

    /**
     * @param AppState                   $appState
     * @param ProductCollectionFactory   $productCollectionFactory
     * @param ProductRepositoryInterface $productRepository
     * @param ImageCacheFactory          $imageCacheFactory
     */
    public function __construct(AppState $appState, ProductCollectionFactory $productCollectionFactory, ProductRepositoryInterface $productRepository, ImageCacheFactory $imageCacheFactory)
    {
        $this->appState                 = $appState;
        $this->productCollectionFactory = $productCollectionFactory;
        $this->productRepository        = $productRepository;
        $this->imageCacheFactory        = $imageCacheFactory;
        parent::__construct();
    }


    /**
     * {@inheritdoc}
     */
    protected function configure()
    {
        $this->setName('onic:product:update');
        $this->setDescription('Update product image(s)');
//        $this->addOption(self::INPUT_KEY_BOOTSTRAP, null, InputOption::VALUE_REQUIRED, 'add or override parameters of the bootstrap');
//        $this->addArgument(self::INPUT_KEY_TYPES, InputArgument::IS_ARRAY, 'Space-separated list of cache types or omit to apply to all cache types.');
        parent::configure();
    }

    /**
     * {@inheritdoc}
     */
    protected function execute(InputInterface $input, OutputInterface $output)
    {
        $output->writeln('Starting');
        $this->appState->setAreaCode('catalog');

        /** @var ProductCollection $productCollection */
        $productCollection = $this->productCollectionFactory->create();
        $productIds        = $productCollection->getAllIds();
        if (!count($productIds))
        {
            $output->writeln("<info>No product images to resize</info>");
            return;
        }

        try
        {
            foreach ($productIds as $productId)
            {
                try
                {
                    /** @var Product $product */
                    $product = $this->productRepository->getById($productId);
                }
                catch (NoSuchEntityException $e)
                {
                    continue;
                }

                $image = 'products/' . $product->getSku() . '.jpg';
                $product->addImageToMediaGallery($image, array('media_image', "image"));
                $product->save();
                /** @var ImageCache $imageCache */
                $imageCache = $this->imageCacheFactory->create();
                $imageCache->generate($product);

                $output->write($product->getName() . "\n");
            }
        }
        catch (\Exception $e)
        {
            $output->writeln("<error>{$e->getMessage()}</error>");
            return;
        }

        $output->write("\n");
        $output->writeln("<info>Product images resized successfully</info>");

        $output->writeln('Finished');
    }
}
