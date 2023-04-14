node default {
notify {'Your Server Has Reached Default Node Config':}

}

#node 'puppetclient1.ec2.internal','puppetclient2.ec2.internal','puppetclient3.ec2.internal' {
node /^puppetclient\d+$/ {
notify {'This Is puppet-client-1':}
include files1
include files2
include files3
class {'files4':}
class {'files5':}
}



class files1 {
  file { '/tmp/file1':
  ensure  => file,
  mode    => '0600',
  content => 'Welcome To Puppet Training....!!!'
  }
}

class files2 {
  file { '/tmp/file2':
  ensure  => file,
  mode    => '0600',
  content => 'Welcome To Puppet Training....!!!'
  }
}

class files3 {
  file { '/tmp/file3':
  ensure  => file,
  mode    => '0600',
  content => 'Welcome To Puppet Training....!!!'
  }
}

class files4 {
  file { '/tmp/file4':
  ensure  => file,
  mode    => '0600',
  content => 'Welcome To Puppet Training....!!!'
  }
}

class files5 {
  file { '/tmp/file5':
  ensure  => file,
  mode    => '0600',
  content => 'Welcome To Puppet Training....!!!'
  }
}
