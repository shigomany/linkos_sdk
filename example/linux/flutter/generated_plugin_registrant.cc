//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <linkos_sdk/linkos_sdk_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) linkos_sdk_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "LinkosSdkPlugin");
  linkos_sdk_plugin_register_with_registrar(linkos_sdk_registrar);
}
