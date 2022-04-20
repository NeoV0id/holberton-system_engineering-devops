# Will modify configuration file

file_line {'Add PasswordAuthentication no':
    path => '/etc/ssh/ssh_config',
    line => '    PasswordAuthentication no'
}

file_line {'Add IdentityFile with the right key':
    path => '/etc/ssh/ssh_config',
    line => '    IdentityFile ~/.ssh/school'
}
