#!/bin/bash
set -x
open $1
fhc target $1
fhc login <login> <password>
OUTPUT=`fhc services create bd_deleteme`

#OUTPUT='{ "type": "CONNECTOR", "template": null, "guid": "7fn2s73hovn62qg6qxpiobvt", "title": "bd_deleteme", "sysOwner": "ds67hywp3wbdcmny73yjelrg", "sysModified": 1473335767541, "sysVersion": 0, "featured": false, "sysCreated": 1473335767540, "apps": [ { "scmCacheKey": "01a33f7ec00f24e69fac3070a30f0322", "hierarchy": null, "description": "", "domain": "agigante", "type": "cloud_nodejs", "template": null, "email": "support@example.com", "guid": "7fn2s75zc47cep5taavpnb43", "title": "bd_deleteme", "sysOwner": "ds67hywp3wbdcmny73yjelrg", "legacy": false, "gitRefs": {}, "sysModified": 1473335768557, "sysVersion": 1, "sourcePath": "", "embed": false, "gitApp": true, "deployedGitRefs": {}, "sysCreated": 1473335767594, "scmUrl": "git@git.ted.redhatmobile.com:agigante/bd_deleteme-bd_deleteme-2.git", "scmKey": null, "scmBranch": "master", "internallyHostedRepo": true, "client": false, "newApp": true, "targetable": true, "apiKey": "bbd620c194a803ab7f5d11516300c4d0abbdff13", "windowsPhonePushInformation": null, "androidPushInfo./servicetest.sh: line 6: echo: write error: Resource temporarily unavailable'

echo $OUTPUT
GUID="$(echo $OUTPUT | awk '{print $7}')" 

#remove comma
GUID=${GUID/,}

# remove 1st double quote
GUID=${GUID/'"'} 

# remove 2nd double quote
GUID=${GUID/'"'} 
fhc services delete $GUID
