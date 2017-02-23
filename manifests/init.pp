# Solaris_ndd
#
# set solaris dirver configuration with puppet (kernel tuning)
#
# @param value Value to set the parameter to (interpolated into string)
# @param key Item to change in format DRIVER->PARAMETER, eg
#   /dev/ip->ip_forward_src_routed, defaults to $title.  This is the writable
#   form of the key name, eg tcp_extra_priv_ports_add if we need to ensure a
#   port is added or tcp_extra_priv_ports_del if we need to ensure a port is
#   removed, not just tcp_extra_priv_ports.  We will convert to this short name
#   ourself in order to test the current settings, however
define solaris_ndd(
  $value,
  $key = $title,
) {

  if $key.match(/.+->.+/) {
    $key_split = split($key, '->')

    # remove any _add or _del to check array data keys, we should still keep
    # these to write though
    $read_key = regsubst($key_split[1], /(_add|_del)/, "", "G")

    exec { "ndd ${key}":
      command => "ndd -set ${key_split[0]} ${key_split[1]} ${value}",
      unless  => "ndd -get ${key_split[0]} ${read_key} | grep ${value}",
      path    => [ "/usr/bin", "/usr/sbin", "/bin", "/sbin"],
    }
  } else {
    fail("Incorrect Key format for :'${key}, needs to be driver->parameter, eg /dev/ip->ip_forward_src_routed")
  }
}
