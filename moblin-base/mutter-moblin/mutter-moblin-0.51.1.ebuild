# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit gnome2 autotools git

DESCRIPTION="Moblin Mutter (for Metacity)"
HOMEPAGE="http://www.moblin.org"
SRC_URI=""
EGIT_REPO_URI="git://git.moblin.org/${PN}"
EGIT_COMMIT="${PV}"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="+power-applet scaled-background"

DEPEND="dev-libs/dbus-glib
	>=moblin-libs/mx-0.3.0
	x11-libs/gtk+
	dev-libs/glib
	x11-wm/mutter
	>=x11-libs/startup-notification-0.10
	gnome-base/gconf"
RDEPEND="${DEPEND}"

src_prepare() {
	eautoreconf
}

src_configure() {
	econf $(use_enable scaled-background) \
		$(use_enable power-applet) || die "econf died"
}
