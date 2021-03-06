# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit gnome2 eutils autotools

MY_PV="${PV/_p/~}"

DESCRIPTION="Moblin: Bickley is a meta data management API and framework"
HOMEPAGE="http://www.moblin.org"
SRC_URI="http://staff.osuosl.org/~ramereth/distfiles/${P}.tar.bz2"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DOCS="INSTALL AUTHORS"

S="${WORKDIR}/${PN}-${MY_PV}"

DEPEND="dev-libs/glib
	>=dev-libs/dbus-glib-0.78
	x11-libs/gtk+
	media-libs/gstreamer
	media-libs/libexif
	media-libs/mesa
	net-libs/gupnp
	net-libs/gupnp-av
	gnome-base/gconf
	sys-libs/tdb
	media-libs/libogg
	media-libs/libvorbis
	media-libs/libid3tag
	media-libs/flac
	dev-lang/python
	media-libs/clutter-gtk
	dev-db/sqlite
	x11-misc/xdg-user-dirs"
RDEPEND="${DEPEND}"

src_prepare () {
	epatch "${FILESDIR}/${P}-nocrash.patch"
	epatch "${FILESDIR}/${P}-by-incrementing-the-count-value.patch"
	epatch "${FILESDIR}/${P}-photos-never-show-up-in-media-player.patch"
	epatch "${FILESDIR}/${P}-use-ctime-instead-of-mtime-hack.patch"
	eautoreconf
}

src_install () {
	emake DESTDIR="${D}" install || die "emake failed"
}
