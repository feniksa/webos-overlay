EAPI="5"
inherit webos-cmake

DESCRIPTION="novacom provides a command line interface to the novacomd daemon."
HOMEPAGE="https://github.com/openwebos/novacom/"
SLOT="0"

KEYWORDS="amd64"
LICENSE="LGPL-2.1"
SRC_URI="https://github.com/feniksa/${PN}/archive/submissions/${PV}.zip -> ${P}.zip"

S="${WORKDIR}/${PN}-submissions-${PV}"

