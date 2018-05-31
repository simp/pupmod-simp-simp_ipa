[![License](https://img.shields.io/:license-apache-blue.svg)](http://www.apache.org/licenses/LICENSE-2.0.html)
[![CII Best Practices](https://bestpractices.coreinfrastructure.org/projects/73/badge)](https://bestpractices.coreinfrastructure.org/projects/73)
[![Puppet Forge](https://img.shields.io/puppetforge/v/simp/simp_ipa.svg)](https://forge.puppetlabs.com/simp/simp_ipa)
[![Puppet Forge Downloads](https://img.shields.io/puppetforge/dt/simp/simp_ipa.svg)](https://forge.puppetlabs.com/simp/simp_ipa)
[![Build Status](https://travis-ci.org/simp/pupmod-simp-simp_ipa.svg)](https://travis-ci.org/simp/pupmod-simp-simp_ipa)


#### Table of Contents

* [Description](#description)
  * [This is a SIMP module](#this-is-a-simp-module)
* [Setup](#setup)
  * [What simp_ipa affects](#what-simp_ipa-affects)
* [Usage](#usage)
* [Development](#development)
  * [Acceptance tests](#acceptance-tests)

## Description

This is a module for managing ``simp_ipa`` server and client installations.

### This is a SIMP module

This module is a component of the [System Integrity Management Platform](https://simp-project.com), a
compliance-management framework built on Puppet.

If you find any issues, they may be submitted to our [bug tracker](https://simp-project.atlassian.net/).

## Setup

### What simp_ipa affects

The ``simp_ipa`` module is quite minimal, like ``simp_ipa`` itself and simply installs
the required packages and allows you to configure the most common files with
safe defaults in place.

## Usage

The ``simp_ipa`` client is installed by default. To disable this, set
``simp_ipa::client`` to ``false`` in Hiera.

To install and configure the ``simp_ipa`` server, set ``simp_ipa::server`` to ``true`` in Hiera.

``simp_ipa`` requires a functioning window manager on the server to be useful and
it does not perform well with compositing window managers, such as GNOME 3.

See https://wiki.simp_ipa.org/doku.php/doc:de-compat for additional information.

It is recommended that you use the SIMP [gnome module](https://github.com/simp/pupmod-simp-gnome)
and set ``enable_mate`` to use the MATE window manager (or GNOME 2 if MATE is
not available).

**NOTE:** The ``simp_ipa`` server clipboard is set to ``server`` by default. This
means that the client clipboard will not be exposed to the server to which you
are connecting. This is done to prevent sensitive information from the client
leaking onto the server by accident.

You can change this by setting the following in Hiera:

```yaml
---
simp_ipa::server::agent_options:
  '-clipboard': 'both'
```

Valid options include:

  * ``both``   => Bi-directional clipboard
  * ``server`` => Server side and Server to Client
  * ``client`` => Client side and Client to Server
  * ``none``   => Disable the clipboard

## Development

Please read our [Contribution Guide](http://simp-doc.readthedocs.io/en/stable/contributors_guide/index.html).

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
