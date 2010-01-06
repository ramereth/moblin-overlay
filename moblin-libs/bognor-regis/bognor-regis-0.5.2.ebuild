# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit gnome2 eutils autotools git

DESCRIPTION="Moblin: Media daemon and play queue manager"
HOMEPAGE="http://moblin.org"
SRC_URI=""
EGIT_REPO_URI="git://git.moblin.org/${PN}"
EGIT_COMMIT="${PV}"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="doc queue-config"

DOCS="README AUTHORS ChangeLog"

DEPEND=">=dev-libs/glib-2.16
	dev-libs/dbus-glib
	media-libs/gstreamer
	x11-libs/gtk+
	dev-util/intltool
	sys-devel/gettext"
RDEPEND="${DEPEND}"

src_prepare () {
	intltoolize --force || die "intltoolize failed"
	eautoreconf
}

src_configure() {
	econf $(use_enable queue-config) || die "econf died"
}
