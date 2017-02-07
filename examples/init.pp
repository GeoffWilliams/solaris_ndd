solaris_ndd { "/dev/ip->ip_forward_src_routed":
  value => 0,
}

solaris_ndd { "/dev/ip->ip6_forward_src_routed":
  value => 0,
}

solaris_ndd { "/dev/ip->ip_forward_directed_broadcasts":
  value => 0,
}
