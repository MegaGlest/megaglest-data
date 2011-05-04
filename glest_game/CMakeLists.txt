#########################################################################################
# Game data
CMAKE_MINIMUM_REQUIRED( VERSION 2.6.2 )
PROJECT( MegaGlest )

# Requires an install prefix for the items below to work
IF(NOT CMAKE_INSTALL_PREFIX STREQUAL "")
	# Check if we are running from an SVN folder structure or tarballs
	IF(EXISTS "${PROJECT_SOURCE_DIR}/source/")
		MESSAGE(STATUS "**Data package detected svn folder structure.")

		# Installation of the program config and image files
		INSTALL(FILES 
		  "${PROJECT_SOURCE_DIR}/mk/linux/glest.ini"
		  "${PROJECT_SOURCE_DIR}/mk/linux/glestkeys.ini"
		  "${PROJECT_SOURCE_DIR}/mk/linux/megaglest.bmp"
		  DESTINATION ${MEGAGLEST_DATA_INSTALL_PATH})

		# Installation of the program desktop file
		INSTALL(FILES 
		  "${PROJECT_SOURCE_DIR}/mk/linux/megaglest.desktop"
		  DESTINATION ${MEGAGLEST_DESKTOP_INSTALL_PATH})

		# Installation of the program desktop icon file
		INSTALL(FILES 
		  "${PROJECT_SOURCE_DIR}/mk/linux/megaglest.png"
		  DESTINATION ${MEGAGLEST_ICON_INSTALL_PATH})

		# Installation of data files from outside normal data folder
		INSTALL(DIRECTORY "${PROJECT_SOURCE_DIR}/source/masterserver/flags" 
		  DESTINATION ${MEGAGLEST_DATA_INSTALL_PATH}data/core/misc_textures
		  OPTIONAL REGEX "/.svn" EXCLUDE)

		# Installation of the data
		install(
		  DIRECTORY "${PROJECT_SOURCE_DIR}/data/glest_game/data" 
			    "${PROJECT_SOURCE_DIR}/data/glest_game/docs" 
			    "${PROJECT_SOURCE_DIR}/data/glest_game/maps"
			    "${PROJECT_SOURCE_DIR}/data/glest_game/scenarios"
			    "${PROJECT_SOURCE_DIR}/data/glest_game/techs"
			    "${PROJECT_SOURCE_DIR}/data/glest_game/tilesets"
			    "${PROJECT_SOURCE_DIR}/data/glest_game/tutorials"
		  DESTINATION ${MEGAGLEST_DATA_INSTALL_PATH}
		  OPTIONAL REGEX "/.svn" EXCLUDE)
	ELSE()
		MESSAGE(STATUS "**Data package detected stand alone data folder structure, prefix [${CMAKE_INSTALL_PREFIX}] bindir [${PROJECT_SOURCE_DIR}].")

		SET(MEGAGLEST_BIN_INSTALL_PATH "bin/")
		SET(MEGAGLEST_DATA_INSTALL_PATH "share/megaglest/")
		SET(MEGAGLEST_DESKTOP_INSTALL_PATH "share/applications/")
		SET(MEGAGLEST_ICON_INSTALL_PATH "share/pixmaps/")

		MESSAGE(STATUS "*NOTE: Custom Data Install Path is [${MEGAGLEST_DATA_INSTALL_PATH}]")

		# rename the ini for installation
		install(CODE 
			"EXECUTE_PROCESS(COMMAND \"cmake\" \"-E\" \"copy\" \"${PROJECT_SOURCE_DIR}/glest_linux.ini\" \"${MEGAGLEST_DATA_INSTALL_PATH}/glest.ini\")")

		# Installation of the program config and image files
		INSTALL(FILES 
		  "${PROJECT_SOURCE_DIR}/glestkeys.ini"
		  "${PROJECT_SOURCE_DIR}/megaglest.bmp"
		  DESTINATION ${MEGAGLEST_DATA_INSTALL_PATH})

		# Installation of the program desktop file
		INSTALL(FILES 
		  "${PROJECT_SOURCE_DIR}/megaglest.desktop"
		  DESTINATION ${MEGAGLEST_DESKTOP_INSTALL_PATH})

		# Installation of the program desktop icon file
		INSTALL(FILES 
		  "${PROJECT_SOURCE_DIR}/megaglest.png"
		  DESTINATION ${MEGAGLEST_ICON_INSTALL_PATH})

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
