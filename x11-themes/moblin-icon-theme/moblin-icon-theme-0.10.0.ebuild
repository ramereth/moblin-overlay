# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit gnome2 git

DESCRIPTION="Base Moblin icons"
HOMEPAGE="http://www.moblin.org"
SRC_URI=""
EGIT_REPO_URI="git://git.moblin.org/${PN}"
EGIT_COMMIT="${PV}"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="x11-themes/hicolor-icon-theme
	x11-misc/icon-naming-utils"
RDEPEND="gnome-base/librsvg
	x11-libs/gtk+"

DOCS="AUTHORS"
