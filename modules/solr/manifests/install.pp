/**
 * 
 * Installs solr and tomcat
 * 
 */

class solr::install {
  package { "solr-tomcat":
    ensure  => latest,
    require => [
    	Class["phpfpm"],
    	Class["nginx"],
        Apt::Ppa["ppa:lucene-ubuntu/dev"]
    ]
  }
}
