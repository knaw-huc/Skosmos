vcl 4.0;

backend default {
    .host = "graphdb";
    .port = "7200";
}

sub vcl_backend_response {
    # store for a long time (1 week)
    set beresp.ttl = 1w;
    # always gzip before storing, to save space in the cache
    set beresp.do_gzip = true;
}
