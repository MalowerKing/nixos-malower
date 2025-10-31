{pkgs, pkgs-unstable, ...}: {
environment.systemPackages = with pkgs-unstable; [
        searxng
        ];

services.searx = {
        enable = true;
        environmentFile = "/home/malower/.searxng.env";

        #SearXNG config
        settings = {
                general = {
                        debug = false;
                        instance_name = "SearXNG";
                        };

                search = {
                        safe_search = 0;
                        autocomplete = "duckduckgo";
                        autocomplete_min = 3;
                        default_locale = "pl";
                        default_lang = "auto";
                        ban_time_on_fail = 5;
                        max_ban_time_on_fail = 120;
                        };

                server = {
                        port = 2137;
                        bind_address = "127.0.0.1";
                        base_url = "http://127.0.0.1:2137/";
                        method = "POST";
                        };

                ui = {
                        query_in_title = true;
                        infinite_scroll = true;
                        default_theme = "simple";
                        theme_args.simple_style = "dark";
                        search_on_category_select = true;
                        url_formatting = "pretty";
                        };

                outgoing = {
                        request_timeout = 3;
                        pool_connections = 100;
                        pool_maxsize = 20;
                        enable_http2 = true;
                        };

                enabled_plugins = [
                         "Basic Calculator"
                        "Hash plugin"
                        "Tor check plugin"
                        "Open Access DOI rewrite"
                        "Hostnames plugin"
                        "Unit converter plugin"
                        "Tracker URL remover"
                        ];

                };
        };
}
