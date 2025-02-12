#!/command/with-contenv bashio
# ==============================================================================
# Home Assistant Community Add-on: SQLite Web
# This files adds some patches to the add-on
# ==============================================================================
declare database

database="/config/home-assistant_v2.db"
if bashio::config.has_value 'database'; then
    database="$(bashio::config 'database')"
fi

if ! bashio::fs.file_exists "${database}"; then
    bashio::exit.nok "The database file '${database}' is not found"
fi

# Made tables go wide!
sed -i "s#container#container-fluid#g" \
    /usr/lib/python3.10/site-packages/sqlite_web/templates/base.html
