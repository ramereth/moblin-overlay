# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit gnome2 eutils

DESCRIPTION="Moblin: Connection management panel"
HOMEPAGE="http://www.moblin.org"
SRC_URI="http://staff.osuosl.org/~ramereth/distfiles/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DOCS="README AUTHORS"

DEPEND="gnome-extra/gconnman
	x11-libs/gtk+
	dev-libs/dbus-glib
	x11-libs/libnotify
	x11-libs/nbtk
	dev-util/intltool
	gnome-base/gnome-common"
RDEPEND="${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}/${P}-notification-type.patch"
	epatch "${FILESDIR}/${P}-icon-on-start.patch"
	epatch "${FILESDIR}/${P}-icon-doesnt-change-to-no-connect.patch"
	epatch "${FILESDIR}/${P}-crasher-from-sending-translated-string.patch"
}

