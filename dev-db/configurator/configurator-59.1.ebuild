EAPI="5"
inherit webos-cmake versionator

DESCRIPTION="Creates the database schema for webos Applications"
HOMEPAGE="https://github.com/openwebos/configurator"
SLOT="0"

KEYWORDS="amd64"
LICENSE="Apache2"
MAJORV=$(get_major_version)
SRC_URI="https://github.com/openwebos/${PN}/archive/submissions/${MAJORV}.zip -> ${P}.zip"
S="${WORKDIR}/${PN}-submissions-${MAJORV}"

DEPEND="dev-db/db8
		dev-libs/pmloglib
	   "

src_install() {
	cmake-utils_src_install

	rm -r "${D}"/etc/event.d || die "Can't remove event.d dir, please, recheck ebuild"
	rm -r "${D}"/etc/init || die "Can't remove init dir, please, recheck ebuild"

	newinitd "${FILESDIR}/configurator" configurator

}

