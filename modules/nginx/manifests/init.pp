class nginx (
  $pacote = $nginx::params::pacote,
  $ownerr = $nginx::params::ownerr,
  $groupp = $nginx::params::groupp,
  $mode = $nginx::params::mode,
  $documentroot = $nginx::params::documentroot,
  $configdirectory = $nginx::params::configdirectory,
  $serverdirectory = $nginx::params::serverdirectory,
  $logdirectory = $nginx::params::logdirectory,
  $servico = $nginx::params::servico,
  $run = $nginx::params::run,
  ) inherits nginx::params {

  $root_directory = '/usr/share/nginx/html'
  $porta = '80'

  File{
    ensure => file,
    owner  => $ownerr,
    group  => $groupp,
    mode   => $mode,
  }

  package {$pacote:
    ensure => present,
  }

  file {'/var/www':
    ensure => directory,
  }

  file {"${configdirectory}/nginx.conf":
    #target => "puppet://modules/ngin/${facts['os']['family']}.conf",
    content => epp('nginx/nginx.conf.epp', {run => $run, dirlog => $logdirectory, config_dir => $configdirectory}),
    notify => Service[$servico],
  }

  nginx::vhost {defualt:}

  service {$servico:
    ensure    => running,
    enable    => true,
  }
}
