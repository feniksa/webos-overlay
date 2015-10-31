# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"
inherit webos-cmake webos-github

DESCRIPTION="Open webOS component to manage all running activities."
HOMEPAGE="https://github.com/openwebos/activitymanager"
SLOT="0"

KEYWORDS="amd64"
LICENSE="LGPL-2.1"

RDEPEND="dev-db/configurator"
DEPEND="dev-libs/pmloglib
		dev-db/db8
		dev-libs/nyx-lib
		"

src_install() {
	cmake-utils_src_install

	newinitd "${FILESDIR}/activitymanager" activitymanager

	# remove even'd files as we doesn't support them
	rm -rf "${D}"/etc/event.d || die "Can't remove event.d files, recheck ebuild"
	rm -rf "${D}"/etc/init || die "Can't remove init dir, ebuild error"
}
