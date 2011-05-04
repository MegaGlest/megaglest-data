#########################################################################################
# Game data

SET(EXTERNAL_LIBS "")

# Requires an install prefix for the items below to work
IF(NOT CMAKE_INSTALL_PREFIX STREQUAL "")

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
ENDIF()
