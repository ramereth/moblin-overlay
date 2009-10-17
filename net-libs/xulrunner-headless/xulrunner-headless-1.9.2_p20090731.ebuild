# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-libs/xulrunner/xulrunner-1.9.1.2-r2.ebuild,v 1.1 2009/08/30 14:50:18 anarchy Exp $

EAPI="2"
WANT_AUTOCONF="2.1"

inherit flag-o-matic toolchain-funcs eutils mozconfig-3 makeedit multilib java-pkg-opt-2 python autotools

MY_PN="xulrunner"
#MY_PV="${PV/_beta/b}" # Handle betas
#MY_PV="${PV/_/}" # Handle rc1, rc2 etc
#MY_PV="${MY_PV/1.9.1.2/3.5.2}"
#MY_P="${MY_PN}-${MY_PV}"
MAJ_PV="${PV/_*/}"
PATCH="${MY_PN}-${MAJ_PV}-patches-0.1"

DESCRIPTION="Mozilla runtime package that can be used to bootstrap XUL+XPCOM applications"
HOMEPAGE="http://developer.mozilla.org/en/docs/XULRunner"
SRC_URI="http://staff.osuosl.org/~ramereth/distfiles/${MY_PN}-${PV}.tar.bz2
	http://dev.gentoo.org/~anarchy/dist/${PATCH}.tar.bz2"

KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 -sparc ~x86"
SLOT="1.9"
LICENSE="|| ( MPL-1.1 GPL-2 LGPL-2.1 )"
IUSE="+alsa debug python" # qt-experimental

#	qt-experimental? (
#		x11-libs/qt-gui
#		x11-libs/qt-core )

# nspr-4.8 due to BMO #499144
# Disable sqlite temporarily  	>=dev-db/sqlite-3.6.7
RDEPEND="java? ( >=virtual/jre-1.4 )
	>=dev-lang/python-2.3[threads]
	>=sys-devel/binutils-2.16.1
	>=dev-libs/nss-3.12.3
	>=dev-libs/nspr-4.8
	alsa? ( media-libs/alsa-lib )
	>=app-text/hunspell-1.2
	>=media-libs/lcms-1.17
	>=x11-libs/cairo-1.8.8[X]
	x11-libs/pango[X]"

DEPEND="java? ( >=virtual/jdk-1.4 )
	${RDEPEND}
	dev-util/pkgconfig"

S="${WORKDIR}/mozilla"

# Needed by src_compile() and src_install().
# Would do in pkg_setup but that loses the export attribute, they
# become pure shell variables.
export BUILD_OFFICIAL=1
export MOZILLA_OFFICIAL=1

pkg_setup() {
	java-pkg-opt-2_pkg_setup
}

src_prepare() {
	# Apply our patches
	EPATCH_SUFFIX="patch" \
	EPATCH_FORCE="yes" \
	epatch "${WORKDIR}"

	# Moblin patches
	epatch "${FILESDIR}/${PN}-mozilla-jemalloc.patch"
	epatch "${FILESDIR}/${PN}-pkgconfig.patch"
	epatch "${FILESDIR}/${PN}-moblin-repack.patch"
	epatch "${FILESDIR}/${PN}-plugin-focus.patch"

	# Same as in config/autoconf.mk.in
	MOZLIBDIR="/usr/$(get_libdir)/${PN}-${MAJ_PV}"
	SDKDIR="/usr/$(get_libdir)/${PN}-devel-${MAJ_PV}/sdk"

	# Gentoo install dirs
	sed -i -e "s:@PV@:${MAJ_PV}:" "${S}"/config/autoconf.mk.in \
		|| die "${MAJ_PV} sed failed!"

	# Enable gnomebreakpad
	if use debug ; then
		sed -i -e "s:GNOME_DISABLE_CRASH_DIALOG=1:GNOME_DISABLE_CRASH_DIALOG=0:g" \
			"${S}"/build/unix/run-mozilla.sh || die "sed failed!"
	fi

	eautoreconf

	cd js/src
	eautoreconf
	
	# Patch in support to reset all LANG variables to C
	# Do NOT add to patchset as it must be applied after eautoreconf
	epatch "${FILESDIR}/000_flex-configure-LANG.patch"
}

