# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit qmake-utils git-r3

DESCRIPTION="Additional style plugins for Qt5 (gtk2, cleanlook, plastic, motif)"
HOMEPAGE="https://code.qt.io/cgit/qt/qtstyleplugins.git/"
EGIT_REPO_URI="https://code.qt.io/qt/qtstyleplugins.git"
EGIT_COMMIT="7bd6205398b2d89b3ac083b2f6f00b197f40057a"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	x11-libs/gtk+:2
	dev-qt/qtgui:5=[dbus]
	dev-qt/qtdbus:5=
	x11-libs/libX11"
RDEPEND="${DEPEND}"

src_configure() {
	eqmake5
}

src_install() {
	emake INSTALL_ROOT="${ED}" install
}

pkg_postinst() {
	elog ""
	elog "To make Qt5 applications use the gtk2 style"
	elog "insert the following into ~/.profile:"
	elog "QT_QPA_PLATFORMTHEME=gtk2"
	elog "For environments using ~/.pam_environment (gnome wayland):"
	elog "QT_QPA_PLATFORMTHEME OVERRIDE=gtk2"
	elog ""
}
