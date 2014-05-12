EAPI="5"
inherit webos-cmake

DESCRIPTION="Utility to communicate with a target device over USB or TCP/IP."
HOMEPAGE="https://github.com/openwebos/novacomd/t"
SLOT="0"

KEYWORDS="amd64"
LICENSE="LGPL-2.1"
SRC_URI="https://github.com/openwebos/${PN}/archive/submissions/${PV}.zip -> ${P}.zip"

S="${WORKDIR}/${PN}-submissions-${PV}"

DEPEND="dev-libs/libusb"

src_configure() {
	local mycmakeargs+=(
	    -DWEBOS_TARGET_MACHINE_IMPL=host
	)

	webos-cmake_src_configure 
}

src_install() {
	cmake-utils_src_install

	rm "${D}"/opt/webos/etc/event.d/novacomd || die "This install doesn't provide upstart file Novacomd. Please, re-check ebuild"

	newinitd "${FILESDIR}/novacomd" novacomd
}

