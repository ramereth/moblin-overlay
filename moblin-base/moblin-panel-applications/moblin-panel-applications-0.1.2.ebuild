# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit gnome2 autotools git

DESCRIPTION="Moblin: Applications Panel"
HOMEPAGE="http://www.moblin.org"
SRC_URI=""
EGIT_REPO_URI="git://git.moblin.org/${PN}"
EGIT_COMMIT="${PV}"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=">=media-libs/clutter-gtk-0.10
	x11-libs/gtk+
	gnome-base/gconf
	gnome-base/gnome-menus
	>=x11-libs/nbtk-1.2"
RDEPEND="${DEPEND}"

src_prepare() {
	eautoreconf
}