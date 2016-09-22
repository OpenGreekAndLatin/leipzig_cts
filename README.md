# puppet-capitains
Puppet Module for CapiTainS deployment

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
