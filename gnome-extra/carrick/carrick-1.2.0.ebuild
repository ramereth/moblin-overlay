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

# add >=gnome-extra/moblin-panel-0.49.0
DEPEND="x11-libs/gtk+
	>=dev-libs/dbus-glib-0.73
	x11-libs/libnotify
	>=x11-libs/nbtk-1.2
	dev-util/intltool
	>=dev-libs/rest-0.6
	gnome-base/gnome-common"
RDEPEND="${DEPEND}"

src_prepare() {
	eautoreconf
}

