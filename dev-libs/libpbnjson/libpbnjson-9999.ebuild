EAPI=5

inherit webos-cmake webos-github

DESCRIPTION="A JSON engine, implemented as a pair of libraries with APIs for
easier C and C++ abstraction over the core PBNJSON library."
HOMEPAGE="https://github.com/openwebos/libpbnjson"
SLOT="0"

KEYWORDS=""
LICENSE="Apache2"

DEPEND="
	dev-libs/lemon
	sys-devel/flex
"
RDEPEND="
	>=dev-libs/glib-2.30
	dev-libs/gmp
	dev-libs/uriparser
	dev-libs/yajl
"
