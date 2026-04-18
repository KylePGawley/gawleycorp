-- Gawleycorp Prosody Configuration
-- Domain
VirtualHost "gawley.net"

-- Authentication via LLDAP
authentication = "ldap"

ldap_base = "ou=people,dc=gawley,dc=net"
ldap_server = "lldap"
ldap_rootdn = "uid=admin,ou=people,dc=gawley,dc=net"
ldap_password = os.getenv("LLDAP_ADMIN_PASS")
ldap_filter = "(uid=$user)"
ldap_mode = "bind"

-- Modules
modules_enabled = {
    "roster";
    "saslauth";
    "tls";
    "dialback";
    "disco";
    "carbons";
    "pep";
    "private";
    "blocklist";
    "vcard4";
    "vcard_legacy";
    "version";
    "uptime";
    "time";
    "ping";
    "register";
    "admin_adhoc";
    "websocket";
    "http";
}

-- HTTP/WebSocket
http_interfaces = { "*" }
https_interfaces = { "*" }
http_ports = { 5280 }
https_ports = { 5281 }

cross_domain_websocket = true
consider_websocket_secure = true

-- TLS
ssl = {
    certificate = "/etc/prosody/certs/gawley.net.crt";
    key = "/etc/prosody/certs/gawley.net.key";
}

-- Logging
log = {
    debug = "/var/log/prosody/prosody.log";
    error = "/var/log/prosody/prosody.err";
}

-- MUC (group chat)
Component "conference.gawley.net" "muc"
    modules_enabled = { "muc_mam" }