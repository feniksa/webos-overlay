EAPI="5"

inherit cmake-utils webos-github

DESCRIPTION="CMake modules needed to build Open webOS components"
HOMEPAGE="https://github.com/openwebos/cmake-modules-webos"
SLOT="0"

KEYWORDS="amd64"
LICENSE="LGPL-2.1"
DEPEND="dev-util/cmake"

src_configure() {
 	local mycmakeargs=(
		"-DCMAKE_INSTALL_PREFIX:PATH=/"
		"-DWEBOS_INSTALL_ROOT:PATH=/"
		"-DWEBOS_INSTALL_LIBDIR:PATH=/usr/lib/"
	)
	cmake-utils_src_configure 
}

src_compile() {
	cmake-utils_src_compile
}
