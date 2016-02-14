
/**
 *
 * This will build a basic LEMP stack with some extra goodies for every node that connects
 * to the puppetmaster at kalabox.kalamuna.com
 */

node /^kala\.[a-f0-9]{32}\.box$/  {
  include apt

  Exec["apt_update"] -> Package <| |>

  package { 'python-software-properties':
    ensure  => installed,
    require  => Exec['apt_update'],
  }

  apt::ppa { 'ppa:lucene-ubuntu/dev': 
    notify => Exec["apt_update"]
  }

  # Initialize core packages
  include kalabox

  include git
  include grub
  include unzip
  include user

  # Initialize LEMP stack
  include nginx
  include phpfpm
  include mysql

  # Initialize bonus shit
  include solr
  include drush
  include phpmyadmin
  include webgrind

  # Build basic drupal site
  drupal::nginx::vhost { "drupaldefault":
    server_name => "drupal.kala",
    root        => "/var/www/drupal",
    enabled     => "FALSE",
    custom      => "# THIS IS MEANT TO BE USED FOR BUILDING OTHER DRUPAL VHOSTS"
  }
}
