# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit gnome2 eutils autotools git

DESCRIPTION="Moblin: The moblin media player"
HOMEPAGE="http://www.moblin.org"
SRC_URI=""
EGIT_REPO_URI="git://git.moblin.org/${PN}"
EGIT_COMMIT="${PV}"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="windowmode"

DOCS="README AUTHORS"

DEPEND="
	x11-libs/gtk+
	>=media-libs/clutter-1.0
	>=media-libs/clutter-gtk-0.10
	media-libs/clutter-gst
	>=media-libs/clutter-imcontext-0.1
	>=media-libs/bickley-0.4
	>=x11-libs/nbtk-1.2
	>=x11-libs/startup-notification-0.9
	>=dev-libs/libunique-1.0.6
	>=media-sound/bognor-regis-0.5.2
	x11-libs/libnotify
	x11-libs/libXtst
	gnome-base/gnome-common"
RDEPEND="${DEPEND}"

src_prepare () {
	intltoolize --force || die "intltoolize failed"
	eautoreconf
}

src_prepare () {
	econf $(use_enable windowmode) || die "econf died"
}
