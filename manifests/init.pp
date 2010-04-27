# memcached.pp

class memcached {

	include memcached::server
		
}

class memcached::common {

	apt::source { "drizzle-developers":
		location => "http://ppa.launchpad.net/drizzle-developers/ppa/ubuntu",
		key => "06899068",
	}

}
