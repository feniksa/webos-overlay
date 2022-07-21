EAPI="6"
inherit cmake-utils

DESCRIPTION="Template library to build a more complex storage schema with leveldb"
HOMEPAGE="https://github.com/ony/leveldb-tl"
AUTHOR="Nikolay Orliuk <virkony@gmail.com>"
SLOT="0"

KEYWORDS="x86 amd64 ~arm"
LICENSE="Apache-2.0"
DEPEND="dev-libs/leveldb dev-cpp/gtest"

SRC_URI="https://github.com/ony/${PN}/archive/gcc-4.7/v${PV}.zip -> ${P}.zip"

S="${WORKDIR}/${PN}-gcc-4.7-v${PV}"
