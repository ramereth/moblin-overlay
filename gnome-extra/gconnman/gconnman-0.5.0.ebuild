# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit gnome2

DESCRIPTION="Moblin: Provides standard glib binding to connman for UX Applications"
HOMEPAGE="http://www.moblin.org"
SRC_URI="http://staff.osuosl.org/~ramereth/distfiles/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="media-libs/mesa
	dev-libs/glib
	dev-libs/dbus-glib
	x11-libs/gtk+
	net-misc/connman
	dev-util/intltool"
RDEPEND="${DEPEND}"

DOCS="INSTALL README AUTHORS"
