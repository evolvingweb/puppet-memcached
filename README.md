# memcached module for Puppet

## Description
Classes to help manage memcached.  Uses the [Drizzle-developers PPA](https://launchpad.net/~drizzle-developers/+archive/ppa) to get the latest package versions.

## Usage
<pre>
# for just the server
include memcached::server

# for the php extension
include php:five
include memcached::php
</pre>

