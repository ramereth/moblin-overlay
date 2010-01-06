# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit clutter

DESCRIPTION="Clutter-Box2D - Box2D Integration library for clutter"

SLOT="1.0"
KEYWORDS="~amd64 ~x86"
IUSE="doc examples"

RDEPEND="
	media-libs/clutter:1.0"
DEPEND="${RDEPEND}
	virtual/python"

DOCS="AUTHORS ChangeLog NEWS README"
EXAMPLES="examples/{*.c,*.png,README}"
