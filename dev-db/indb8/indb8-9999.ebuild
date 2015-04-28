EAPI="5"
inherit webos-cmake

DESCRIPTION="A userspace service that provides access to the Open webOS database"
HOMEPAGE="https://github.com/openwebos/db8"
SLOT="0"
IUSE="tests"

KEYWORDS="amd64"
LICENSE="Apache-2.0"

if [[ ${PV} = *9999* ]]; then
	inherit git-2
	EGIT_REPO_URI="git://github.com/feniksa/indb8.git"
	EGIT_BRANCH="master"
	KEYWORDS=""
else
	SRC_URI="https://github.com/feniksa/${PN}/archive/submissions/${PV}.zip -> ${P}.zip"
    KEYWORDS="amd64"
	S="${WORKDIR}/${PN}-submissions-${PV}"
fi

DEPEND="	sys-process/luna-service2 
		dev-libs/glib 
		dev-libs/leveldb
		dev-libs/icu
		!!dev-db/db8"

src_install() {
	cmake-utils_src_install
	
	dodir /var/db/main
	dodir /var/db/temp
	newinitd "${FILESDIR}/indb8-maindb" indb8-maindb
	newinitd "${FILESDIR}/indb8-tempdb" indb8-tempdb
}
