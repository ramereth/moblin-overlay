# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit gnome2 autotools git

DESCRIPTION="Moblin: Anerley people widgets"
HOMEPAGE="http://www.moblin.org"
SRC_URI=""
EGIT_REPO_URI="git://git.moblin.org/${PN}"
EGIT_COMMIT="${PV}"
WANT_AUTOCONF="2.5"
WANT_AUTOMAKE="1.11"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~x86 ~amd64"

RDEPEND=">=dev-libs/glib-2.14
	>=net-libs/telepathy-glib-0.9.0
	sys-devel/gettext
	>=gnome-base/gnome-common-2.28
	moblin-libs/mx
	gnome-extra/evolution-data-server"
DEPEND="${RDEPEND}
	dev-util/intltool"

src_prepare () {
	# This needs to be fixed eventually but I can't figure out how currently. It
	# "works" for now.
	export USE_GNOME2_MACROS=1 USE_COMMON_DOC_BUILD=yes NOCONFIGURE=1
	gnome-autogen.sh > /dev/null
}
