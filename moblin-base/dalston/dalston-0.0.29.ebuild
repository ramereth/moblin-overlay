# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit gnome2 eutils

DESCRIPTION="Moblin: System information icons"
HOMEPAGE="http://www.moblin.org"
SRC_URI="http://staff.osuosl.org/~ramereth/distfiles/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="dev-libs/glib
	dev-libs/dbus-glib
	x11-libs/gtk+
	media-sound/pulseaudio
	media-libs/libcanberra[gtk]
	x11-libs/nbtk
	x11-libs/libnotify
	gnome-base/gconf"
RDEPEND="${DEPEND}"

DOCS="README"

src_prepare () {
	epatch "${FILESDIR}/${P}-zh_CN-translation.patch"
	epatch "${FILESDIR}/${P}-gvc-recover-from-pa-failing.patch"
}
