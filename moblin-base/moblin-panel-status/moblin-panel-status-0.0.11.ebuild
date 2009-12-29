# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit gnome2 autotools git

DESCRIPTION="Moblin Status Panel"
HOMEPAGE="http://www.moblin.org"
SRC_URI=""
EGIT_REPO_URI="git://git.moblin.org/${PN}"
EGIT_COMMIT="${PV}"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=moblin-base/mutter-moblin-0.50
	dev-libs/dbus-glib
	>=media-libs/clutter-gtk-0.10
	>=x11-libs/mojito-0.20.1
	>=net-libs/telepathy-glib-0.9.0
	>=x11-libs/nbtk-1.2"
RDEPEND="${DEPEND}"

src_prepare() {
	eautoreconf
}

src_configure() {
	econf --with-online=connman || die "econf died"
}
