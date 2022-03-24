( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b485 - block
    b605 - block
    b319 - block
    b387 - block
    b225 - block
    b461 - block
    b564 - block
    b296 - block
    b772 - block
    b39 - block
    b920 - block
    b832 - block
    b21 - block
    b529 - block
    b27 - block
    b612 - block
    b202 - block
    b508 - block
    b114 - block
    b279 - block
    b910 - block
    b843 - block
    b364 - block
    b726 - block
    b984 - block
    b268 - block
    b755 - block
    b490 - block
    b893 - block
    b557 - block
    b717 - block
    b548 - block
    b218 - block
    b177 - block
    b996 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b485 )
    ( on b605 b485 )
    ( on b319 b605 )
    ( on b387 b319 )
    ( on b225 b387 )
    ( on b461 b225 )
    ( on b564 b461 )
    ( on b296 b564 )
    ( on b772 b296 )
    ( on b39 b772 )
    ( on b920 b39 )
    ( on b832 b920 )
    ( on b21 b832 )
    ( on b529 b21 )
    ( on b27 b529 )
    ( on b612 b27 )
    ( on b202 b612 )
    ( on b508 b202 )
    ( on b114 b508 )
    ( on b279 b114 )
    ( on b910 b279 )
    ( on b843 b910 )
    ( on b364 b843 )
    ( on b726 b364 )
    ( on b984 b726 )
    ( on b268 b984 )
    ( on b755 b268 )
    ( on b490 b755 )
    ( on b893 b490 )
    ( on b557 b893 )
    ( on b717 b557 )
    ( on b548 b717 )
    ( on b218 b548 )
    ( on b177 b218 )
    ( on b996 b177 )
    ( clear b996 )
  )
  ( :goal
    ( and
      ( clear b485 )
    )
  )
)
