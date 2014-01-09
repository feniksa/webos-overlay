EAPI="5"
inherit cmake-utils

DESCRIPTION="The Open webOS logging library"
HOMEPAGE="https://github.com/openwebos/pmloglib"
SLOT="0"

KEYWORDS="amd64"
LICENSE="LGPL-2.1"
SRC_URI="https://github.com/openwebos/${PN}/archive/submissions/${PV}.zip -> ${P}.zip"

S="${WORKDIR}/${PN}-submissions-${PV}"

RDEPEND="dev-libs/libpbnjson"
DEPEND="dev-util/cmake-modules-webos
		${RDEPEND}"

src_prepare() {
 	epatch "${FILESDIR}/0001-Add-to-pkgconfig-file-pbnjson-library-dependency.patch"
    cmake-utils_src_prepare
}

