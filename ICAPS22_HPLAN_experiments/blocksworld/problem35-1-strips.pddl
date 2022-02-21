( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b925 - block
    b255 - block
    b830 - block
    b140 - block
    b258 - block
    b656 - block
    b742 - block
    b127 - block
    b700 - block
    b340 - block
    b998 - block
    b889 - block
    b318 - block
    b525 - block
    b904 - block
    b704 - block
    b405 - block
    b439 - block
    b456 - block
    b445 - block
    b362 - block
    b205 - block
    b38 - block
    b299 - block
    b839 - block
    b661 - block
    b851 - block
    b164 - block
    b468 - block
    b535 - block
    b903 - block
    b438 - block
    b363 - block
    b476 - block
    b738 - block
    b983 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b925 )
    ( on b255 b925 )
    ( on b830 b255 )
    ( on b140 b830 )
    ( on b258 b140 )
    ( on b656 b258 )
    ( on b742 b656 )
    ( on b127 b742 )
    ( on b700 b127 )
    ( on b340 b700 )
    ( on b998 b340 )
    ( on b889 b998 )
    ( on b318 b889 )
    ( on b525 b318 )
    ( on b904 b525 )
    ( on b704 b904 )
    ( on b405 b704 )
    ( on b439 b405 )
    ( on b456 b439 )
    ( on b445 b456 )
    ( on b362 b445 )
    ( on b205 b362 )
    ( on b38 b205 )
    ( on b299 b38 )
    ( on b839 b299 )
    ( on b661 b839 )
    ( on b851 b661 )
    ( on b164 b851 )
    ( on b468 b164 )
    ( on b535 b468 )
    ( on b903 b535 )
    ( on b438 b903 )
    ( on b363 b438 )
    ( on b476 b363 )
    ( on b738 b476 )
    ( on b983 b738 )
    ( clear b983 )
  )
  ( :goal
    ( and
      ( clear b925 )
    )
  )
)
