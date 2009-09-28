# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit eutils autotools

DESCRIPTION="An extension for PulseAudio to manage all audio streams, audio
applications and audio devices"
HOMEPAGE="http://www.moblin.org"
SRC_URI="http://staff.osuosl.org/~ramereth/distfiles/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="dev-libs/glib
	dev-libs/dbus-glib
	net-wireless/bluez-utils
	media-libs/alsa-lib
	sys-apps/hal
	=media-sound/pulseaudio-0.9.15-r99[dbus]
	sys-devel/libtool
	dev-libs/libatomic_ops
	media-libs/gstreamer
	media-libs/gst-plugins-base"
RDEPEND="${DEPEND}"

src_prepare () {
	epatch "${FILESDIR}/${P}-mrst_module_makefile.patch"
	epatch "${FILESDIR}/${P}-am_mrst_mix.patch"
	epatch "${FILESDIR}/${P}-fix_audiomanager_cannot_load_with_vvv.patch"
	epatch "${FILESDIR}/${P}-bug_fixing_july.patch"
	eautoreconf
}

src_install () {
	emake DESTDIR="${D}" install || die "emake failed"
	dodoc TODO ChangeLog
}
