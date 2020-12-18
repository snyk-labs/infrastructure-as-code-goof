resource "azurerm_virtual_machine" "allowed" {
}

resource "azurerm_linux_virtual_machine" "allowed" {
  custom_data =<<CUSTOM
I2Nsb3VkLWNvbmZpZwp3cml0ZV9maWxlczoKICAgIC0gcGF0aDogIi9ldGMvcHJvZmlsZS5lbnYi
CiAgICAgICAgICBjb250ZW50OiBleHBvcnQgTk9UX1NFQ1JFVD10ZXN0Cgo=
CUSTOM
}
