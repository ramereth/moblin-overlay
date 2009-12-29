# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit gnome2 autotools git

MY_PN="camera_adaption_layer"

DESCRIPTION="Moblin Camera Application"
HOMEPAGE="http://www.moblin.org"
SRC_URI=""
EGIT_REPO_URI="git://git.moblin.org/${MY_PN}"
# version tags are not created so use commit hash instead
EGIT_COMMIT=""

LICENSE="LGPl-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=dev-libs/glib-2.18.2
	>=x11-libs/gtk+-2.14.4
	>=gnome-base/gnome-vfs-2.24.0
	>=media-libs/gstreamer-0.10.20
	>=media-libs/gst-plugins-base-0.10
	>=x11-libs/libX11-1.1.5
	dev-libs/atk"
RDEPEND="${DEPEND}"

src_prepare() {
	eautoreconf
}
