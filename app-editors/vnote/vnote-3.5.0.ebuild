# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit qmake-utils xdg

DESCRIPTION="VNote is a Qt-based, free and open source note-taking application, focusing on Markdown now. VNote is designed to provide a pleasant note-taking platform with excellent editing experience.

VNote is NOT just a simple editor for Markdown. By providing notes management, VNote makes taking notes in Markdown simpler. In the future, VNote will support more formats besides Markdown.

Utilizing Qt, VNote could run on Linux, Windows, and macOS."
HOMEPAGE="https://github.com/vnotex/vnote"
HOEDOWN_VERSION="4.0.0"
MARKED_VERSION="0.6.0"
SRC_URI="
	https://github.com/vnotex/vnote/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/tamlok/hoedown/archive/${HOEDOWN_VERSION}.tar.gz -> hoedown-${HOEDOWN_VERSION}.tar.gz
	https://github.com/markedjs/marked/archive/v${MARKED_VERSION}.tar.gz -> marked-${MARKED_VERSION}.tar.gz"

KEYWORDS="~amd64 ~arm ~arm64 ~x86"

LICENSE="MIT"
SLOT="0"

DEPEND="
	>=dev-qt/qtcore-5.9:5=
	>=dev-qt/qtwebengine-5.9:5=[widgets]
	>=dev-qt/qtsvg-5.9:5=
"
RDEPEND="${DEPEND}"

src_prepare() {
	mv "${WORKDIR}/hoedown-${HOEDOWN_VERSION}"/* "${S}/hoedown" || die
	mv "${WORKDIR}/marked-${MARKED_VERSION}"/* "${S}/src/utils/marked" || die
	default
}

src_configure(){
	eqmake5 VNote.pro
}

src_install() {
	INSTALL_ROOT="${ED%/}" default
}
