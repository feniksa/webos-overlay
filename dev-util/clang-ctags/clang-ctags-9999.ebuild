EAPI=7
PYTHON_COMPAT=( python3_{6,7,8} )
KEYWORDS="~amd64"

inherit eutils 
if [[ ${PV} = *9999* ]]; then
        inherit git-r3
        EGIT_REPO_URI="https://github.com/drothlis/clang-ctags.git"
        SRC_URI=""
        KEYWORDS=""
else
        SRC_URI="https://github.com/drothlis/clang-ctags/archive/{P}.tar.gz"
fi

DESCRIPTION="Generate tag file for C++ source code"
HOMEPAGE="https://github.com/drothlis/clang-ctags"

LICENSE="UIUC"
SLOT="0"

RDEPEND="sys-devel/clang"
DEPEND="dev-python/docutils"

src_compile() {
	prefix="${EPREFIX}" RST2MAN=rst2man.py emake
}

src_install() {
	emake DESTDIR="${D}" prefix="${EPREFIX}/usr" install
}
