# puppet-capitains
Puppet Module for CapiTainS deployment

## Installing

```bash
wget https://apt.puppetlabs.com/puppetlabs-release-pc1-xenial.deb
dpkg -i puppetlabs-release-pc1-xenial.deb
apt-get update
apt-get install puppet-agent
```

### Setting up

```bash
sudo adduser www-data
sudo mkdir /local/www-data
sudo chown -R www-data:www-data /local/www-data
sudo mkdir /etc/gunicorn.d
```

### puppet-run.sh

```bash
#Bridget Almas @balmas
cd /local/puppet && timeout 180 git pull
/opt/puppetlabs/bin/puppet apply --modulepath=/local/puppet/modules --hiera_config=/local/puppet/hiera.yaml /local/puppet/manifests
```

### Run install

```bash
sudo sh puppet-run.sh
```

## If you have unfound dependencies

```bash
/opt/puppetlabs/bin/puppet module list --tree --modulepath=/local/puppet/modules --hiera_config=/local/puppet/hiera.yaml
```

## Hiera Support

Defining CapiTainS resources in Hiera.

```yaml
  capitains::domain: 'cts.example.org'
  capitains::www_root: '/tmp/capitains'
  capitains::data_root: '/mnt/data'
  capitains::app_root: '/usr/local/capitains'
  capitains::venvdir: "%{hiera('capitains::app_root')}/venvs"
  capitains::redis_host: 'localhost'
  capitains::workdir: '/usr/local/capitains_work'
  capitains::ci_url: 'http://ci.perseids.org/api/rest/v1.0/code/'
  capitains::repo_base_url: 'https://github.com/'
  capitains::repos: 
    - name: 'canonical-latinLit'
      cibase: 'PerseusDL/canonical-latinLit'
      url: 'https://github.com/PerseusDL/canonical-latinLit'
    - name: 'canonical-greekLit'
      cibase: 'PerseusDL/canonical-greekLit'
      url: 'https://github.com/PerseusDL/canonical-greekLit'
    - name: 'canonical-farsiLit'
      cibase: 'PerseusDL/canonical-farsiLit'
      url: 'https://github.com/PerseusDL/canonical-farsiLit'
    - name: 'canonical-pdlpsci'
      cibase: 'PerseusDL/canonical-pdlpsci'
      url: 'https://github.com/PerseusDL/canonical-pdlpsci'
    - name: 'csel-dev'
      cibase: 'OpenGreekAndLatin/csel-dev'
      url: 'https://github.com/OpenGreekAndLatin/csel-dev'
    - name: 'canonical-pdlrefwk'
      cibase: 'PerseusDL/canonical-pdlrefwk'
      url: 'https://github.com/PerseusDL/canonical-pdlrefwk'
```
