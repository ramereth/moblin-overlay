# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit gnome2 autotools git

DESCRIPTION="Moblin Web Panel"
HOMEPAGE="http://www.moblin.org"
SRC_URI=""
# no release tags, use commit hashes instead
EGIT_REPO_URI="git://git.moblin.org/${PN}"
EGIT_COMMIT=""

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=x11-libs/nbtk-1.2
	x11-libs/gtk+
	>=dev-db/sqlite-3.0
	>=media-libs/clutter-gtk-0.10
	>=media-libs/clutter-1.0"
RDEPEND="${DEPEND}"

src_prepare() {
	eautoreconf
}
