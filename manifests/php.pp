# php.pp

class memcached::php {
	
	include memcached::common
	include php::five::dev
	
	package { "libmemcached-dev":
		ensure => latest,
		require => Apt::Source["drizzle-developers"],
	}
	
	exec { "pecl install memcached":
		require => [ Package["libmemcached-dev"], Package["php5-dev"], Package["php-pear"] ],
		unless => "php -m | grep memcached",
		notify => Exec["force-reload-apache"],
	}
	
	file { [ "/etc/php5/apache2/conf.d/memcached.ini", "/etc/php5/cli/conf.d/memcached.ini" ]:
		ensure => file,
		owner => root,
		group => root,
		mode => 644,
		source => "puppet:///memcached/memcached.ini",
		require => Exec["pecl install memcached"],
	}

}
