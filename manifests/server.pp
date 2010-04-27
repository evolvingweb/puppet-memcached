# server.pp

class memcached::server {

	include memcached::common
	
	package { "memcached":
		ensure => installed,
		require => Apt::Source["drizzle-developers"],
	}
	
	file { "/etc/memcached.conf":
		ensure => file,
		owner => root,
		group => root,
		mode => 644,
		source => "puppet:///memcached/memcached.conf",
		notify => Service["memcached"],
	}
	
	file { "/etc/default/memcached":
		ensure => file,
		owner => root,
		group => root,
		mode => 644,
		source => "puppet:///memcached/memcached",
		notify => Service["memcached"],
	}
	
	service { "memcached":
		ensure => running,
		enable => true,
		require => [ Package["memcached"], File["/etc/default/memcached"] ],
	}

}
