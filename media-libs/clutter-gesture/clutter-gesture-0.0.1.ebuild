# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit gnome2 eutils autotools

DESCRIPTION="Gesture Library for Clutter"
HOMEPAGE="http://www.moblin.org"
SRC_URI="http://staff.osuosl.org/~ramereth/distfiles/${P}.tar.bz2"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="dev-libs/glib
	media-libs/clutter"
RDEPEND="${DEPEND}"

DOCS="README NEWS AUTHORS"

src_prepare () {
	epatch "${FILESDIR}/${P}-clutter-1.0-dependency.patch"
	eautoreconf
}
