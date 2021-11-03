# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit linux-info linux-mod eutils

DESCRIPTION="Updated driver for rtl88x2bu wifi adaptors based on Realtek's source distributed with myriad adapters."
HOMEPAGE="https://github.com/cilynx/rtl88x2bu"

MY_PV="5.6.1_30362.20181109_COEX20180928-6a6a"
MY_P="${PN}-${MY_PV}"
SRC_URI="https://github.com/cilynx/rtl88x2bu/archive/refs/heads/${MY_PV} -> ${P}.zip"

KEYWORDS="~amd64"

LICENSE="MIT"
SLOT="0"

KERNEL_DEPEND="5.10.75"
DEPEND="|| (
    >=sys-kernel/gentoo-kernel-${KERNEL_DEPEND}
    >=sys-kernel/gentoo-kernel-bin-${KERNEL_DEPEND}
    >=sys-kernel/gentoo-sources-${KERNEL_DEPEND}
)"

MODULE_NAMES="88x2bu(kernel/drivers/net/wireless:${S})"
BUILD_TARGETS="modules"

src_unpack() {
	if [[ -n ${A} ]]; then
		unpack ${A}
		mv -v ${WORKDIR}/${MY_P} ${WORKDIR}/${P}
	fi
}

src_prepare() {
	sed -i -e "s:-C \$(KSRC):-C /lib/modules/${KV_FULL}/build:" Makefile || die "Sed failed!"
	eapply_user
}

pkg_setup() {
	linux-mod_pkg_setup
}

src_compile() {
	BUILD_PARAMS="KERNELDIR=${KERNEL_DIR}"
	linux-mod_src_compile
}

src_install() {
	linux-mod_src_install
}
