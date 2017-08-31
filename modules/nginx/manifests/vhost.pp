define nginx::vhost (
  $port = '80',
  $docroot = '/var/www',
  $servername = $title,
){

 file {'/etc/nginx/conf.d/teste.conf':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => epp('nginx/vhost.conf.epp', { 'docroot' => $docroot, 'port'    => $port}),
  }

  file{"${documentroot}/index.html":
    #target => 'puppet://modules/nginx/index.html',
    content => epp('nginx/index.html.epp'),
  }
}
