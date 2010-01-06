# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit gnome2 autotools git

DESCRIPTION="Moblin Media Panel"
HOMEPAGE="http://www.moblin.org"
SRC_URI=""
EGIT_REPO_URI="git://git.moblin.org/${PN}"
EGIT_COMMIT="${PV}"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=moblin-base/mutter-moblin-0.50
	>=x11-libs/nbtk-1.2
	>=moblin-libs/bickley-0.4
	x11-libs/gtk+
	>=moblin-libs/bognor-regis-0.6"
RDEPEND="${DEPEND}"

src_prepare() {
	eautoconf
}
