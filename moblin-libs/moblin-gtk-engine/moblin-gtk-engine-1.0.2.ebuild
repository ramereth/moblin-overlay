# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit gnome2 autotools git

DESCRIPTION="Gtk engine for Moblin"
HOMEPAGE="http://www.moblin.org"
SRC_URI=""
EGIT_REPO_URI="git://git.moblin.org/${PN}"
EGIT_COMMIT="${P}"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DOCS="README AUTHORS"

DEPEND="x11-libs/gtk+"
RDEPEND="gnome-base/gnome-settings-daemon"

src_prepare () {
	eautoreconf
}
