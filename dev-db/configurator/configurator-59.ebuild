EAPI="5"
inherit webos-cmake

DESCRIPTION="Creates the database schema for webos Applications"
HOMEPAGE="https://github.com/openwebos/configurator"
SLOT="0"

KEYWORDS="amd64"
LICENSE="LGPL-2.1"
SRC_URI="https://github.com/openwebos/${PN}/archive/submissions/${PV}.zip -> ${P}.zip"
S="${WORKDIR}/${PN}-submissions-${PV}"

DEPEND="dev-db/db8
		dev-libs/pmloglib
	   "

src_install() {
	cmake-utils_src_install

	rm -r "${D}"/etc/event.d || die "Can't remove event.d dir, please, recheck ebuild"
	rm -r "${D}"/etc/init || die "Can't remove init dir, please, recheck ebuild"

#	dodir /var/db/main
#	dodir /var/db/temp

#	newinitd "${FILESDIR}/db8-maindb" db8-maindb
#	newinitd "${FILESDIR}/db8-tempdb" db8-tempdb

}