src_configure() {
	####################################
	#
	# mozconfig, CFLAGS and CXXFLAGS setup
	#
	####################################

	mozconfig_init
	mozconfig_config

	MEXTENSIONS="default"
	if use python ; then
		MEXTENSIONS="${MEXTENSIONS},python/xpcom"
	fi

	MOZLIBDIR="/usr/$(get_libdir)/${PN}-${MAJ_PV}"

	# It doesn't compile on alpha without this LDFLAGS
	use alpha && append-ldflags "-Wl,--no-relax"

	mozconfig_annotate '' --enable-extensions="${MEXTENSIONS}"
	mozconfig_annotate '' --enable-application=xulrunner
	mozconfig_annotate '' --disable-mailnews
	mozconfig_annotate 'broken' --disable-crashreporter
	mozconfig_annotate '' --enable-image-encoder=all
	mozconfig_annotate '' --enable-canvas
	# Bug 60668: Galeon doesn't build without oji enabled, so enable it
	# regardless of java setting.
	mozconfig_annotate '' --enable-oji --enable-mathml
	mozconfig_annotate 'places' --enable-storage --enable-places
	mozconfig_annotate '' --enable-safe-browsing

	# System-wide install specs
	mozconfig_annotate '' --disable-installer
	mozconfig_annotate '' --disable-updater
	mozconfig_annotate '' --disable-strip
	mozconfig_annotate '' --disable-install-strip

	# Use system libraries
	mozconfig_annotate '' --enable-system-cairo
	mozconfig_annotate '' --enable-system-hunspell
	# mozconfig_annotate '' --enable-system-sqlite
	mozconfig_annotate '' --with-system-nspr
	mozconfig_annotate '' --with-system-nss
	mozconfig_annotate '' --enable-system-lcms
	mozconfig_annotate '' --with-system-bz2

	# IUSE qt-experimental
#	if use qt-experimental ; then
#		ewarn "You are enabling the EXPERIMENTAL qt toolkit"
#		ewarn "Usage is at your own risk"
#		ewarn "Known to be broken. DO NOT file bugs."
#		mozconfig_annotate '' --disable-system-cairo
#		mozconfig_annotate 'qt-experimental' --enable-default-toolkit=cairo-qt
#	else
		mozconfig_annotate 'moblin' --enable-default-toolkit=cairo-headless
#	fi

	# Other ff-specific settings
	mozconfig_annotate '' --enable-jsd
	mozconfig_annotate '' --enable-xpctools
	mozconfig_annotate '' --with-default-mozilla-five-home="${MOZLIBDIR}"

	# Disable/Enable audio support based on USE
	mozconfig_use_enable alsa ogg
	mozconfig_use_enable alsa wave

	# Disable java
	if ! use java ; then
		mozconfig_annotate '-java' --disable-javaxpcom
	fi

	# Debug
	if use debug ; then
		mozconfig_annotate 'debug' --disable-optimize
		mozconfig_annotate 'debug' --enable-debug=-ggdb
		mozconfig_annotate 'debug' --enable-debug-modules=all
		mozconfig_annotate 'debug' --enable-debugger-info-modules
	fi

	# Finalize and report settings
	mozconfig_final

	if [[ $(gcc-major-version) -lt 4 ]]; then
		append-flags -fno-stack-protector
	fi

	####################################
	#
	#  Configure and build
	#
	####################################

	# Disable no-print-directory
	MAKEOPTS=${MAKEOPTS/--no-print-directory/}

	# Ensure that are plugins dir is enabled as default
	sed -i -e "s:/usr/lib/mozilla/plugins:/usr/$(get_libdir)/nsbrowser/plugins:" \
		"${S}"/xpcom/io/nsAppFileLocationProvider.cpp || die "sed failed to replace plugin path!"

	CC="$(tc-getCC)" CXX="$(tc-getCXX)" LD="$(tc-getLD)" econf
}

src_compile() {
	emake -f client.mk build || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"

	rm "${D}"/usr/bin/xulrunner

	MOZLIBDIR="/usr/$(get_libdir)/${PN}-${MAJ_PV}"
	SDKDIR="/usr/$(get_libdir)/${PN}-devel-${MAJ_PV}/sdk"

	dodir /usr/bin
	dosym "${MOZLIBDIR}/xulrunner" "/usr/bin/xulrunner-${MAJ_PV}" || die

	# Install python modules
	dosym "${MOZLIBDIR}/python/xpcom" "/$(python_get_sitedir)/xpcom" || die

	# env.d file for ld search path
	dodir /etc/env.d
	echo "LDPATH=${MOZLIBDIR}" > "${D}"/etc/env.d/08xulrunner || die "env.d failed"

	# Add our defaults to xulrunner and out of firefox
	cp "${FILESDIR}"/xulrunner-default-prefs.js \
		"${D}/${MOZLIBDIR}/defaults/pref/all-gentoo.js" || die "failed to cp xulrunner-default-prefs.js"

	if use java ; then
		java-pkg_regjar "${D}/${MOZLIBDIR}/javaxpcom.jar"
		java-pkg_regjar "${D}/${SDKDIR}/lib/MozillaGlue.jar"
		java-pkg_regjar "${D}/${SDKDIR}/lib/MozillaInterfaces.jar"
	fi
}

pkg_postinst() {

	MOZLIBDIR="/usr/$(get_libdir)/${PN}-${MAJ_PV}"

	if use python ; then
		python_need_rebuild
		python_mod_optimize "${MOZLIBDIR}/python"
	fi

	ewarn "If firefox fails to start with \"failed to load xpcom\", run revdep-rebuild"
	ewarn "If that does not fix the problem, rebuild dev-libs/nss"
	ewarn "Try dev-util/lafilefixer if you get build failures related to .la files"

	einfo
	einfo "All prefs can be overridden by the user. The preferences are to make"
	einfo "use of xulrunner out of the box on an average system without the user"
	einfo "having to go through and enable the basics."
}

pkg_postrm() {

	MOZLIBDIR="/usr/$(get_libdir)/${PN}-${MAJ_PV}"

	if use python ; then
		python_mod_cleanup "${MOZLIBDIR}/python"
	fi
}
