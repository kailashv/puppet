# execute 'yum update'
#exec { 'yum update':                    # exec resource named 'yum update'
  #command => '/usr/bin/yum -y update'  # command this resource will run
#}

# install httpd package
package { 'httpd':
  #require => Exec['yum update'],        
  ensure => installed,
}

# ensure httpd service is running
service { 'httpd':
  ensure => running,
  require => Package['httpd'],
}

# install mysql-server package
package { 'mysql-server':
  #require => Exec['yum update'],        
  ensure => installed,
}

# ensure mysql service is running
service { 'mysqld':
  ensure => running,
  require => Package['mysql-server'],
}

# install php package
package { 'php':
  #require => Exec['yum update'],        
  ensure => installed,
}

# ensure info.php file exists
file { '/var/www/html/info.php':
  ensure => file,
  content => '<?php  phpinfo(); ?>',    # phpinfo code
  require => Package['httpd','php'],        # require 'httpd' package before creating
} 
