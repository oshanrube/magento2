<?php

namespace Onic\ThemeInterface\Model;

class StoreConfigManager extends \Magento\Store\Model\Service\StoreConfigManager
{

    protected $configPaths = ['setLocale' => 'general/locale/code', 'setBaseCurrencyCode' => 'currency/options/base', 'setDefaultDisplayCurrencyCode' => 'currency/options/default', 'setTimezone' => 'general/locale/timezone', 'setWeightUnit' => \Magento\Directory\Helper\Data::XML_PATH_WEIGHT_UNIT, 'setStoreName' => 'general/store_information/name', 'setStorePhone' => 'general/store_information/phone', 'setStoreHours' => 'general/store_information/hours', 'setStoreCountryId' => 'general/store_information/country_id'];
    /**
     * @param string[] $storeCodes list of stores by store codes, will return all if storeCodes is not set
     * @return \Onic\ThemeInterface\Model\StoreConfig[]
     */
    public function getStoreConfigs(array $storeCodes = null)
    {
        $storeConfigs = [];
        $storeCollection = $this->storeCollectionFactory->create();
        if ($storeCodes != null) {
            $storeCollection->addFieldToFilter('code', ['in' => $storeCodes]);
        }

        foreach ($storeCollection->load() as $item) {
            $storeConfigs[] = $this->getStoreConfig($item);
        }
        return $storeConfigs;
    }
}