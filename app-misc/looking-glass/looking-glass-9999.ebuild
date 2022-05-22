# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_PN="LookingGlass"

EGIT_REPO_URI="https://github.com/gnif/${MY_PN}.git"
EGIT_BRANCH="master"

inherit cmake git-r3

DESCRIPTION="A low latency FrameRelay for KVM with VGA PCI Pass-trhough (client)"
HOMEPAGE="https://looking-glass.io"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE="pipewire +pulseaudio wayland +xorg"

RDEPEND="pulseaudio? ( media-sound/pulseaudio )
		pipewire? ( media-video/pipewire )
		xorg? ( x11-base/xorg-server )
		wayland? ( dev-libs/wayland )
		virtual/glu"
DEPEND="${RDEPEND}"

CMAKE_USE_DIR="${S}"/client

src_configure() {
	local mycmakeargs=(
		-DENABLE_PULSEAUDIO="$(usex pulseaudio ON OFF)"
		-DENABLE_PIPEWIRE="$(usex pipewire ON OFF)"
		-DENABLE_WAYLAND="$(usex wayland ON OFF)"
		-DENABLE_X11="$(usex xorg ON OFF)"
	)
	cmake_src_configure
}
