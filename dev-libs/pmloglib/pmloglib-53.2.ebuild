EAPI="5"
inherit webos-cmake webos-github

DESCRIPTION="The Open webOS logging library"
HOMEPAGE="https://github.com/openwebos/pmloglib"
SLOT="0"

KEYWORDS="amd64"
LICENSE="Apache2"

DEPEND="dev-libs/libpbnjson"

src_prepare() {
 	epatch "${FILESDIR}/0001-Add-to-pkgconfig-file-pbnjson-library-dependency.patch"
    cmake-utils_src_prepare
}

