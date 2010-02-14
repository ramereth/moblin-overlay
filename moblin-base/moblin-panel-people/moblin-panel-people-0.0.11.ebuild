# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit gnome2 autotools git

DESCRIPTION="Moblin People Panel"
HOMEPAGE="http://www.moblin.org"
SRC_URI=""
EGIT_REPO_URI="git://git.moblin.org/${PN}"
EGIT_COMMIT="${PV}"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=moblin-base/mutter-moblin-0.50
	>=moblin-libs/anerley-0.1.3
	x11-libs/gtk+
	>=x11-libs/nbtk-1.2"
RDEPEND="${DEPEND}"

src_prepare() {
	export USE_GNOME2_MACROS=1 USE_COMMON_DOC_BUILD=yes NOCONFIGURE=1
	gnome-autogen.sh > /dev/null
}
