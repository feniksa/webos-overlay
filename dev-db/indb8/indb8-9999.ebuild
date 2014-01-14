EAPI="5"
inherit cmake-utils

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

DEPEND="dev-libs/luna-service2 
		dev-libs/glib 
		dev-libs/icu"

src_configure() {
		PKG_CONFIG_PATH=/opt/webos/usr/lib64/pkgconfig:/opt/webos/usr/share/pkgconfig
        local mycmakeargs=(
                "-DCMAKE_INSTALL_PREFIX:PATH=/opt/webos"
                "-DWEBOS_INSTALL_ROOT:PATH=/opt/webos"
        )
        cmake-utils_src_configure
}

