# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit gnome2 autotools

MY_PV="${PV/_p/~}"

DESCRIPTION="Twitter library for glib"
HOMEPAGE="http://moblin.org"
SRC_URI="http://staff.osuosl.org/~ramereth/distfiles/${PN}-${MY_PV}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="doc"

DOCS="README AUTHORS ChangeLog"

S="${WORKDIR}/${PN}-${MY_PV}"

DEPEND=">=dev-libs/glib-2.16
	>=dev-libs/json-glib-0.6
	>=net-libs/libsoup-2.4.1
	>=net-libs/libsoup-gnome-2.4.1
	x11-libs/gtk+"
RDEPEND="${DEPEND}"

src_prepare () {
	gtkdocize || die "gtkdocize failed"
	eautoreconf
}
