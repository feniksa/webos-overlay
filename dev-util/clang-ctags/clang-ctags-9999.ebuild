EAPI=7
PYTHON_COMPAT=( python3_{6,7,8} )

inherit eutils

DESCRIPTION="Generate tag file for C++ source code"
HOMEPAGE="https://github.com/drothlis/clang-ctags"
LICENSE="UIUC"

if [[ ${PV} = *9999* ]]; then
        inherit git-r3
        EGIT_REPO_URI="https://github.com/drothlis/clang-ctags.git"
        SRC_URI=""
        KEYWORDS=""
else
        SRC_URI="https://github.com/drothlis/clang-ctags/archive/{P}.tar.gz"
fi

SLOT="0"

IUSE=""
KEYWORDS="~amd64 ~x86"

RDEPEND="sys-devel/clang"
DEPEND="dev-python/docutils"

src_compile() {
	prefix="${EPREFIX}" RST2MAN=rst2man.py emake
}

src_install() {
	emake DESTDIR="${D}" prefix="${EPREFIX}/usr" install
}
