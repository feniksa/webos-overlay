EAPI=7

inherit eutils

DESCRIPTION="AMD Radeontm ProRender is a powerful physically-based rendering engine"
HOMEPAGE="https://www.amd.com/en/technologies/radeon-prorender"
ICENSE="Apache-2.0"
SLOT="0/${PV}"
KEYWORDS="amd64"
IUSE="examples"
SRC_URI="https://github.com/GPUOpen-LibrariesAndSDKs/RadeonProRenderSDK/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

# should depend from amd or nvidia drivers + opencl
RDEPEND="virtual/opencl
		>=dev-libs/opencl-icd-loader-2021.06.30"
DEPEND="${RDEPEND}"
RESTRICT="strip"

PATCHES=(
	"${FILESDIR}/0001-32_gl_interop-main.cpp-fix-error-and-warnings.patch"
	"${FILESDIR}/0002-Add-executable-flag-for-premake5-by-default.patch"
	"${FILESDIR}/0003-Fix-warning-multi-character-character-constant.patch"
)


S="${WORKDIR}/RadeonProRenderSDK-2.2.9"

src_configure() {
	default

	if ! use examples; then 
		return
	fi

	ebegin "Configure tutorials"
		pushd "${S}/tutorials"
			chmod u+x "${S}"/premake5/linux64/premake5
			"${S}"/premake5/linux64/premake5 gmake
		popd
	eend $?
}

src_compile() {
	if ! use examples; then 
		return
	fi

	ebegin "Compile tutorials"
		pushd "${S}/tutorials"
			emake
		popd
	eend $?
}

src_install() {
	local libs+=(
		HybridPro.so
		Hybrid.so
		libNorthstar64.so
		libProRenderGLTF.so
		libRadeonProRender64.so
		libRprLoadStore64.so
		libTahoe64.so
		RprsRender64
	)

	for lib in "${libs[@]}"; do
		dolib.so RadeonProRender/binUbuntu18/${lib}
	done

	dobin RadeonProRender/binUbuntu18/RprTextureCompiler64
	doheader RadeonProRender/inc/*

	insinto "/usr/share/RadeonProRender"
	doins readme.md
	doins license.txt
	doins release_notes.txt

	if use examples; then

		ebegin "Install tutorial resources"
			insinto "/usr/share/RadeonProRender"
			doins -r Resources
		eend $?

		ebegin "Install tutorial sources"
			insinto "/usr/share/RadeonProRender/tutorials"
			for d in $(find "${S}/tutorials/"  -maxdepth 1 -type d  -name '[0-9]*_*'); do
				doins -r "$d"
			done
		eend $?

		ebegin "Remove from tutorial *.dll files"
			rm "${S}"/tutorials/Bin/*.dll
		eend $?
		
		ebegin "Install tutorial compiled binaries"
			exeinto "/usr/share/RadeonProRender/tutorials/Bin"
			for f in $(find "${S}/tutorials/Bin"  -maxdepth 1 -type f  -name '[0-9]*_*'); do
				doexe "$f"
			done
		eend $?

		ebegin "Install tutorial shaders"
			insinto "/usr/share/RadeonProRender/tutorials/Bin"
			for f in $(find "${S}/tutorials/Bin"  -maxdepth 1 -type f  -name '*.fsh' -or -name '*.vsh'); do
				doins "$f"
			done
		eend $?


		ebegin "Install other tutorial files"
			insinto "/usr/share/RadeonProRender/tutorials"

			doins "${S}/tutorials/premake5.lua"
			doins "${S}/tutorials/readme.md"
		eend $?
	fi
}


