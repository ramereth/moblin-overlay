# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit git

DESCRIPTION="Moblin: populate user home directories"
HOMEPAGE="http://www.moblin.org"
SRC_URI=""
EGIT_REPO_URI="git://git.moblin.org/${PN}"
EGIT_COMMIT="${PV}"

LICENSE="CCPL-Attribution-3.0"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=""
RDEPEND=""

src_compile () { einfo "no compile"; }

src_install () {
	insinto /etc/skel
	local dirs="bkl-thumbnails gnome2 kozo local recently-used.xbel thumbnails"
	for i in ${dirs} ; do
		doins -r .${i}
	done
}
