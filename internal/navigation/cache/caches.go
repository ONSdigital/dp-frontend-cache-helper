package cache

// CacheList is a list of caches for topics API, used to construct our navbar.
type List struct {
	CensusTopic *TopicCache
	Navigation  *NavigationCache
}
