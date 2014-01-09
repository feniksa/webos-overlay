EAPI="5"
inherit cmake-utils

DESCRIPTION="Open webOS Luna System Bus library, daemon, and utilities"
HOMEPAGE="https://github.com/openwebos/luna-service2"
SLOT="0"

KEYWORDS="amd64"
LICENSE="LGPL-2.1"
SRC_URI="https://github.com/openwebos/${PN}/archive/submissions/${PV}.zip -> ${P}.zip"
S="${WORKDIR}/${PN}-submissions-${PV}"

DEPEND="dev-util/cmake
		gentoo_webos/pmloglib"

src_configure() {
	PKG_CONFIG_PATH=/opt/webos/lib64/pkgconfig:/opt/webos/usr/share/pkgconfig

 	local mycmakeargs=(
		"-DCMAKE_INSTALL_PREFIX:PATH=/opt/webos"
		"-DWEBOS_INSTALL_ROOT:PATH=/opt/webos"
	)
	cmake-utils_src_configure
}

src_compile() {
	export LDPATH="/opt/webos/lib64"
	cmake-utils_src_compile
}
