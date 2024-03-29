# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A multi-purpose WAVE data processing and reporting utility"
HOMEPAGE="http://shnutils.freeshell.org/shntool/"
SRC_URI="http://shnutils.freeshell.org/shntool/dist/src/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~ppc x86 ~amd64-linux ~x86-linux ~ppc-macos"
IUSE="alac flac mac shorten sox wavpack"

RDEPEND="
	alac? ( media-sound/alac_decoder )
	flac? ( media-libs/flac )
	mac? ( media-sound/mac )
	shorten? ( media-sound/shorten )
	sox? ( media-sound/sox )
	wavpack? ( media-sound/wavpack )"
DEPEND="${RDEPEND}"
PATCHES=(
    "${FILESDIR}/debian_patches_950803.patch"
	"${FILESDIR}/shntool-3.0.10-large-size.diff"
	"${FILESDIR}/shntool-3.0.10-large-times.diff"
	"${FILESDIR}/debian_patches_no-cdquality-check.patch"
)


src_configure() {
	export CONFIG_SHELL=${BASH}  # bug #527310
	default
}

src_install() {
	default
	dodoc -r doc/.
}
