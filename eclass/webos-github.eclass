# Copyright 2014-2015 Maksym Sditanov <feniksa@rambler.ru>
# Distributed under the terms of the Apache 2 License
# $Header: $

# ELASS: webos-github.eclass
# @MAINTAINER:
# Maksym Sditanov
# @BLURB: Eclass for fetching project from github
# @DESCRIPTION:
# This eclass is ment to easy writting ebuilds for webos. It setup some predevined env variables

if [ "${PV}" != "9999" ]; then
	inherit versionator

	MAJORV=$(get_major_version)
	SRC_URI="https://github.com/openwebos/${PN}/archive/submissions/${MAJORV}.zip -> ${P}.zip"
	S="${WORKDIR}/${PN}-submissions-${MAJORV}"
else
	inherit git-r3

	EGIT_REPO_URI="git://github.com/openwebos/${PN}.git"
fi

EXPORT_FUNCTIONS pkg_setup

webos-github_pkg_setup() {
	[ "${PV}" = "9999" ] || return
	eval "URI=\$${PN}_LIVE_REPO"
	if [ -z "$URI" ]; then
		ewarn "Public repo is severly outdated. If you have access to current repo set"
		ewarn "\"${PN}_LIVE_REPO\" variable pointing to it. In addition, if you want to use"
		ewarn "another branch, you can set it via \"${PN}_LIVE_BRANCH\" variable."
		ewarn "This can be done, for example, by executing"
		ewarn "  echo '${PN}_LIVE_REPO=\"git://<your_mirror>/g2g.lgsvl.com/${PN}\"' >> /etc/portage/env/webos-live.conf"
		ewarn "  echo '${PN}_LIVE_BRANCH=\"develop\"' >> /etc/portage/env/webos-live.conf"
		ewarn "  echo '${CATEGORY}/${PN} webos-live.conf' >> /etc/portage/package.env"
	fi
}
