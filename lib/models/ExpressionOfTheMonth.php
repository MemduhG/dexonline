<?php

class ExpressionOfTheMonth extends BaseObject implements DatedObject {
  public static $_table = 'ExpressionOfTheMonth';

  const DEFAULT_IMAGE = 'generic.jpg';
  const SIZE_XL = 600;

  static function getWotM($date) {
    return Model::factory('ExpressionOfTheMonth')
      ->where_lte('displayDate', $date)
      ->order_by_desc('displayDate')
      ->limit(1)
      ->find_one();
  }

  static function getCurrentWotM() {
    $today = date('Y-m-d');
    return Model::factory('ExpressionOfTheMonth')
      ->where_lte('displayDate', $today)
      ->order_by_desc('displayDate')
      ->limit(1)
      ->find_one();
  }

  function getImageUrl() {
    if ($this->image) {
      return Config::STATIC_URL . 'img/wotd/expresia-lunii/' . $this->image;
    }
    return null;
  }

  // TODO: this duplicates code from WordOfTheDay.php
  function getThumbUrl($size) {
    $pic = $this->image ? $this->image : self::DEFAULT_IMAGE;
    StaticUtil::ensureThumb(
      "img/wotd/expresia-lunii/{$pic}",
      "img/wotd/thumb{$size}/expresia-lunii/{$pic}",
      $size);
    return sprintf('%simg/wotd/thumb%s/expresia-lunii/%s',
      Config::STATIC_URL,  $size, $pic);
  }

  function getMediumThumbUrl() {
    return $this->getThumbUrl(WordOfTheDay::SIZE_M);
  }

  function getLargeThumbUrl() {
    return $this->getThumbUrl(self::SIZE_XL);
  }

  function getArtist() {
    return ($this->image)
      ? WotdArtist::getByDate($this->displayDate, true) // true = WotM
      : null;
  }

}
