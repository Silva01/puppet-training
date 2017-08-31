class profile::wordpress {
  
  include apache
  include apache::mod::php

  class { '::mysql::server':
    root_password           => 'fundamentals',
    remove_default_accounts => true,
  }

  include mysql::bindings::php

  class { 'wordpress':
    version => '4.7.4',
    install_dir => '/var/www/html',
  }
}
