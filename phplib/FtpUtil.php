<?php

class FtpUtil {

  static function staticServerPut($localFile, $remoteFile) {
    $user = Config::get('static.user');
    $pass = Config::get('static.password');
    if ($user && $pass) {
      $conn = ftp_connect(Config::get('static.host'));
      ftp_login($conn, $user, $pass);
      ftp_pasv($conn, true);

      // Create the directory recursively
      $parts = explode('/', dirname($remoteFile));
      $partial = '';
      foreach ($parts as $part) {
        $partial .= '/' . $part;
        @ftp_mkdir($conn, $partial);
      }

      ftp_put($conn, Config::get('static.path') . $remoteFile, $localFile, FTP_BINARY);
      ftp_close($conn);
    }
  }

  static function staticServerPutContents(&$contents, $remoteFile) {
    $tmpFile = tempnam(Config::get('global.tempDir'), 'ftp_');
    file_put_contents($tmpFile, $contents);
    self::staticServerPut($tmpFile, $remoteFile);
    unlink($tmpFile);
  }

  static function staticServerDelete($remoteFile) {
    $conn = ftp_connect(Config::get('static.host'));
    ftp_login($conn, Config::get('static.user'), Config::get('static.password'));
    ftp_pasv($conn, true);
    @ftp_delete($conn, Config::get('static.path') . $remoteFile);
    ftp_close($conn);
  }

  static function staticServerFileExists($remoteFile) {
    $conn = ftp_connect(Config::get('static.host'));
    ftp_login($conn, Config::get('static.user'), Config::get('static.password'));
    ftp_pasv($conn, true);
    $listing = @ftp_nlist($conn, Config::get('static.path') . $remoteFile);
    ftp_close($conn);
    return !empty($listing);
  }

}

?>
