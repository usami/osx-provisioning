#!/bin/bash -e

echo "Setup Ansible"

sudo xcodebuild -license
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install ansible git

echo "Clone playbooks"
git clone https://github.com/usami/osx-provisioning ~/src/osx-provisioning

echo "Start provisioning"

cd ~/src/osx-provisioning
HOMEBREW_CASK_OPTS="--appdir=/Applications" ansible-playbook osx.yml
