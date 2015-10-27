EAPI=5

inherit webos-cmake webos-github

DESCRIPTION="A JSON engine, implemented as a pair of libraries with APIs for
easier C and C++ abstraction over the core PBNJSON library."
HOMEPAGE="https://github.com/openwebos/libpbnjson"
SLOT="0"

KEYWORDS=""
LICENSE="Apache-2.0"
IUSE="nolog"

# boost required for executable which never installed, but always compiled
DEPEND="
	dev-libs/lemon
	sys-devel/flex
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
		$(cmake-utils_use nolog NO_LOGGING)
	)
	webos-cmake_src_configure
}
