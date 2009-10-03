# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit gnome2

DESCRIPTION="Library for accessing rest web services"
HOMEPAGE="http://moblin.org"
SRC_URI="http://staff.osuosl.org/~ramereth/distfiles/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="doc"

DEPEND="dev-libs/libxml2
	dev-libs/glib
	net-libs/libsoup"
RDEPEND="${DEPEND}"

DOCS="README AUTHORS"
