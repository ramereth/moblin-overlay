# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
# debug only changes CFLAGS
GCONF_DEBUG="no"

inherit eutils gnome2 git versionator

MY_PV="$(replace_version_separator 3 '_')"

DESCRIPTION="Moblin: Mutter (Metacity replacement)"
HOMEPAGE="http://www.moblin.org"
SRC_URI=""
EGIT_REPO_URI="git://git.moblin.org/${PN}"
EGIT_COMMIT="${MY_PV}"

LICENSE="GPL-2 LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test xinerama"

# XXX: libgtop is automagic, hard-enabled instead
RDEPEND=">=x11-libs/gtk+-2.10
	>=x11-libs/pango-1.2[X]
	>=gnome-base/gconf-2
	>=dev-libs/glib-2.6
	>=x11-libs/startup-notification-0.7
	>=x11-libs/libXcomposite-0.2
	x11-libs/libXfixes
	x11-libs/libXrender
	x11-libs/libXdamage
	x11-libs/libXcursor
	x11-libs/libX11
	xinerama? ( x11-libs/libXinerama )
	x11-libs/libXext
	x11-libs/libXrandr
	x11-libs/libSM
	x11-libs/libICE
	media-libs/libcanberra[gtk]
	gnome-base/libgtop
	gnome-extra/zenity
	!x11-misc/expocity"
DEPEND="${RDEPEND}
	>=app-text/gnome-doc-utils-0.8
	sys-devel/gettext
	>=dev-util/pkgconfig-0.9
	>=dev-util/intltool-0.35
	test? ( app-text/docbook-xml-dtd:4.5 )
	xinerama? ( x11-proto/xineramaproto )
	x11-proto/xextproto
	x11-proto/xproto"

DOCS="AUTHORS ChangeLog HACKING NEWS README *.txt doc/*.txt"

pkg_setup() {
	G2CONF="${G2CONF}
		--enable-compositor
		--enable-gconf
		--enable-render
		--enable-shape
		--enable-sm
		--enable-startup-notification
		--enable-xsync
		$(use_enable xinerama)"
}

src_prepare() {
	gnome2_src_prepare
}
