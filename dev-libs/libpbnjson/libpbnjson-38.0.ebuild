EAPI=6

inherit webos-cmake webos-github

DESCRIPTION="Palm's Better Native JSON library"
HOMEPAGE="https://github.com/openwebos/libpbnjson"
SLOT="0"

KEYWORDS="x86 amd64 ~arm"
LICENSE="Apache-2.0"
IUSE="nolog"

# boost required for executable which never installed, but always compiled
DEPEND="
	>=dev-util/cmake-modules-webos-9
	dev-libs/lemon
	dev-libs/boost
"
RDEPEND="
	>=dev-libs/glib-2.30
	dev-libs/gmp
	dev-libs/uriparser
	dev-libs/yajl
	!nolog? ( dev-libs/pmloglib )
"

src_configure() {
	local mycmakeargs+=(
		-DNO_LOGGING="$(usex nolog)"
	)
	webos-cmake_src_configure
}
