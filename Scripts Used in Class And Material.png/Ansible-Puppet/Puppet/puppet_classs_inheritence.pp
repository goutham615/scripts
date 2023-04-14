node default {
notify {'Your Server Has Reached Default Node Config':}

}

node /^puppetclient\d+$/ {
  class { 'paramusers':
    username  => 'testuser111',
    ensure    => 'present',
    shellpath => '/bin/bash'
}

}

class paramusers ($username, $ensure, $shellpath) inherits files1 {

user { $username:
       ensure           => $ensure,
       home             => "/home/${username}",
       password         => 'India@123456',
       password_max_age => '99999',
       password_min_age => '0',
       shell            => $shellpath,
     }
}

class files1 inherits files2 {
  file { '/tmp/file1':
  ensure => file,
  mode   => '0600',
}
}

class files2 inherits files3 {
  file { '/tmp/file2':
  ensure => file,
  mode   => '0600',
}
}

class files3 inherits nginxservice {
  file { '/tmp/file3':
  ensure => file,
  mode   => '0600',
}
}

class nginxservice inherits nginx {
  service  { 'nginx':
  ensure => running,
  name   => 'nginx',

}
}

class nginx inherits runaptupdate  {
  package { 'nginx':
  ensure   => installed,
  name     => nginx,
  provider => apt
}
}

class runaptupdate  {
  exec  { 'runapt':
  command   => '/usr/bin/apt update'
}
}
