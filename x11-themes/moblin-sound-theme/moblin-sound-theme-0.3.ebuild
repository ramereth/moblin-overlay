# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit gnome2

DESCRIPTION="Moblin sound theme"
HOMEPAGE="http://www.moblin.org"
SRC_URI="http://staff.osuosl.org/~ramereth/distfiles/${P}.tar.bz2"

LICENSE="CCPL-ShareAlike-1.0"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="sys-devel/gettext
	dev-util/intltool"
RDEPEND=""

DOCS="README NEWS"
