# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/www-client/firefox/firefox-20.0.1.ebuild,v 1.2 2013/04/16 05:45:35 polynomial-c Exp $

EAPI="5"

inherit cmake-utils

DESCRIPTION="CMake modules needed to build Open webOS components"
HOMEPAGE="https://github.com/openwebos/cmake-modules-webos"
SLOT="0"

KEYWORDS="amd64"
LICENSE="LGPL-2.1"
SRC_URI="https://github.com/openwebos/cmake-modules-webos/archive/submissions/${PV}.zip"
S="${WORKDIR}/cmake-modules-webos-submissions-${PV}"

DEPEND="dev-util/cmake"

src_configure() {
	cmake-utils_src_configure
}

src_compile() {
	cmake-utils_src_compile
}
