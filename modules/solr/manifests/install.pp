/**
 * 
 * Installs solr and tomcat
 * 
 */

class solr::install {
  package { "solr-tomcat":
    ensure  => installed,
    require => [
    	Class["phpfpm"],
    	Class["nginx"],
        Apt::Ppa['ppa:webops/solr-3.6']
    ]
  }
}
