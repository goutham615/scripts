node default {
notify {'Your Server Has Reached Default Node Config':}
}

node /^puppetclient\d+$/ {
include users
class { 'paramusers':
username  => 'testuser300',
ensure    => 'present',
shellpath => '/bin/bash'
}

}

#Classes are singleton in nature and can not be used twice under the same node definition. But can be used in 
#diffrent node defintions.
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



class users {
user { 'testuser1':
       ensure           => $ensure,
       home             => '/home/testuser1',
       password         => 'India@123456',
       password_max_age => '99999',
       password_min_age => '0',
       shell            => '/bin/bash',
     }
user { 'testuser2':
       ensure           => $ensure,
       home             => '/home/testuser2',
       password         => 'India@123456',
       password_max_age => '99999',
       password_min_age => '0',
       shell            => '/bin/bash',
     }
}
