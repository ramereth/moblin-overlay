# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit gnome2

DESCRIPTION="Moblin: A social data aggregator"
HOMEPAGE="http://www.moblin.org"
SRC_URI="http://staff.osuosl.org/~ramereth/distfiles/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="doc +gnome +twitter"

DEPEND="dev-libs/glib
	twitter? ( dev-libs/twitter-glib )
	dev-libs/rest
	net-libs/libsoup
	dev-libs/dbus-glib
	gnome? ( gnome-base/gconf gnome-base/gnome-keyring )
	dev-util/intltool"
RDEPEND="${DEPEND}"

DOCS="README AUTHORS NEWS TODO"

src_configure ( ) {
	econf --enable-lastfm-key=107ad3f94128bce49749031121b209e7 \
		$(use_with twitter) \
		$(use_with gnome) \
		--with-online=connman
}
