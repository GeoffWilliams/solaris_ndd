[![Build Status](https://travis-ci.org/GeoffWilliams/solaris_ndd.svg?branch=master)](https://travis-ci.org/GeoffWilliams/solaris_ndd)
# solaris_ndd

#### Table of Contents

1. [Description](#description)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

Set solaris driver configuration with puppet (kernel tuning).  This module uses the `ndd` tool to get/set settings and update as required

## Usage

```puppet
solaris_ndd { "/dev/ip->ip_forward_src_routed":
  value => 0,
}
```
Each parameter is handled as a different Puppet resource.  The `title` specifies the kernel driver and the parameter, delimited by `->` and the puppet code translates the supplied `title` and value into the correct `ndd` invocation.  Eg, the example above becomes:

```shell
ndd -set /dev/ip ip_forward_src_routed 0
```

The call to `ndd -set` is protected by a corresponding call to `ndd -get` to provide idempotence.

## Reference

### Defined types
* `solaris_ndd` - Manage individual Solaris driver parameters (Kernel tuning)

## Limitations

* Only works on Solaris
* Not supported by Puppet, inc.

## Development

PRs accepted :)

## Testing
This module supports testing using [PDQTest](https://github.com/GeoffWilliams/pdqtest).


Test can be executed with:

```
bundle install
bundle exec pdqtest all
```


See `.travis.yml` for a working CI example
