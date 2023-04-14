node default {
notify {'Your Server Has Reached Default Node Config':}

}
#Define types can be used multiple times in a singe node definition unlike classes.
node /^puppetclient\d+$/ {

dfusers { 'testuser888':
  username  => 'testuser888',
  ensure    => 'present',
  shellpath => '/bin/bash'
}

dfusers { 'appuser1':
  username  => 'glassapp1',
  ensure    => 'present',
  shellpath => '/bin/bash'
}

dfusers { 'appuser2':
  username  => 'glassapp2',
  ensure    => 'present',
  shellpath => '/bin/bash'
}

}

define dfusers ($username, $ensure, $shellpath) {

user { $username:
       ensure           => $ensure,
       home             => "/home/${username}",
       password         => 'India@123456',
       password_max_age => '99999',
       password_min_age => '0',
       shell            => $shellpath,
     }
}


class paramusers ($username, $ensure, $shellpath) {

user { $username:
       ensure           => $ensure,
       home             => "/home/${username}",
       password         => 'India@123456',
       password_max_age => '99999',
       password_min_age => '0',
       shell            => $shellpath,
     }
}


