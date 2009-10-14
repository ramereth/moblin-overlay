# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit eutils

DESCRIPTION="A package contains the basic system scripts used to boot moblin"
HOMEPAGE="http://www.moblin.org"
SRC_URI="http://staff.osuosl.org/~ramereth/distfiles/${P}.tar.bz2"

LICENSE="GPL2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=""
RDEPEND="dev-libs/popt"

src_prepare () {
	epatch "${FILESDIR}/${P}-early-setup-utmp.patch"
	epatch "${FILESDIR}/${P}-acpid-start-script.patch"
	epatch "${FILESDIR}/${P}-swappiness.patch"
	epatch "${FILESDIR}/${P}-moblin-dm.patch"
}

src_install () {
	emake ROOT="${D}" install || die "emake failed"
}
