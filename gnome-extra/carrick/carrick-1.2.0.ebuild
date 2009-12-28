# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit gnome2 eutils git

DESCRIPTION="Moblin: Connection management panel"
HOMEPAGE="http://www.moblin.org"
SRC_URI=""
EGIT_REPO_URI="git://git.moblin.org/${PN}-ng"
EGIT_COMMIT="${PV}"

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
	USE_GNOME2_MACROS=1 USE_COMMON_DOC_BUILD=yes . gnome-autogen.sh
}

