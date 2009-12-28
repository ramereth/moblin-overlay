# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit gnome2 git

DESCRIPTION="Moblin X cursors icon theme"
HOMEPAGE="http://www.moblin.org"
SRC_URI=""
EGIT_REPO_URI="git://git.moblin.org/${PN}"
EGIT_COMMIT="${PV}"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=""
RDEPEND=""

src_configure() {
	einfo "no configure"
}

src_compile() {
	einfo "no compile"
}

src_install() {
	insinto /usr/share/icons/moblin/cursors
	doins -r xcursors/*
}

