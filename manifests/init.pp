define solaris_ndd(
  $key = $title,
  $value,
) {

  if $key.match(/.+->.+/) {
    $key_split = split($key, '->')

    exec { "ndd ${key}":
      command => "ndd -set ${key_split[0]} ${key_split[1]} ${value}",
      unless  => "ndd -get ${key_split[0]} ${key_split[1]} | grep ${value}",
      path    => [ "/usr/bin", "/usr/sbin", "/bin", "/sbin"],
    }
  } else {
    fail("Incorrect Key format for :'${key}, needs to be driver->parameter, eg /dev/ip->ip_forward_src_routed")
  }
}
