# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit qmake-utils xdg git-r3

DESCRIPTION="VNote is a Qt-based, free and open source note-taking application, focusing on Markdown now. VNote is designed to provide a pleasant note-taking platform with excellent editing experience.

VNote is NOT just a simple editor for Markdown. By providing notes management, VNote makes taking notes in Markdown simpler. In the future, VNote will support more formats besides Markdown.

Utilizing Qt, VNote could run on Linux, Windows, and macOS."
HOMEPAGE="https://github.com/vnotex/vnote"
EGIT_REPO_URI="https://github.com/vnotex/vnote"
EGIT_COMMIT="v${PV}"
QT_VERSION="5.12"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"

LICENSE="MIT"
SLOT="0"

DEPEND="
	>=dev-qt/qtwebengine-${QT_VERSION}
	>=dev-qt/qtsvg-${QT_VERSION}
	>=dev-qt/qtlocation-${QT_VERSION}
	>=dev-qt/qtwebchannel-${QT_VERSION}
	>=dev-qt/qttranslations-${QT_VERSION}
	>=dev-qt/linguist-tools-${QT_VERSION}
"
RDEPEND="${DEPEND}"

src_prepare() {
	default
	sed  -i "s/\$\${PREFIX}\/lib/\$\${PREFIX}\/$(get_libdir)/g" "${S}/libs/vtextedit/src/editor/editor.pro" || die
	sed  -i "s/\$\${PREFIX}\/lib/\$\${PREFIX}\/$(get_libdir)/g" "${S}/libs/vtextedit/src/libs/syntax-highlighting/syntax-highlighting.pro" || die
}

src_configure(){
	
	eqmake5 vnote.pro
}

src_install() {
	INSTALL_ROOT="${ED%/}" default
}
