# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit gnome2 eutils autotools

MY_PV="${PV/_p/~}"

DESCRIPTION="Moblin: The moblin media player"
HOMEPAGE="http://www.moblin.org"
SRC_URI="http://staff.osuosl.org/~ramereth/distfiles/${PN}-${MY_PV}.tar.bz2"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DOCS="README AUTHORS"

S="${WORKDIR}/${PN}-${MY_PV}"

DEPEND="
	x11-libs/gtk+
	media-libs/clutter
	media-libs/clutter-gtk
	media-libs/clutter-gst
	media-libs/clutter-imcontext
	moblin-libs/bickley
	x11-libs/nbtk
	x11-libs/startup-notification
	dev-libs/libunique
	moblin-libs/bognor-regis
	x11-libs/libnotify
	x11-libs/libXtst
	gnome-base/gnome-common"
RDEPEND="${DEPEND}"

src_prepare () {
	epatch "${FILESDIR}/${P}-playpause-state-inconsistency-in-theatre.patch"
	epatch "${FILESDIR}/${P}-clutter-1.0-dependency.patch"
	epatch "${FILESDIR}/${P}-remove-broken-test-on-clutter.patch"
	epatch "${FILESDIR}/${P}-translation-updates.patch"
	intltoolize --force || die "intltoolize failed"
	eautoreconf
}
