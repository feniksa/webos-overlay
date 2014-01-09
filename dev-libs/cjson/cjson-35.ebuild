# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/www-client/firefox/firefox-20.0.1.ebuild,v 1.2 2013/04/16 05:45:35 polynomial-c Exp $

EAPI="5"
inherit autotools eutils

DESCRIPTION="Cjson library for webos"
HOMEPAGE="https://github.com/openwebos/cjson"
SLOT="0"

KEYWORDS="amd64"
LICENSE="LGPL-2.1"
SRC_URI="https://github.com/openwebos/${PN}/archive/submissions/${PV}.zip -> ${P}.zip"
S="${WORKDIR}/${PN}-submissions-${PV}"

DEPEND="
	dev-util/cmake-modules-webos
"

src_prepare() {
	eautoreconf
}

src_configure() {	
	local myconf="--enable-shared --disable-static"
	econf ${myconf} 
}

src_compile() {
	emake
}

src_install() {
	einstall
}
