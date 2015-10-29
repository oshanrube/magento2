<?php

namespace Onic\ThemeInterface\Model;

use Magento\Framework\Exception\NoSuchEntityException;
use Magento\Framework\Api\SearchCriteriaInterface;
use Magento\Cms\Model\Block;

class BlockRepository extends \Magento\Cms\Model\BlockRepository
{
    /**
     * Load Block data collection by given search criteria
     * @SuppressWarnings(PHPMD.CyclomaticComplexity)
     * @SuppressWarnings(PHPMD.NPathComplexity)
     * @param \Magento\Framework\Api\SearchCriteriaInterface $criteria
     * @return \Magento\Cms\Model\ResourceModel\Block\Collection
     */
    public function getByIdentifier($blockId)
    {
        $block = $this->blockFactory->create();
        if (is_numeric($blockId))
        {
            $this->resource->load($block, $blockId);
            if (!$block->getId())
            {
                throw new NoSuchEntityException(__('CMS Block with id "%1" does not exist.', $blockId));
            }
        }
        else
        {
            $criteria = new \Magento\Framework\Api\SearchCriteria();

            $filter = new \Magento\Framework\Api\Filter();
            $filter->setField('identifier');
            $filter->setValue('home-page-block%');
            $filter->setConditionType('like');

            $fg = new \Magento\Framework\Api\Search\FilterGroup();
            $fg->setFilters(array($filter));
            $criteria->setFilterGroups(array($fg));
            return $this->getList($criteria);
        }
        return $block;
    }
}