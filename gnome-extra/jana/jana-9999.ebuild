# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit gnome2 autotools git

DESCRIPTION="An interface library for time-related personal information"
HOMEPAGE="http://git.gnome.org/cgit/jana/"
SRC_URI=""
EGIT_REPO_URI="git://git.gnome.org/${PN}"
#EGIT_COMMIT="${PV}"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="+glade examples"

DEPEND="dev-libs/glib
	x11-libs/gtk+
	gnome-extra/evolution-data-server
	gnome-base/gconf
	glade? ( dev-util/glade )"
RDEPEND="${DEPEND}"

DOCS="README AUTHORS MAINTAINERS NEWS ChangeLog"

src_prepare () {
	gtkdocize || die "gtkdocize failed"
	intltoolize --copy --force --automake || die "intltoolize failed"
	eautoreconf
}

src_configure () {
	econf $(use_enable glade) \
		$(use_enable examples) || die "econf failed"
}
