#########################################################################################
# Game data
CMAKE_MINIMUM_REQUIRED( VERSION 2.6.2 )
PROJECT( MegaGlest )

# Requires an install prefix for the items below to work
IF(NOT CMAKE_INSTALL_PREFIX STREQUAL "")
	MESSAGE(STATUS "Looking for [${PROJECT_SOURCE_DIR}/../glest_game/]")

	# Check if we are running from an SVN folder structure or tarballs
	IF(EXISTS "${PROJECT_SOURCE_DIR}/../glest_game/")
		MESSAGE(STATUS "**Data package detected svn folder structure.")

		# rename the ini for installation
		IF(WIN32)
			INSTALL(FILES 
			  "${PROJECT_SOURCE_DIR}/glest.ini"
			  DESTINATION ${MEGAGLEST_DATA_INSTALL_PATH})
		ELSE()
			INSTALL(FILES 
			  "${PROJECT_SOURCE_DIR}/../../mk/linux/glest.ini"
			  DESTINATION ${MEGAGLEST_DATA_INSTALL_PATH})
		ENDIF()

		# Installation of the program config and image files
		INSTALL(FILES 
		  "${PROJECT_SOURCE_DIR}/../../mk/linux/glestkeys.ini"
		  "${PROJECT_SOURCE_DIR}/../../mk/linux/megaglest.bmp"
		  DESTINATION ${MEGAGLEST_DATA_INSTALL_PATH})

		# Installation of data files from outside normal data folder
		INSTALL(DIRECTORY "${PROJECT_SOURCE_DIR}/../../source/masterserver/flags" 
		  DESTINATION ${MEGAGLEST_DATA_INSTALL_PATH}data/core/misc_textures
		  OPTIONAL REGEX "/.svn" EXCLUDE)

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
		  OPTIONAL REGEX "/.svn" EXCLUDE)
	ELSE()
		MESSAGE(STATUS "**Data package detected stand alone data folder structure, prefix [${CMAKE_INSTALL_PREFIX}] bindir [${PROJECT_SOURCE_DIR}].")

		IF(NOT MEGAGLEST_BIN_INSTALL_PATH)
			SET(MEGAGLEST_BIN_INSTALL_PATH "bin/" CACHE STRING "The installation path for binaries (this is appended to the CMAKE_INSTALL_PREFIX)")
		ENDIF()
		IF(NOT MEGAGLEST_DATA_INSTALL_PATH)
			SET(MEGAGLEST_DATA_INSTALL_PATH "share/megaglest/" CACHE STRING "The installation path for data files (this is appended to the CMAKE_INSTALL_PREFIX)")
		ENDIF()
#		IF(NOT MEGAGLEST_DESKTOP_INSTALL_PATH)
#                	SET(MEGAGLEST_DESKTOP_INSTALL_PATH "share/applications/" CACHE STRING "The installation path for desktop files (this is appended to the CMAKE_INSTALL_PREFIX)")
		#ENDIF()
		IF(NOT MEGAGLEST_ICON_INSTALL_PATH)
                	SET(MEGAGLEST_ICON_INSTALL_PATH "share/pixmaps/" CACHE STRING "The installation path for icon files (this is appended to the CMAKE_INSTALL_PREFIX)")
		ENDIF()
		IF(NOT CUSTOM_DATA_INSTALL_PATH)
			SET(CUSTOM_DATA_INSTALL_PATH "'\\\"${CMAKE_INSTALL_PREFIX}/${MEGAGLEST_DATA_INSTALL_PATH}\\\"'" CACHE STRING "The FULL installation path for data files (this is build automatically by combining CMAKE_INSTALL_PREFIX and MEGAGLEST_DATA_INSTALL_PATH)")
		ENDIF()

		MESSAGE(STATUS "*NOTE: Custom Data Install Path is [${MEGAGLEST_DATA_INSTALL_PATH}]")

		# rename the ini for installation
		IF(WIN32)
			INSTALL(FILES 
			  "${PROJECT_SOURCE_DIR}/glest_windows.ini"
			  DESTINATION ${MEGAGLEST_DATA_INSTALL_PATH}
			  RENAME "glest.ini")
		ELSE()
			#install(CODE "EXECUTE_PROCESS(COMMAND \"cmake\" \"-E\" \"copy\" \"${PROJECT_SOURCE_DIR}/glest_linux.ini\" \"${MEGAGLEST_DATA_INSTALL_PATH}/glest.ini\")")
			INSTALL(FILES 
			  "${PROJECT_SOURCE_DIR}/glest_linux.ini"
			  DESTINATION ${MEGAGLEST_DATA_INSTALL_PATH}
			  RENAME "glest.ini")
		ENDIF()

		# Installation of the program config and image files
		INSTALL(FILES 
		  "${PROJECT_SOURCE_DIR}/glestkeys.ini"
		  "${PROJECT_SOURCE_DIR}/megaglest.bmp"
		  DESTINATION ${MEGAGLEST_DATA_INSTALL_PATH})

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
		  OPTIONAL REGEX "/.svn" EXCLUDE)

	ENDIF()
ENDIF()
