( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b152 - block
    b717 - block
    b203 - block
    b959 - block
    b563 - block
    b873 - block
    b538 - block
    b172 - block
    b210 - block
    b241 - block
    b393 - block
    b806 - block
    b8 - block
    b546 - block
    b623 - block
    b461 - block
    b748 - block
    b286 - block
    b990 - block
    b515 - block
    b360 - block
    b240 - block
    b938 - block
    b940 - block
    b191 - block
    b848 - block
    b560 - block
    b525 - block
    b972 - block
    b761 - block
    b424 - block
    b910 - block
    b649 - block
    b561 - block
    b179 - block
    b46 - block
    b694 - block
    b665 - block
    b810 - block
    b681 - block
    b331 - block
    b808 - block
    b445 - block
    b571 - block
    b35 - block
    b788 - block
    b200 - block
    b856 - block
    b257 - block
    b269 - block
    b193 - block
    b993 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b152 )
    ( on b717 b152 )
    ( on b203 b717 )
    ( on b959 b203 )
    ( on b563 b959 )
    ( on b873 b563 )
    ( on b538 b873 )
    ( on b172 b538 )
    ( on b210 b172 )
    ( on b241 b210 )
    ( on b393 b241 )
    ( on b806 b393 )
    ( on b8 b806 )
    ( on b546 b8 )
    ( on b623 b546 )
    ( on b461 b623 )
    ( on b748 b461 )
    ( on b286 b748 )
    ( on b990 b286 )
    ( on b515 b990 )
    ( on b360 b515 )
    ( on b240 b360 )
    ( on b938 b240 )
    ( on b940 b938 )
    ( on b191 b940 )
    ( on b848 b191 )
    ( on b560 b848 )
    ( on b525 b560 )
    ( on b972 b525 )
    ( on b761 b972 )
    ( on b424 b761 )
    ( on b910 b424 )
    ( on b649 b910 )
    ( on b561 b649 )
    ( on b179 b561 )
    ( on b46 b179 )
    ( on b694 b46 )
    ( on b665 b694 )
    ( on b810 b665 )
    ( on b681 b810 )
    ( on b331 b681 )
    ( on b808 b331 )
    ( on b445 b808 )
    ( on b571 b445 )
    ( on b35 b571 )
    ( on b788 b35 )
    ( on b200 b788 )
    ( on b856 b200 )
    ( on b257 b856 )
    ( on b269 b257 )
    ( on b193 b269 )
    ( on b993 b193 )
    ( clear b993 )
  )
  ( :goal
    ( and
      ( clear b152 )
    )
  )
)
