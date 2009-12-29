# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit gnome2 autotools git

DESCRIPTION="Moblin: Mozilla Headless Services"
HOMEPAGE="http://www.moblin.org"
SRC_URI=""
EGIT_REPO_URI="git://git.moblin.org/${PN}"
EGIT_COMMIT="${PV}"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="net-libs/xulrunner-headless
	>=dev-libs/glib-2.0
	>=dev-libs/dbus-glib-0.82
	gnome-base/gconf"
RDEPEND="${DEPEND}"

src_prepare() {
	eautoreconf
}
