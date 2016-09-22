# Script which retrieves the latest build results from the Hook CI API
# and removes any TEI file from the filesystem which is reported as failing
import json,urllib.request,codecs,os,re
from optparse import OptionParser
parser = OptionParser()
parser.add_option('-c',dest="ci_base",help="CI API Base URL (include trailing slash)")
parser.add_option('-r',dest="repos",help="Repo Name")
parser.add_option('-b',dest="base_dir",help="Base directory of repos (include trailing slash)")
(options, args) = parser.parse_args()
build_results = {}

print("Retrieving build info for " + options.repos)
data = urllib.request.urlopen(str(options.ci_base + options.repos))
reader = codecs.getreader("utf-8")
parsed = json.load(reader(data))
for j in parsed['logs']:
    # if the last test shows 100% coverage, we're done
    if j['coverage'] == 100:
        print("Coverage for " + options.repos + " 100%")
        break
    else:
        results = urllib.request.urlopen(str(options.ci_base + options.repos + "?uuid=" + j['uuid']))
        parsed_results = json.load(reader(results))
        # take the first build which has any unit test results
        if (len(parsed_results['units']) > 0):
            build_results = parsed_results['units']
            break
to_remove = []
for f in build_results:
    #skip the __cts__.xml files we just want to know which tei files to kill
    if (f[0]  != '__cts__.xml' and not f[1]):
        p = re.compile(str('^.*?' + options.repos))
        path = options.base_dir + p.sub('',f[0])
        to_remove.append(path)

for f in to_remove:
  print ("Removing " + f)
  os.remove(f)
