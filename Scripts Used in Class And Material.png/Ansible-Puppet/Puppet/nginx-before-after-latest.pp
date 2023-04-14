class mynginx {
  exec { 'apt update':
    command => '/usr/bin/apt update',
    before  => Exec['Delete Repo if Exists'],
  }

  exec { 'Delete Repo if Exists':
    command => '/bin/rm -rf /tmp/dockertest1',
    before  => Exec['Clone Repo'],
  }

  exec { 'Clone Repo':
    command => '/usr/bin/git clone -b DevOpsB13 https://github.com/mavrick202/dockertest1.git /tmp/dockertest1',
    before  => Package['nginx'],
  }
  package { 'nginx':
    ensure => installed,
    before => File['/var/www/html'],
  }

  file { '/var/www/html' :
    ensure  => directory,
    source  => '/tmp/dockertest1',
    recurse => true,
    backup  => false,
    notify  => Service['nginx'],
    }
  service { 'nginx':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    #subscribe  => File['/var/www/html'],
  }
  
}

=====================================================================
class checkingbefore {
   file { '/etc/testfile1' :
   content => "Creating Test File 1"
    }
   file { '/etc/testfile2' :
   content => "Creating Test File 2",
   before => File['/etc/testfile1'],
    }
   file { '/etc/testfile3' :
   content => "Creating Test File 3",
   before => File['/etc/testfile2'],
    }
   file { '/etc/testfile4' :
   content => "Creating Test File 4",
   before => File['/etc/testfile3'],
    }
}

class checkingrequire {
   file { '/etc/testfile10' :
   content => "Creating Test File 10",
   require => File['/etc/testfile20'],
   }
   file { '/etc/testfile20' :
   content => "Creating Test File 20",
   require => File['/etc/testfile30'],
   }
   file { '/etc/testfile30' :
   content => "Creating Test File 30",
   require => File['/etc/testfile40'],
   }
   file { '/etc/testfile40' :
   content => "Creating Test File 40",
   }
}
