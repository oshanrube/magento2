<?php
/**
 * Created by PhpStorm.
 * User: wsun
 * Date: 13/05/2015
 * Time: 5:02 PM
 */
namespace Onic\Topmenu\Block;

use Magento\Framework\View\Element\Template;
use Magento\Framework\DataObject\IdentityInterface;
use Magento\Framework\Data\TreeFactory;
use Magento\Framework\Data\Tree\Node;
use Magento\Framework\Data\Tree\NodeFactory;
use Magento\Theme\Block\Html\Topmenu;

class OnicTopmenu extends Topmenu
{

    protected function _toHtml()
    {
        $this->setModuleName($this->extractModuleName('Magento\Theme\Block\Html\Title'));
        return parent::_toHtml();
    }

    /**
     * Recursively generates top menu html from data that is specified in $menuTree
     * @param \Magento\Framework\Data\Tree\Node $menuTree
     * @param string                            $childrenWrapClass
     * @param int                               $limit
     * @param array                             $colBrakes
     * @return string
     * @SuppressWarnings(PHPMD.CyclomaticComplexity)
     * @SuppressWarnings(PHPMD.NPathComplexity)
     */
    protected function _getHtml(Node $menuTree, $childrenWrapClass, $limit, $colBrakes = [])
    {
        $html = '';

        $children    = $menuTree->getChildren();
        $parentLevel = $menuTree->getLevel();
        $childLevel  = $parentLevel === null ? 0 : $parentLevel + 1;

        $counter       = 1;
        $itemPosition  = 1;
        $childrenCount = $children->count();

        $parentPositionClass = $menuTree->getPositionClass();
        //$itemPositionClassPrefix = $parentPositionClass ? $parentPositionClass . '-' : 'nav-';

        $k = 0;
        foreach ($children as $child)
        {
            $child->setLevel($childLevel);
            $child->setIsFirst($counter == 1);
            $child->setIsLast($counter == $childrenCount);
            //$child->setPositionClass($itemPositionClassPrefix . $counter);

            $outermostClassCode = '';
            $outermostClass     = $menuTree->getOutermostClass();

            if ($childLevel == 0 && $outermostClass)
            {
                $outermostClassCode = ' data-toggle="dropdown" class="dropdown-toggle" ';
                $child->setClass($outermostClass);
            }

//            if (count($colBrakes) && $colBrakes[$counter]['colbrake'])
//            {
//                $html .= '</ul></li><li class="column"><ul>';
//            }

            $mhtml = '<li ' . ($childLevel != 1 ? $this->_getRenderedMenuItemAttributes($child) : '') . '>';

            if ($limit == $childLevel)
            {
                $mhtml .= '<p><strong>' . $this->escapeHtml($child->getName()) . '</strong></p>';
                $mhtml .= '</li>';
                $mhtml .= $this->_addSubMenu($child, $childLevel, $childrenWrapClass, $limit);
            }
            else
            {
                $mhtml .= '<a href="' . $child->getUrl() . '" ' . $outermostClassCode . '>';
                $mhtml .= $this->escapeHtml($child->getName()) . ($childLevel == 0 ? '<b class="caret"> </b> ' : '');
                $mhtml .= '</a>';
                $mhtml .= $this->_addSubMenu($child, $childLevel, $childrenWrapClass, $limit);
                $mhtml .= '</li>';
            }

            if ($limit == $childLevel)
            {
                $html .= '<ul class="col-lg-2 col-sm-2 col-md-2 unstyled ' . ($k++ == 0 ? 'noMarginLeft' : '') . '">' . $mhtml . '</ul>';
            }
            else
            {
                $html .= $mhtml;
            }
            $itemPosition++;
            $counter++;
        }

        return $html;
    }

    /**
     * Add sub menu HTML code for current menu item
     * @param \Magento\Framework\Data\Tree\Node $child
     * @param string                            $childLevel
     * @param string                            $childrenWrapClass
     * @param int                               $limit
     * @return string HTML code
     */
    protected function _addSubMenu($child, $childLevel, $childrenWrapClass, $limit)
    {
        $html = '';
        if (!$child->hasChildren() || $childLevel >= $limit)
        {
            return $html;
        }

        $colStops = null;
//        if ($childLevel == 0 && $limit)
//        {
//            $colStops = $this->_columnBrake($child->getChildren(), $limit);
//        }

        $html .= '<ul class="level' . $childLevel . ' dropdown-menu">';
        $html .= '<li class="megamenu-content">';
        $html .= $this->_getHtml($child, $childrenWrapClass, $limit, $colStops);
        $html .= '</li>';
        $html .= '</ul>';

        return $html;
    }
}