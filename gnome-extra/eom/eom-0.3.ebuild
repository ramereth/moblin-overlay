# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit gnome2 eutils

DESCRIPTION="Moblin: A picture viewing sample application for clutter-gesture"
HOMEPAGE="http://www.moblin.org"
SRC_URI="http://staff.osuosl.org/~ramereth/distfiles/${P}.tar.gz"

LICENSE="GPL3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="media-libs/clutter-gesture
	media-libs/clutter
	dev-libs/glib"
RDEPEND="${DEPEND}"

DOCS="README"

src_prepare () {
	epatch "${FILESDIR}/${P}-clutter-1.0-dependency.patch"
}
