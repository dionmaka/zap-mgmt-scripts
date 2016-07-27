# Commit all of the changes from develop to coverity_scan
# Requires a ~/.netrc-api file present with valid credentials

git config --global user.name "zapbot"
git config --global user.email "zapbot@zaproxy.org"

# Assume we're running in the zap-mgmt-scripts directory
cd ..

cd zaproxy_coverity
git rebase upstream/develop
git push origin coverity_scan --force
curl --data '{ "title": "Update coverity_scan from develop",  "body": "Autogenerated PR from zapbot",  "head": "zapbot:coverity_scan",  "base": "coverity_scan" }' --netrc-file ~/.netrc-api https://api.github.com/repos/zaproxy/zaproxy/pulls
cd ..
