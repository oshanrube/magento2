<?php
/**
 * Copyright © 2015 Magento. All rights reserved.
 * See COPYING.txt for license details.
 */

namespace Magento\Newsletter\Test\Block\Adminhtml\Subscriber;

/**
 * Newsletter subscribers grid
 *
 */
class Grid extends \Magento\Ui\Test\Block\Adminhtml\DataGrid
{
    /**
     * Filters array mapping
     *
     * @var array
     */
    protected $filters = [
        'email' => [
            'selector' => '#subscriberGrid_filter_email',
        ],
        'firstname' => [
            'selector' => '#subscriberGrid_filter_firstname',
        ],
        'lastname' => [
            'selector' => '#subscriberGrid_filter_lastname',
        ],
        'status' => [
            'selector' => '#subscriberGrid_filter_status',
            'input' => 'select',
        ],
    ];
}
