#########################################################################################
# Game data
CMAKE_MINIMUM_REQUIRED( VERSION 2.6.2 )
PROJECT( MegaGlest )

# Requires an install prefix for the items below to work
IF(NOT CMAKE_INSTALL_PREFIX STREQUAL "")
        MESSAGE(STATUS "**Data package INSTALL triggered.")

        IF(NOT MEGAGLEST_DATA_INSTALL_PATH)
	        SET(MEGAGLEST_DATA_INSTALL_PATH "share/megaglest/" CACHE STRING "The installation path for data files (this is appended to the CMAKE_INSTALL_PREFIX)")
        ENDIF()

        # Installation of the data
        install(
          DIRECTORY "${PROJECT_SOURCE_DIR}/data" 
	            "${PROJECT_SOURCE_DIR}/docs" 
	            "${PROJECT_SOURCE_DIR}/maps"
	            "${PROJECT_SOURCE_DIR}/scenarios"
	            "${PROJECT_SOURCE_DIR}/techs"
	            "${PROJECT_SOURCE_DIR}/tilesets"
	            "${PROJECT_SOURCE_DIR}/tutorials"
          DESTINATION ${MEGAGLEST_DATA_INSTALL_PATH}
          OPTIONAL REGEX "/.git" EXCLUDE)

ENDIF()
