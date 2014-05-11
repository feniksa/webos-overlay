EAPI="5"
inherit webos-cmake

DESCRIPTION="A JSON engine, implemented as a pair of libraries with APIs for
easier C and C++ abstraction over the core PBNJSON library."
HOMEPAGE="https://github.com/openwebos/libpbnjson"
SLOT="0"

KEYWORDS="amd64"
LICENSE="LGPL-2.1"
SRC_URI="https://github.com/openwebos/${PN}/archive/submissions/${PV}.zip -> ${P}.zip"

S="${WORKDIR}/${PN}-submissions-${PV}"

DEPEND="dev-libs/cjson
		dev-libs/uriparser
		dev-libs/yajl
		dev-libs/lemon"

src_prepare() {
    cmake-utils_src_prepare
	epatch "${FILESDIR}/0001-Add-to-pbnjson_-.pc-dependecy-from-cjson.patch"
}

src_configure() {
 	local mycmakeargs+=(
		-DNO_LOGGING=true
	)
	webos-cmake_src_configure 
}
