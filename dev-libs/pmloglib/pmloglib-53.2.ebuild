# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"
inherit webos-cmake webos-github

DESCRIPTION="The Open webOS logging library"
HOMEPAGE="https://github.com/openwebos/pmloglib"
SLOT="0"

KEYWORDS="amd64"
LICENSE="Apache-2.0"
DEPEND="dev-libs/libpbnjson"

src_prepare() {
	epatch "${FILESDIR}/0001-Add-to-pkgconfig-file-pbnjson-library-dependency.patch"
	cmake-utils_src_prepare
}
