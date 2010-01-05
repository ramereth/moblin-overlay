# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit autotools git

DESCRIPTION="CSS library with optional cairo and gtk support"
HOMEPAGE="http://cgit.freedesktop.org/ccss/"
SRC_URI=""
EGIT_REPO_URI="git://anongit.freedesktop.org/${PN}"
EGIT_COMMIT="${P}"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="doc +gtk +cairo +svg +soup"

RDEPEND=">=dev-libs/glib-2
	>=dev-libs/libcroco-0.6
	dev-util/gtk-doc
	cairo? ( >=x11-libs/cairo-1.4 )
	svg? ( >=gnome-base/librsvg-2.22.4 )
	soup? ( >=net-libs/libsoup-2.4 )"
DEPEND="${RDEPEND}"

src_prepare () {
	gtkdocize || die "gtkdocize failed"
	eautoreconf
}

src_configure () {
	econf $(use_enable doc gtk-doc) \
		$(use_enable gtk ccss-gtk) \
		$(use_enable cairo ccss-cairo) \
		$(use_with svg rsvg) \
		$(use_with soup)
}

src_install () {
	emake DESTDIR="${D}" install || die "emake failed"
	dodoc README TODO AUTHORS NEWS HACKING ChangeLog.SVN
}
