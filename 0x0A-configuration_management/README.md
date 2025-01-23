# Puppet Project

## Overview
This project contains Puppet manifests to automate system configurations and application deployments on Ubuntu 20.04 LTS.

## Files
- `webserver.pp`: Installs and configures Apache web server.
- `database.pp`: Sets up MySQL database server.
- `firewall.pp`: Configures UFW firewall rules.

## Requirements
- Ubuntu 20.04 LTS
- Puppet installed on the system
- puppet-lint version 2.1.1 for validation

## Usage
To apply a manifest, use the following command:
```bash
sudo puppet apply <manifest_file>.pp
