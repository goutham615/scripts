node default {
notify {'Your Server Has Reached Default Node Config':}

}

node /^puppetclient\d+$/ {
include mynginx
}

class mynginx {
  package { 'nginx':
    ensure => installed,
  }
  file { '/var/www/html' :
        ensure  => directory,
        source  => '/tmp/dockertest1',
        recurse => true,
        backup  => false,
    }
    service { 'nginx':
      ensure     => running,
      enable     => true,
      hasrestart => true,
      hasstatus  => true,
      # pattern    => 'nginx',
    }
    exec { 'apt update':
    command => '/usr/bin/apt update',
    }
    exec { 'Dele Repo if Exists':
    command => '/bin/rm -rf /tmp/dockertest1'
    }
    exec { 'Clone Repo':
    command => '/usr/bin/git clone -b DevOpsB13 https://github.com/mavrick202/dockertest1.git /tmp/dockertest1',
    }
  Exec['apt update'] -> Exec['Dele Repo if Exists'] ->  Exec['Clone Repo'] -> Package['nginx'] -> File['/var/www/html'] ~> Service['nginx']
}
