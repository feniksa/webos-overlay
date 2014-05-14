EAPI="5"
inherit webos-cmake

DESCRIPTION="Open webOS Platform Portability Layer"
HOMEPAGE="https://github.com/openwebos/nyx-lib"
SLOT="0"

KEYWORDS="amd64"
LICENSE="LGPL-2.1"
SRC_URI="https://github.com/openwebos/${PN}/archive/submissions/${PV}.zip -> ${P}.zip"

S="${WORKDIR}/${PN}-submissions-${PV}"

DEPEND="dev-libs/glib"
