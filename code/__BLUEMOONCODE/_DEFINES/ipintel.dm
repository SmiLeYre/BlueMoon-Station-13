// Connection types. These match enums in the SQL DB. Dont change them
/// Client was let into the server
#define CONNECTION_TYPE_ESTABLISHED "ESTABLISHED"
/// Client was disallowed due to IPIntel
#define CONNECTION_TYPE_DROPPED_IPINTEL "DROPPED - IPINTEL"
/// Client was disallowed due to being banned
#define CONNECTION_TYPE_DROPPED_BANNED "DROPPED - BANNED"
/// Client was disallowed due to invalid data
#define CONNECTION_TYPE_DROPPED_INVALID "DROPPED - INVALID"
