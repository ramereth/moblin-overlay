# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit eutils git

DESCRIPTION="A package contains the basic system scripts used to boot moblin"
HOMEPAGE="http://www.moblin.org"
SRC_URI=""
EGIT_REPO_URI="git://git.moblin.org/${PN}"
# use git commit for version as they don't tag versions
EGIT_COMMIT="4f1e5749"

LICENSE="GPL2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=""
RDEPEND="dev-libs/popt"

src_install () {
	emake ROOT="${D}" install || die "emake failed"
}
