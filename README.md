[![License](https://img.shields.io/:license-apache-blue.svg)](http://www.apache.org/licenses/LICENSE-2.0.html)
[![CII Best Practices](https://bestpractices.coreinfrastructure.org/projects/73/badge)](https://bestpractices.coreinfrastructure.org/projects/73)
[![Puppet Forge](https://img.shields.io/puppetforge/v/simp/simp_ipa.svg)](https://forge.puppetlabs.com/simp/simp_ipa)
[![Puppet Forge Downloads](https://img.shields.io/puppetforge/dt/simp/simp_ipa.svg)](https://forge.puppetlabs.com/simp/simp_ipa)
[![Build Status](https://travis-ci.org/simp/pupmod-simp-simp_ipa.svg)](https://travis-ci.org/simp/pupmod-simp-simp_ipa)


#### Table of Contents

<!-- vim-markdown-toc GFM -->

* [Description](#description)
* [Reference](#reference)
  * [This is a SIMP module](#this-is-a-simp-module)
* [Setup](#setup)
  * [What simp_ipa affects](#what-simp_ipa-affects)
* [Usage](#usage)
  * [Tasks](#tasks)
* [Development](#development)
  * [Acceptance tests](#acceptance-tests)

<!-- vim-markdown-toc -->

## Description

This is a module for managing ``simp_ipa`` server and client installations.

## Reference

See [REFERENCE.md](./REFERENCE.md) for the full module reference.

### This is a SIMP module

This module is a component of the [System Integrity Management Platform](https://simp-project.com), a
compliance-management framework built on Puppet.

If you find any issues, they may be submitted to our [bug tracker](https://simp-project.atlassian.net/).

## Setup

### What simp_ipa affects

The ``simp_ipa`` module is quite minimal at the moment, it can only join and
remove hosts from an IPA domain.

## Usage

The ``simp_ipa`` class is a just a placeholder for now.

``simp_ipa::client::install`` and related parameters will run ``ipa-client-install`` on systems if it needs it. You can either use discovery
(provided you have DNS set up correctly) or manually set all the parameters
required. See the reference material for further documentation.

### Tasks

Join a domain using `ipa-client-install`:

```shell
bolt task run simp_ipa::join --nodes <nodes> server=ipa.example.com options='--verbose --mkhomedir'
```

Other options can be added to the `options` parameter, like
`options='--mkhomedir --verbose'`.

Leave a domain:

```shell
bolt task run simp_ipa::leave --nodes <nodes> domain=<domain> options='--verbose'
```

Tasks are also available from the [Puppet Enterprise console](https://puppet.com/docs/pe/2018.1/running_tasks.html).


## Development

Please read our [Contribution Guide](https://simp.readthedocs.io/en/stable/contributors_guide/index.html).

### Acceptance tests

This module includes [Beaker](https://github.com/puppetlabs/beaker) acceptance
tests using the SIMP [Beaker Helpers](https://github.com/simp/rubygem-simp-beaker-helpers).
By default the tests use [Vagrant](https://www.vagrantup.com/) with
[VirtualBox](https://www.virtualbox.org) as a back-end; Vagrant and VirtualBox
must both be installed to run these tests without modification. To execute the
tests run the following:

```shell
bundle install
bundle exec rake beaker:suites
```

**NOTE:** When testing this module, you will probably want to run with
``BEAKER_destroy=no``, install the ``simp_ipa`` client locally and connect to the
running VM to ensure proper functionality.

Please refer to the [SIMP Beaker Helpers documentation](https://github.com/simp/rubygem-simp-beaker-helpers/blob/master/README.md)
for more information.
