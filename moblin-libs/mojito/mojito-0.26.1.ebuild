# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit gnome2 autotools git

DESCRIPTION="Moblin: A social data aggregator"
HOMEPAGE="http://www.moblin.org"
SRC_URI=""
EGIT_REPO_URI="git://git.moblin.org/${PN}"
EGIT_COMMIT="${PV}"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="doc +gnome digg +twitter lastfm myspace flickr"

DEPEND="dev-libs/glib
	twitter? ( dev-libs/twitter-glib )
	>=dev-libs/rest-0.6
	net-libs/libsoup
	dev-libs/dbus-glib
	gnome? ( gnome-base/gconf gnome-base/gnome-keyring )
	dev-util/intltool"
RDEPEND="${DEPEND}"

DOCS="README AUTHORS NEWS TODO"

src_prepare () {
	intltoolize --copy --force --automake || die "intltoolize failed"
	eautoreconf
}

src_configure () {
	econf $(use_with gnome) \
		$(use_enable digg digg-key) \
		$(use_enable twitter twitter-key) \
		$(use_enable lastfm lastfm-key) \
		$(use_enable myspace myspace-key) \
		$(use_enable flickr flickr-key) \
		--with-online=connman
}
