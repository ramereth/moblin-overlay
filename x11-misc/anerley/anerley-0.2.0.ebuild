# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit autotools git

DESCRIPTION="Moblin: Anerley people widgets"
HOMEPAGE="http://www.moblin.org"
SRC_URI=""
EGIT_REPO_URI="git://git.moblin.org/${PN}"
EGIT_COMMIT="${PV}"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="doc"

RDEPEND=">=dev-libs/glib-2.14
	>=net-libs/telepathy-glib-0.9.0
	sys-devel/gettext
	gnome-base/gnome-common
	>=x11-libs/nbtk-1.2
	gnome-extra/evolution-data-server"
DEPEND="${RDEPEND}
	dev-util/intltool"

src_prepare () {
	eautoreconf
}

src_install () {
	emake DESTDIR="${D}" install || die "emake failed"
}
