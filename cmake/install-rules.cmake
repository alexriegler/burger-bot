install(
    TARGETS burger-bot_exe
    RUNTIME COMPONENT burger-bot_Runtime
)

if(PROJECT_IS_TOP_LEVEL)
  include(CPack)
endif()
