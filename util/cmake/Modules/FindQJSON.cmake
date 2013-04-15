# - Find libqjon library and headers
# The module defines the following variables:
#
#  QJSON_FOUND
#  QJSON_INCLUDE_DIRS
#  QJSON_LIBRARIES
#  QJSON_VERSION
#
# If QJSON_VERSION equal to "system", it means it was not find with pkg-config.

# Copyright (c) 2013 Tristan Le Guern <leguern AT medu.se>
#
# Permission to use, copy, modify, and distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
# ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
# OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

# Check if the definitions are not already in cache
IF(QJSON_INCLUDE_DIRS AND QJSON_LIBRARIES)
    SET(QJSON_FIND_QUIETLY TRUE)
ENDIF(QJSON_INCLUDE_DIRS AND QJSON_LIBRARIES)

FIND_PACKAGE(PkgConfig QUIET)
PKG_CHECK_MODULES(PC_QJSON QJson)
SET(QJSON_VERSION ${PC_QJSON_VERSION})
SET(QJSON_DEFINITIONS ${PC_QJSON_DEFINITIONS})

FIND_PATH(QJSON_INCLUDE_DIR qjon/parser.h
    HINTS ${PC_QJSON_INCLUDE_DIRS}
)

FIND_LIBRARY(QJSON_LIBRARY NAMES qjson libqjon
    HINTS ${PC_QJSON_LIBRARY_DIRS}
)

IF(QJSON_INCLUDE_DIR STREQUAL QJSON_LIBRARY-NOTFOUND
  OR QJSON_LIBRARY STREQUAL QJSON_LIBRARY-NOTFOUND)
    UNSET(QJSON_FOUND)
ELSE()
    IF(NOT QJSON_VERSION)
        MESSAGE(STATUS "  but non-package 'libqjson' found")
        SET(QJSON_VERSION "system")
    ENDIF(NOT QJSON_VERSION)
    SET(QJSON_FOUND TRUE)

    # cmake GUI niceness
    MARK_AS_ADVANCED(QJSON_INCLUDE_DIR QJSON_LIBRARY)
ENDIF()

IF(QJSON_FOUND)
    SET(QJSON_LIBRARIES ${QJSON_LIBRARY})
    SET(QJSON_INCLUDE_DIRS ${QJSON_INCLUDE_DIR})
ENDIF(QJSON_FOUND)
