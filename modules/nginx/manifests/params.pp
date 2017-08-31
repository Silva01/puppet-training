class nginx::params{
  case $facts['os']['family'] {
     'redhat':{
       $pacote = 'nginx'
       $ownerr = 'root'
       $groupp = 'root'
       $mode = '0644'
       $documentroot = '/var/www'
       $configdirectory = '/etc/nginx'
       $serverdirectory = '/etc/nginx/conf.d'
       $logdirectory = '/var/log/nginx'
       $servico = 'nginx'
       $run = 'nginx'
     }
    'debian':{
      $pacote = 'nginx'
      $ownerr = 'root'
      $groupp = 'root'
      $mode = '0644'
      $documentroot = '/var/www'
      $configdirectory = '/etc/nginx'
      $serverdirectory = '/etc/nginx/conf.d'
      $logdirectory = '/var/log/nginx'
      $servico = 'nginx'
      $run = 'www-data'
     }
    'windows':{
      $pacote = 'nginx-service'
      $ownerr = 'Administrador'
      $groupp = 'Administrador'
      $mode = '0644'
      $documentroot = 'C:/ProgramData/nginx/html'
      $configdirectory = 'C:/ProgramData/nginx/conf'
      $serverdirectory = 'C:/ProgramData/nginx/conf.d'
      $logdirectory = 'C:/ProgramData/nginx/logs'
      $servico = 'nginx'
      $run = 'nginx'
    }
    default: {
      fail("Operating system family ${facts['os']['family']} is not supported.")
    }
  }
}
