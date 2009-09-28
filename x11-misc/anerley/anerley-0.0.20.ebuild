# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

DESCRIPTION="Moblin: Anerley people widgets"
HOMEPAGE="http://www.moblin.org"
SRC_URI="http://staff.osuosl.org/~ramereth/distfiles/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="doc"

RDEPEND=">=dev-libs/glib-2.14
	net-libs/telepathy-glib
	net-im/telepathy-mission-control
	sys-devel/gettext
	gnome-base/gnome-common
	>=x11-libs/nbtk-0.15.0
	gnome-extra/evolution-data-server"
DEPEND="${RDEPEND}
	dev-util/intltool"

src_install () {
	emake DESTDIR="${D}" install || die "emake failed"
}
