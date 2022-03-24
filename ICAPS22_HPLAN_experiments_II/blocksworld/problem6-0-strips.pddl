( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b461 - block
    b169 - block
    b829 - block
    b199 - block
    b502 - block
    b923 - block
    b457 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b461 )
    ( on b169 b461 )
    ( on b829 b169 )
    ( on b199 b829 )
    ( on b502 b199 )
    ( on b923 b502 )
    ( on b457 b923 )
    ( clear b457 )
  )
  ( :goal
    ( and
      ( clear b461 )
    )
  )
)
