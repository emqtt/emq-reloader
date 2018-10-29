PROJECT = emqx_reloader
PROJECT_DESCRIPTION = EMQ X Reloader Plugin
PROJECT_VERSION = 3.0

BUILD_DEPS = emqx
dep_emqx = git https://github.com/emqtt/emqttd emqx30

TEST_DEPS = emqx_ct_helpers
dep_emqx_ct_helpers = git https://github.com/emqx/emqx-ct-helpers

ERLC_OPTS += +debug_info
ERLC_OPTS += +warnings_as_errors +warn_export_all +warn_unused_import

COVER = true

include erlang.mk

app:: rebar.config

app.config::
	./deps/cuttlefish/cuttlefish -l info -e etc/ -c etc/emqx_reloader.conf -i priv/emqx_reloader.schema -d data
