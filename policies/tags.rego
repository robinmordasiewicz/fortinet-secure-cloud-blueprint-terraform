package policy

checkTags(resource) {
	tags = readTags(resource.type, resource)
	ensureMandatoryTags(tags)
}

readTags("azurerm_linux_virtual_machine", resource) = tags {
	tags = resource.changedAttributes.tags
}

ensureMandatoryTags(tags) {
	checkTagHasValue(tags.Owner)
}

checkTagHasValue(tag) {
	re_match("[^\\s]+", tag.value)
}
