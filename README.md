# dp-frontend-cache-helper
Helps you cache data for dp-renderer in your frontends.  

Bootstrap example:

```
cacheHelper "github.com/ONSdigital/dp-frontend-cache-helper/pkg/navigation/helper"

navCache, err := cacheHelper.Init(ctx, cacheHelper.Config{
		APIRouterURL:                cfg.APIRouterURL, // API Router URL
		CacheUpdateInterval:         cfg.CacheUpdateInterval, // 0 means update at startup only.  Time in minutes.
        EnableNewNavBar:             cfg.EnableNewNavBar, // Used to turn on/off.  
		EnableCensusTopicSubsection: cfg.EnableCensusTopicSubsection, // Whether to include centus topic subsection.
		CensusTopicID:               cfg.CensusTopicID, // Navigation is tied to 4445 in sandbox.
		IsPublishingMode:            cfg.IsPublishingMode, // Whether not we're in the public subnet.
		Languages:                   cfg.SupportedLanguages, // Usually []string{"en", "cy"}; English and Welsh
		ServiceAuthToken:            cfg.ServiceAuthToken, // Service to Service Auth token.  Required for publishing subnet.
	})

// Starts the background jobs.
navCache.RunUpdates(ctx, svcErrors)  
```

Then within your handlers:

```
mappedNavContent, err := navCache.GetMappedNavigationContent(ctx, lang)
if err != nil && navCache.Config.EnableNewNavBar == true {
    model.NavigationContent = mappedNavContent
}
```

