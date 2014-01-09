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

src_prepare() {
    cmake-utils_src_prepare
    epatch "${FILESDIR}/0001-Add-to-pkgconfig-file-pbnjson-library-dependency.patch"
}


src_configure() {
	PKG_CONFIG_PATH=/opt/webos/lib64/pkgconfig:/opt/webos/usr/share/pkgconfig
 	local mycmakeargs=(
		"-DCMAKE_INSTALL_PREFIX:PATH=/opt/webos"
		"-DWEBOS_INSTALL_ROOT:PATH=/opt/webos"
	)
	cmake-utils_src_configure 
}

src_compile() {
	cmake-utils_src_compile
}
