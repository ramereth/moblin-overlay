# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit gnome2 eutils

DESCRIPTION="Moblin: Application crash collector"
HOMEPAGE="http://www.moblin.org/"
SRC_URI="http://staff.osuosl.org/~ramereth/distfiles/${P}.tar.gz"
#HOMEPAGE="http://www.corewatcher.org/"
#SRC_URI="http://www.corewatcher.org/download/${P}.tar.gz"

LICENSE="GPL2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="dev-libs/glib
	net-misc/curl
	x11-libs/libnotify
	x11-libs/gtk+"
RDEPEND="${DEPEND}"

src_prepare () {
	epatch "${FILESDIR}/${P}-desktop-priority.patch"
}

src_configure () {
	einfo "no configure"
}
