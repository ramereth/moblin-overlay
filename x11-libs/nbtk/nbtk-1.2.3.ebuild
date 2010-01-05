# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit eutils gnome2 autotools git

DESCRIPTION="Experimental toolkit for the moblin-netbook"
HOMEPAGE="http://www.moblin.org"
SRC_URI=""
EGIT_REPO_URI="git://git.moblin.org/${PN}"
EGIT_COMMIT="${P}"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="doc"

DEPEND=">=media-libs/clutter-1.0
	=dev-libs/ccss-0.3.1
	dev-libs/glib
	x11-libs/gtk+
	dev-util/gtk-doc
	>=media-libs/clutter-imcontext-0.1
	dev-util/intltool
	sys-devel/gettext"
RDEPEND="${DEPEND}"

DOC="README"

src_prepare () {
	gtkdocize || die "gtkdocize failed"
	eautoreconf
}
