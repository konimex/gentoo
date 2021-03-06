# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop qmake-utils

MY_P=${PN}_${PV}

DESCRIPTION="A Qt5 client for the music player daemon (MPD) written in C++"
HOMEPAGE="https://sourceforge.net/projects/quimup/"
SRC_URI="mirror://sourceforge/${PN}/${MY_P}_source.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtnetwork:5
	dev-qt/qtwidgets:5
	>=media-libs/libmpdclient-2.3
	media-libs/taglib
"
DEPEND="${RDEPEND}
	virtual/pkgconfig
"

S="${WORKDIR}/${PN^}_${PV}"

DOCS=( changelog FAQ.txt README )

src_configure() {
	eqmake5
}

src_install() {
	default
	dobin ${PN}

	newicon src/resources/mn_icon.png ${PN}.png
	make_desktop_entry ${PN} Quimup
}
