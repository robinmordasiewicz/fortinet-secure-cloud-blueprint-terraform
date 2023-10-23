package policy

default all_policies = false

import input as params

all_policies {
	#loop for each resource
	checkPoliciesForResource(params.changedResources[_])
}

checkPoliciesForResource(resource) {
	checkTags(resource)
}
