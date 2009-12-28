# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit gnome2 eutils autotools git

DESCRIPTION="Moblin: A picture viewing sample application for clutter-gesture"
HOMEPAGE="http://www.moblin.org"
SRC_URI=""
EGIT_REPO_URI="git://git.moblin.org/${PN}"
EGIT_COMMIT="${PV}"

LICENSE="GPL3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="debug +gesture twofinger nomotion +gamma"

DEPEND="media-libs/clutter-gesture
	media-libs/clutter
	dev-libs/glib"
RDEPEND="${DEPEND}"

DOCS="README"

src_prepare () {
	eautoreconf
}

src_configure () {
	econf $(use_enable debug) \
		$(use_enable gesture) \
		$(use_enable twofinger) \
		$(use_enable nomotion no-motion) \
		$(use_enable gamma) || die "econf died"
}
