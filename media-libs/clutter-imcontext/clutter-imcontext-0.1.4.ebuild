# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit eutils autotools gnome2 git

DESCRIPTION="IMContext Framework Library for Clutter"
HOMEPAGE="http://www.moblin.org"
SRC_URI=""
EGIT_REPO_URI="git://git.moblin.org/clutter-imcontext"
EGIT_COMMIT="${PV}"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="doc"

RDEPEND="dev-libs/glib
	>=media-libs/clutter-1.0.0"
DEPEND="${DEPEND}
	dev-util/gtk-doc"

DOCS="AUTHORS ChangeLog INSTALL NEWS README"

src_prepare () {
	gtkdocize --flavour no-tmpl || die "gtkdocsize failed"
	eautoreconf
}

src_configure () {
	econf $(use_enable doc gtk-doc) || die "econf failed"
}
