# Copyright 2014 Maksym Sditanov <feniksa@rambler.ru>
# Distributed under the terms of the Apache 2 License
# $Header: $

# ELASS: webos-github.eclass
# @MAINTAINER:
# Maksym Sditanov
# @BLURB: Eclass for fetching project from github
# @DESCRIPTION:
# This eclass is ment to easy writting ebuilds for webos. It setup some predevined env variables

inherit versionator

MAJORV=$(get_major_version)
SRC_URI="https://github.com/openwebos/${PN}/archive/submissions/${MAJORV}.zip -> ${P}.zip"
S="${WORKDIR}/${PN}-submissions-${MAJORV}"
