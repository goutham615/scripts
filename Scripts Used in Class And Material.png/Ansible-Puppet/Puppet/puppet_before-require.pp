=============FILE1->FILE2->FILE3=====================
node default {
notify {'Your Server Has Reached Default Node Config':}

}

#node 'puppetclient1.ec2.internal','puppetclient2.ec2.internal','puppetclient3.ec2.internal' {
node /^puppetclient\d+$/ {
notify {'This Is puppet-client-1':}
include files1
include files2
include files3
}



class files1 {
  file { '/tmp/file1':
  ensure  => file,
  mode    => '0600',
  content => 'Welcome To Puppet Training....!!!',
  before => File['/tmp/file2'],
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
  content => 'Welcome To Puppet Training....!!!',
  require => File['/tmp/file2'],
  }

}

=====================================================
=============FILE3->FILE2->FILE1=====================
node default {
notify {'Your Server Has Reached Default Node Config':}

}

#node 'puppetclient1.ec2.internal','puppetclient2.ec2.internal','puppetclient3.ec2.internal' {
node /^puppetclient\d+$/ {
notify {'This Is puppet-client-1':}
include files1
include files2
include files3
}



class files1 {
  file { '/tmp/file1':
  ensure  => file,
  mode    => '0600',
  content => 'Welcome To Puppet Training....!!!',
  require => File['/tmp/file2'],
  }
}

class files2 {
  file { '/tmp/file2':
  ensure  => file,
  mode    => '0600',
  content => 'Welcome To Puppet Training....!!!',
  require => File['/tmp/file3'],
  }
}

class files3 {
  file { '/tmp/file3':
  ensure  => file,
  mode    => '0600',
  content => 'Welcome To Puppet Training....!!!',
  }

}

class files {
  file { '/tmp/testfile1':
  ensure  => file,
  mode    => '0600',
  require => File['/tmp/testfile2'],
  #before => File['/tmp/testfile2'],
}

file { '/tmp/testfile2':
  ensure  => file,
  mode    => '0600',
  require => File['/tmp/testfile3'],
  #before => File['/tmp/testfile3'],
}

file { '/tmp/testfile3':
  ensure  => file,
  mode    => '0600',
  #before => File['/tmp/file1'],
}
