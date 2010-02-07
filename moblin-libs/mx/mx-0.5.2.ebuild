# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit gnome2 autotools git

DESCRIPTION="Moblin: mx"
HOMEPAGE="http://www.moblin.org"
SRC_URI=""
EGIT_REPO_URI="git://git.moblin.org/${PN}"
EGIT_COMMIT="${PV}"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="+imcontext +gesture +startup-notification +dbus"

DEPEND=">=media-libs/clutter-1.0
	imcontext? ( >=media-libs/clutter-imcontext-0.1 )
	startup-notification? ( >=x11-libs/startup-notification-0.9 )
	dbus? ( >=dev-libs/dbus-glib-0.82 )
	dev-util/gtk-doc
	dev-libs/glib
	x11-libs/gtk+"
RDEPEND="${DEPEND}"

DOCS="HACKING NEWS README"

src_prepare() {
	gtkdocize || die "gtkdocize failed"
	glib-gettextize -f || die "glib-gettextize failed"
	eautoreconf
}

src_configure() {
	econf $(use_with imcontext clutter-imcontext) \
		$(use_with gesture clutter-gesture) \
		$(use_with startup-notification) \
		$(use_with dbus) || die "econf died"
}
