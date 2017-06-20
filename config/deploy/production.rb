server '52.192.166.68', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/Users/kodamatsugihei/.ssh/id_rsa'
