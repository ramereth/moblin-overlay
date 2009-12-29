# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit gnome2 autotools git

DESCRIPTION="Moblin: MyZone Panel"
HOMEPAGE="http://www.moblin.org"
SRC_URI=""
EGIT_REPO_URI="git://git.moblin.org/${PN}"
EGIT_COMMIT="${PV}"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

# NOTE: need to look up what PENGE, and libjana-ecal are for deps
DEPEND=">=moblin-base/mutter-moblin-0.50
	x11-libs/mojito
	x11-libs/gtk+
	>=media-libs/bickley-0.4
	>=moblin-libs/mx-1.0
	gnome-base/gconf"
RDEPEND="${DEPEND}"

src_prepare() {
	eautoreconf
}
