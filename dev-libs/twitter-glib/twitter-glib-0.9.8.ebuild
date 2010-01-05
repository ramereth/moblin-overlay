# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit gnome2 autotools git

DESCRIPTION="Twitter library for glib"
HOMEPAGE="http://live.gnome.org/TwitterGlib"
SRC_URI=""
EGIT_REPO_URI="git://github.com/ebassi/twitter-glib.git"
EGIT_COMMIT="${PV}"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="doc"

DOCS="README AUTHORS ChangeLog"

DEPEND=">=dev-libs/glib-2.16
	>=dev-libs/json-glib-0.6
	>=net-libs/libsoup-2.4.1
	>=net-libs/libsoup-gnome-2.4.1
	dev-util/gtk-doc
	x11-libs/gtk+"
RDEPEND="${DEPEND}"

DOCS="AUTHORS ChangeLog NEWS README"

src_prepare () {
	gtkdocize || die "gtkdocize failed"
	glib-gettextize -f || die "glib-gettextize failed"
	eautoreconf
}
