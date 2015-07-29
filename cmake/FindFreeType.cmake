# - find FreeType
# FREETYPE_INCLUDE_DIR - Where to find FreeType header files (directory)
# FREETYPE_LIBRARIES - FreeType libraries
# FREETYPE_LIBRARY_RELEASE - Where the release library is
# FREETYPE_LIBRARY_DEBUG - Where the debug library is
# FREETYPE_FOUND - Set to TRUE if we found everything (library, includes and executable)

# Copyright (c) 2015  , < >
#
# Redistribution and use is allowed according to the terms of the BSD license.
# For details see the accompanying COPYING-CMAKE-SCRIPTS file.
#
# Generated by CModuler, a CMake Module Generator - http://gitorious.org/cmoduler

IF( FREETYPE_INCLUDE_DIR AND FREETYPE_LIBRARY_RELEASE AND FREETYPE_LIBRARY_DEBUG )
    SET(FREETYPE_FIND_QUIETLY TRUE)
ENDIF( FREETYPE_INCLUDE_DIR AND FREETYPE_LIBRARY_RELEASE AND FREETYPE_LIBRARY_DEBUG )

FIND_PATH( FREETYPE_INCLUDE_DIR ft2build.h  )

FIND_LIBRARY(FREETYPE_LIBRARY_RELEASE NAMES freetype HINTS /usr/lib/)

FIND_LIBRARY(FREETYPE_LIBRARY_DEBUG NAMES freetype  HINTS /usr/lib/debug/usr/lib/ )

IF( FREETYPE_LIBRARY_RELEASE OR FREETYPE_LIBRARY_DEBUG AND FREETYPE_INCLUDE_DIR )
	SET( FREETYPE_FOUND TRUE )
ENDIF( FREETYPE_LIBRARY_RELEASE OR FREETYPE_LIBRARY_DEBUG AND FREETYPE_INCLUDE_DIR )

IF( FREETYPE_LIBRARY_DEBUG AND FREETYPE_LIBRARY_RELEASE )
	# if the generator supports configuration types then set
	# optimized and debug libraries, or if the CMAKE_BUILD_TYPE has a value
	IF( CMAKE_CONFIGURATION_TYPES OR CMAKE_BUILD_TYPE )
		SET( FREETYPE_LIBRARIES optimized ${FREETYPE_LIBRARY_RELEASE} debug ${FREETYPE_LIBRARY_DEBUG} )
	ELSE( CMAKE_CONFIGURATION_TYPES OR CMAKE_BUILD_TYPE )
    # if there are no configuration types and CMAKE_BUILD_TYPE has no value
    # then just use the release libraries
		SET( FREETYPE_LIBRARIES ${FREETYPE_LIBRARY_RELEASE} )
	ENDIF( CMAKE_CONFIGURATION_TYPES OR CMAKE_BUILD_TYPE )
ELSEIF( FREETYPE_LIBRARY_RELEASE )
	SET( FREETYPE_LIBRARIES ${FREETYPE_LIBRARY_RELEASE} )
ELSE( FREETYPE_LIBRARY_DEBUG AND FREETYPE_LIBRARY_RELEASE )
	SET( FREETYPE_LIBRARIES ${FREETYPE_LIBRARY_DEBUG} )
ENDIF( FREETYPE_LIBRARY_DEBUG AND FREETYPE_LIBRARY_RELEASE )

IF( FREETYPE_FOUND )
	MESSAGE( STATUS "Found FreeType header file in ${FREETYPE_INCLUDE_DIR}")
	MESSAGE( STATUS "Found FreeType libraries: ${FREETYPE_LIBRARIES}")
ELSE(FREETYPE_FOUND)
	MESSAGE( FATAL_ERROR "Could not find FreeType" )
ENDIF(FREETYPE_FOUND)
