# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit pax-utils

DESCRIPTION="Multichat messenger"
HOMEPAGE="http://meetfranz.com/"
SRC_URI="http://downloads.meetfranz.com/releases/${PV}/Franz-linux-x64-${PV}.tgz"

LICENSE="Propietary"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=""
DEPEND="${RDEPEND}"

RESTRICT="strip binchecks"

S="${WORKDIR}"

src_install() {
	dodir /opt/franz
	insinto /opt/franz
	doins -r resources
	doins -r locales
	doins content_shell.pak
	doins icudtl.dat
	doins libffmpeg.so
	doins libgcrypt.so.11
	doins libnode.so
	doins natives_blob.bin
	doins snapshot_blob.bin
	exeinto /opt/bin/
	doexe Franz
	pax-mark m /opt/franz/Franz
	dosym /opt/franz/Franz /opt/bin/Franz
}
