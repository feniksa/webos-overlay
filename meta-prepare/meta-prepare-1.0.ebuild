EAPI=5

DESCRIPTION="Meta package for configuring /opt/webos"
HOMEPAGE="https://github.com/feniksa/gentoo_webos"

LICENSE="APACHE-2"
SLOT=0
KEYWORDS="amd64"

DEPEND=""
RDEPEND=""

pkg_setup() {
	mkdir -p /opt/webos || die "can't create chroot dir /opt/webos" 
	
	mkdir -p /opt/webos/lib64 || die "can't create /opt/webos/lib64"
	mkdir -p /opt/webos/usr/lib64 || die "can't create /opt/webos/usr/lib64"

	ln -s /opt/webos/usr/lib64 /opt/webos/usr/lib || die "can't create symlinks"
	ln -s /opt/webos/lib64 /opt/webos/lib
}

pkg_postinst() {
	echo
	einfo "Created /opt/webos"
	echo
}
