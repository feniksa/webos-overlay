EAPI="5"
inherit cmake-utils

DESCRIPTION="Supper truper db8"
HOMEPAGE="https://github.com/feniksa/indb8"
SLOT="0"

KEYWORDS="amd64"
LICENSE="LGPL-2.1"

if [[ ${PV} = *9999* ]]; then
	inherit git-2
	EGIT_REPO_URI="git://github.com/feniksa/indb8.git"
	EGIT_BRANCH="master"
	KEYWORDS=""
else
    SRC_URI="https://github.com/downloads/feniksa/indb8/indb8-${PV}.tar.bz2"
    KEYWORDS="~amd64 ~x86"
    S="${WORKDIR}/indb8-${PV}"
fi

RDEPEND="dev-libs/icu"
DEPEND="gentoo_webos/luna-service2
                ${RDEPEND}"

src_configure() {
        local mycmakeargs=(
                "-DCMAKE_INSTALL_PREFIX:PATH=/opt/webos"
                "-DWEBOS_INSTALL_ROOT:PATH=/opt/webos"
        )
        cmake-utils_src_configure
}

src_compile() {
        cmake-utils_src_compile
}
