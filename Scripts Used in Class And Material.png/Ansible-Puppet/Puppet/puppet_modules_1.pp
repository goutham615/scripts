#cd to /etc/puppetlabs/code/environments/production/modules/
#pdk new module devopsb13mod1 --skip-interview
#cd devopsb13mod1
#pdk new class users

node default {
notify {'Your Server Has Reached Default Node Config':}

}

node /^puppetclient\d+$/ {
class {'devopsb13mod1::users':
   username  => 'testuser3000',
   ensure    => 'present',
   shellpath => '/bin/bash'
}

class {'devopsb13mod1::users2':
   username  => 'testuser3001',
   ensure    => 'present',
   shellpath => '/bin/bash'
}

devopsb13define::defineusers {'munnabhai1':
   username  => 'munna1',
   ensure    => 'present',
   shellpath => '/bin/bash'
}

devopsb13define::defineusers {'munnabhai2':
   username  => 'munna2',
   ensure    => 'present',
   shellpath => '/bin/bash'
}

}
