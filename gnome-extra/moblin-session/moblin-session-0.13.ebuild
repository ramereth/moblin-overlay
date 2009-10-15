# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit gnome2

DESCRIPTION="Moblin User Experience Startup Scripts"
HOMEPAGE="http://www.moblin.org"
SRC_URI="http://staff.osuosl.org/~ramereth/distfiles/${P}.tar.bz2"

LICENSE="GPL2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=""
RDEPEND=""

src_configure() {
	einfo "no configure"
}

src_compile() {
	einfo "no compile"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake failed"
}

