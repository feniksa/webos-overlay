EAPI="5"
inherit webos-cmake webos-github

DESCRIPTION="A JSON engine, implemented as a pair of libraries with APIs for
easier C and C++ abstraction over the core PBNJSON library."
HOMEPAGE="https://github.com/openwebos/libpbnjson"
SLOT="0"

KEYWORDS="amd64"
LICENSE="Apache2"
IUSE="nolog"

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
		$(cmake-utils_use nolog NO_LOGGING)
	)
	webos-cmake_src_configure
}
