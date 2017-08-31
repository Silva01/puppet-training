class system_users::hosts {
  host { 'student.puppetlabs.vm':
      ensure         => 'present',
       ip         => '127.0.0.1',
  }

}
