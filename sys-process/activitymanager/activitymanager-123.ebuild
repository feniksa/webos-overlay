EAPI="5"
inherit webos-cmake versionator

DESCRIPTION="Open webOS component to manage all running activities."
HOMEPAGE="https://github.com/openwebos/activitymanager"
SLOT="0"

KEYWORDS="amd64"
LICENSE="LGPL-2.1"
MAJORV=$(get_major_version)
SRC_URI="https://github.com/openwebos/${PN}/archive/submissions/${MAJORV}.zip -> ${P}.zip"
S="${WORKDIR}/${PN}-submissions-${MAJORV}"

RDEPEND="dev-db/configurator"
DEPEND="dev-libs/pmloglib
		dev-db/db8
		dev-libs/nyx-lib
		"

#src_prepare() {
#    cmake-utils_src_prepare
#    epatch "${FILESDIR}/add_pmloglib_dependency.patch"
#}

src_install() {
	cmake-utils_src_install

	newinitd "${FILESDIR}/activitymanager" activitymanager 
#	newinitd "${FILESDIR}/ls-hubd-pub" ls-hubd-pub

	# remove even'd files as we doesn't support them
	rm -rf "${D}"/etc/event.d || die "Can't remove event.d files, recheck ebuild"
	rm -rf "${D}"/etc/init || die "Can't remove init dir, ebuild error"
}
