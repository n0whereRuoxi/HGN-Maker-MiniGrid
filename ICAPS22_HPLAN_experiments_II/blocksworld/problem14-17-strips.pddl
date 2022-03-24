( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b449 - block
    b331 - block
    b295 - block
    b169 - block
    b271 - block
    b889 - block
    b786 - block
    b513 - block
    b240 - block
    b509 - block
    b359 - block
    b910 - block
    b305 - block
    b746 - block
    b693 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b449 )
    ( on b331 b449 )
    ( on b295 b331 )
    ( on b169 b295 )
    ( on b271 b169 )
    ( on b889 b271 )
    ( on b786 b889 )
    ( on b513 b786 )
    ( on b240 b513 )
    ( on b509 b240 )
    ( on b359 b509 )
    ( on b910 b359 )
    ( on b305 b910 )
    ( on b746 b305 )
    ( on b693 b746 )
    ( clear b693 )
  )
  ( :goal
    ( and
      ( clear b449 )
    )
  )
)
