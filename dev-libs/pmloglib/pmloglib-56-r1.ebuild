# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

inherit webos-cmake webos-github cmake-utils

DESCRIPTION="The Open webOS logging library"
HOMEPAGE="https://github.com/openwebos/pmloglib"

KEYWORDS="amd64"
LICENSE="Apache-2.0"
IUSE="-loggingon -parseonly"

DEPEND="dev-libs/glib
		dev-libs/libpbnjson
		parseonly? ( dev-libs/nyx-lib )
		"

SLOT="private"

src_prepare() {
	epatch "${FILESDIR}/0001-Add-to-pkgconfig-file-pbnjson-library-dependency.patch"
	cmake-utils_src_prepare
}

src_configure() {
	mycmakeargs+=(
		$(cmake-utils_use_enable loggingon   LOGGING)
		$(cmake-utils_use		 parseonly   PARSE_DEFAULT_ONLY)
		-DBUILD_PRIVATE:BOOL=ON
	)

	webos-cmake_src_configure
}

src_install() {
	cmake-utils_src_install
	rm -rf "${D}/etc/pmlog.d" || die "Can't remove pmlog.d, please, recheck ebuild"
}
