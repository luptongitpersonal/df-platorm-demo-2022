sfdx shane:org:create -f config/project-scratch-def.json -d 5 -s --wait 60 --userprefix data -o mask.demo
# sfdx plugins:install shane-sfdx-plugins
# Find the latest version of the package at https://sfdc.co/datamask-install, and copy that id from the url to the below line
# Install Datamask
sfdx force:package:install -w 20 -r -p 04t3k0000027CCn
# Install DevOps Center
sfdx force:package:install -w 20 -r -p 04t6g000008fi8bAAA
# Set up Datamase user and Permissions
sfdx shane:user:psl -l User -g User -n datamask_DataMaskUserPsl
sfdx shane:user:permset:assign -l User -g User -n datamask

# Push code to org
sfdx force:source:push
sfdx shane:user:password:set -g User -l User -p salesforce1
sfdx force:org:open -p /lightning/o/Contact/list?filterName=AllContacts
