# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit gnome2 autotools git

DESCRIPTION="Moblin: fvkbd"
HOMEPAGE="http://www.moblin.org"
SRC_URI=""
EGIT_REPO_URI="git://git.moblin.org/${PN}"
EGIT_COMMIT="${PV}"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+gtk"

DEPEND=">=dev-libs/glib-2.0
	>=dev-libs/libxml2-2.6
	gtk? (
		>=x11-libs/gtk+-2.14
		dev-libs/libunique )"
RDEPEND="${DEPEND}"

src_prepare() {
	eautoreconf
}

src_configure() {
	econf $(use_enable gtk gtk-ui) || die "econf died"
}
