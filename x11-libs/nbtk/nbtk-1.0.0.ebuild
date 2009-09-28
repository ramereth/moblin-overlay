# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit eutils gnome2

DESCRIPTION="Experimental toolkit for the moblin-netbook"
HOMEPAGE="http://www.moblin.org"
SRC_URI="http://staff.osuosl.org/~ramereth/distfiles/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="doc"

DEPEND=">=media-libs/clutter-1.0
	dev-libs/libccss
	dev-libs/glib
	x11-libs/gtk+
	media-libs/clutter-imcontext
	dev-util/intltool
	sys-devel/gettext"
RDEPEND="${DEPEND}"

DOC="README"

src_prepare () {
	epatch "${FILESDIR}/${P}-scrollbar-fix-interaction-between-trough-and-man.patch"
}
