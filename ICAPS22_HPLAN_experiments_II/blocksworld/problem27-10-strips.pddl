( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b456 - block
    b915 - block
    b233 - block
    b916 - block
    b763 - block
    b951 - block
    b297 - block
    b184 - block
    b309 - block
    b615 - block
    b121 - block
    b298 - block
    b199 - block
    b461 - block
    b739 - block
    b134 - block
    b460 - block
    b65 - block
    b474 - block
    b693 - block
    b673 - block
    b141 - block
    b220 - block
    b66 - block
    b423 - block
    b211 - block
    b397 - block
    b164 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b456 )
    ( on b915 b456 )
    ( on b233 b915 )
    ( on b916 b233 )
    ( on b763 b916 )
    ( on b951 b763 )
    ( on b297 b951 )
    ( on b184 b297 )
    ( on b309 b184 )
    ( on b615 b309 )
    ( on b121 b615 )
    ( on b298 b121 )
    ( on b199 b298 )
    ( on b461 b199 )
    ( on b739 b461 )
    ( on b134 b739 )
    ( on b460 b134 )
    ( on b65 b460 )
    ( on b474 b65 )
    ( on b693 b474 )
    ( on b673 b693 )
    ( on b141 b673 )
    ( on b220 b141 )
    ( on b66 b220 )
    ( on b423 b66 )
    ( on b211 b423 )
    ( on b397 b211 )
    ( on b164 b397 )
    ( clear b164 )
  )
  ( :goal
    ( and
      ( clear b456 )
    )
  )
)
