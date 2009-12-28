# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit gnome2 autotools git

MY_PN="librest"

DESCRIPTION="Library for accessing rest web services"
HOMEPAGE="http://moblin.org"
SRC_URI=""
EGIT_REPO_URI="git://git.moblin.org/${MY_PN}"
EGIT_COMMIT="${MY_PN}-${PV}"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="doc"

DEPEND="dev-libs/libxml2
	dev-libs/glib
	dev-util/gtk-doc
	net-libs/libsoup"
RDEPEND="${DEPEND}"

DOCS="README AUTHORS"

src_prepare() {
	gtkdocize --flavour no-tmpl || die "gtkdocize failed"
	eautoreconf
}
