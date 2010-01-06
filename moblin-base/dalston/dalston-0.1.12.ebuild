# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit gnome2 eutils autotools git

DESCRIPTION="Moblin: System information icons"
HOMEPAGE="http://www.moblin.org"
SRC_URI=""
EGIT_REPO_URI="git://git.moblin.org/${PN}"
EGIT_COMMIT="${PV}"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="dev-libs/glib
	dev-libs/dbus-glib
	x11-libs/gtk+
	media-sound/pulseaudio
	media-libs/libcanberra[gtk]
	>=x11-libs/nbtk-1.2
	x11-libs/libnotify
	gnome-base/gconf"
RDEPEND="${DEPEND}"

DOCS="README"

src_prepare () {
	intltoolize --copy --force --automake || die "intltoolize failed"
	eautoreconf
}
