# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit gnome2 eutils autotools

MY_PV="${PV/_p/~}"

DESCRIPTION="Moblin: Media daemon and play queue manager"
HOMEPAGE="http://moblin.org"
SRC_URI="http://staff.osuosl.org/~ramereth/distfiles/${PN}-${MY_PV}.tar.bz2"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="doc"

DOCS="README AUTHORS ChangeLog"

S="${WORKDIR}/${PN}-${MY_PV}"

DEPEND=">=dev-libs/glib-2.16
	dev-libs/dbus-glib
	media-libs/gstreamer
	x11-libs/gtk+
	dev-util/intltool
	sys-devel/gettext"
RDEPEND="${DEPEND}"

src_prepare () {
	epatch "${FILESDIR}/${P}-fix-by-always-telling-hornsey-to-show-audio.patch"
	epatch "${FILESDIR}/${P}-fix-with-patch-from-vivian-zhang.patch"
	intltoolize --force || die "intltoolize failed"
	eautoreconf
}
