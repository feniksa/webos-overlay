EAPI="5"
inherit cmake-utils

DESCRIPTION="The Open webOS logging library"
HOMEPAGE="https://github.com/openwebos/pmloglib"
SLOT="0"

KEYWORDS="amd64"
LICENSE="LGPL-2.1"
SRC_URI="https://github.com/openwebos/${PN}/archive/submissions/${PV}.zip -> ${P}.zip"

S="${WORKDIR}/${PN}-submissions-${PV}"

RDEPEND="gentoo_webos/libpbnjson"
DEPEND="gentoo_webos/cmake-modules-webos
		${RDEPEND}"

src_configure() {
 	local mycmakeargs=(
		"-DCMAKE_INSTALL_PREFIX:PATH=/opt/webos"
		"-DWEBOS_INSTALL_ROOT:PATH=/opt/webos"
	)
	cmake-utils_src_configure 
}

src_compile() {
	cmake-utils_src_compile
}
