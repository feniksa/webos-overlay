EAPI="5"
inherit webos-cmake

DESCRIPTION="Open webOS Platform Portability Layer"
HOMEPAGE="https://github.com/openwebos/nyx-lib"
SLOT="0"

KEYWORDS="amd64"
LICENSE="LGPL-2.1"
SRC_URI="https://github.com/openwebos/${PN}/archive/submissions/${PV}.zip -> ${P}.zip"

S="${WORKDIR}/${PN}-submissions-${PV}"

DEPEND="dev-libs/glib
		dev-libs/nyx-lib"

src_install() {
	rm -f "${D}"/etc/udev/rules.d/99-nyx-modules.rules || die "Can't remove udev rule. Check ebuild"
	insinto /lib/udev/rules.d
	newins "${S}/files/conf/99-nyx-modules.rules" 99-nyx-modules.rules
}
