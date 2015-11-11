<?php
namespace Onic\ThemeInterface\Api\Data;

/**
 * StoreConfig interface
 *
 * @api
 */
interface StoreConfigInterface extends \Magento\Store\Api\Data\StoreConfigInterface
{

    /**
     * Get store name
     * @return string
     */
    public function getStoreName();

    /**
     * Set store name
     * @param string $name
     * @return $this
     */
    public function setStoreName($name);

    /**
     * Get store phone
     * @return string
     */
    public function getStorePhone();

    /**
     * Set store phone
     * @param string $phone
     * @return $this
     */
    public function setStorePhone($phone);

    /**
     * Get store hours
     * @return string
     */
    public function getStoreHours();

    /**
     * Set store hours
     * @param string $hours
     * @return $this
     */
    public function setStoreHours($hours);

    /**
     * Get store countryid
     * @return string
     */
    public function getStoreCountryId();

    /**
     * Set store countryId
     * @param string $countryId
     * @return $this
     */
    public function setStoreCountryId($countryId);


    /**
     * Set support email
     * @param string $support_email
     * @return $this
     */
    public function setSupportEmail($support_email);

    /**
     * Get support email
     * @return string
     */
    public function getSupportEmail();
}
