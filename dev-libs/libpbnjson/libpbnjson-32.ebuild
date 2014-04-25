EAPI="5"
inherit cmake-utils

DESCRIPTION="A JSON engine, implemented as a pair of libraries with APIs for
easier C and C++ abstraction over the core PBNJSON library."
HOMEPAGE="https://github.com/openwebos/libpbnjson"
SLOT="0"

KEYWORDS="amd64"
LICENSE="LGPL-2.1"
SRC_URI="https://github.com/openwebos/${PN}/archive/submissions/${PV}.zip -> ${P}.zip"

S="${WORKDIR}/${PN}-submissions-${PV}"

RDEPEND="dev-libs/cjson"
DEPEND="dev-util/cmake-modules-webos
		dev-libs/uriparser
		dev-libs/yajl
		dev-libs/lemon
		${RDEPEND}"

src_prepare() {
    cmake-utils_src_prepare
	epatch "${FILESDIR}/0001-Add-to-pbnjson_-.pc-dependecy-from-cjson.patch"
}

src_configure() {
 	local mycmakeargs=(
		"-DCMAKE_INSTALL_PREFIX:PATH=/opt/webos"
		"-DWEBOS_INSTALL_ROOT:PATH=/opt/webos"
		"-DNO_LOGGING=true"
	)
	cmake-utils_src_configure 
}
