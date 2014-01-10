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
 	local mycmakeargs=(
		"-DCMAKE_INSTALL_PREFIX:PATH=/opt/webos"
		"-DWEBOS_INSTALL_ROOT:PATH=/opt/webos"
	)
	cmake-utils_src_configure 
}

src_compile() {
	cmake-utils_src_compile
}
