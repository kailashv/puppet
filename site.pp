# execute 'yum update'
exec { 'yum update':                    # exec resource named 'yum update'
  command => '/usr/bin/yum update'  # command this resource will run
}

# install httpd package
package { 'httpd':
  #require => Exec['yum update'],        
  ensure => installed,
}

# ensure httpd service is running
service { 'httpd':
  ensure => running,
}

# install mysql-server package
package { 'mysql-server':
  #require => Exec['yum update'],        
  ensure => installed,
}

# ensure mysql service is running
service { 'mysql':
  ensure => running,
}

# install php5 package
package { 'php5':
  #require => Exec['yum update'],        
  ensure => installed,
}

# ensure info.php file exists
file { '/var/www/html/info.php':
  ensure => file,
  content => '<?php  phpinfo(); ?>',    # phpinfo code
  require => Package['httpd'],        # require 'httpd' package before creating
} 
