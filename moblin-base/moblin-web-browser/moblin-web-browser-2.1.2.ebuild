# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit gnome2 autotools git

DESCRIPTION="Moblin Web Browser"
HOMEPAGE="http://www.moblin.org"
SRC_URI=""
EGIT_REPO_URI="git://git.moblin.org/${PN}"
EGIT_COMMIT="${PV}"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+browser +netpanel"

# NOTE: Need to add clutter-mozembed
DEPEND=">=moblin-base/mozilla-headless-services-0.10.4
	>=x11-libs/nbtk-1.1.13
	x11-libs/gtk+
	browser? (
		>=dev-libs/libunique-1.0.6
		>=media-libs/clutter-1.0
		>=media-libs/clutter-gtk-0.10
		>=x11-libs/startup-notification-0.9 )
	netpanel? ( moblin-base/mutter-moblin
		>=media-libs/clutter-1.0
		>=media-libs/clutter-gtk-0.10 )"
RDEPEND="${DEPEND}"

src_prepare() {
	eautoreconf
}

src_configure() {
	econf $(use_enable browser) \
		$(use_enable netpanel) || die "econf died"
}
