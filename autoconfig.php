<?php

$AUTOCONFIG = array (
  'directory' => '/var/www/html/data',
  'dbtype' => 'mysql',
  'dbname' => getenv("MYSQL_1_ENV_MYSQL_DATABASE"),
  'dbhost' => 'mysql',
  'dbtableprefix' => 'oc_',
  'dbuser' => getenv("MYSQL_1_ENV_MYSQL_USER"),
  'dbpass' => getenv("MYSQL_1_ENV_MYSQL_PASSWORD"),
  'adminlogin' => 'admin',
  'adminpass' => 'password',
  // 'check_for_working_webdav' => false,
);
