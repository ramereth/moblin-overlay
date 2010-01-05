# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit eutils gnome2 autotools git

DESCRIPTION="Moblin: Web Services Settings"
HOMEPAGE="http://www.moblin.org"
SRC_URI=""
EGIT_REPO_URI="git://git.moblin.org/${PN}"
EGIT_COMMIT="${PV}"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="moblin-libs/mojito
	>=x11-libs/nbtk-1.2
	x11-libs/gtk+
	gnome-base/gconf
	gnome-base/gnome-keyring
	net-libs/libsoup
	dev-libs/rest
	gnome-base/gnome-common
	dev-util/intltool
	sys-devel/gettext
	dev-libs/libunique"
RDEPEND="${DEPEND}"

DOCS="TODO AUTHORS"

src_prepare () {
	intltoolize --copy --force --automake || die "intltoolize failed"
	eautoreconf
}

src_install () {
	emake DESTDIR="${D}" install || die "emake install failed"
}
