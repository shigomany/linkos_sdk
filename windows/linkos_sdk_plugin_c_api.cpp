#include "include/linkos_sdk/linkos_sdk_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "linkos_sdk_plugin.h"

void LinkosSdkPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  linkos_sdk::LinkosSdkPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
