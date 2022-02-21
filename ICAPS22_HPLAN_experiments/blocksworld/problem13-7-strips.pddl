( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b559 - block
    b219 - block
    b427 - block
    b931 - block
    b288 - block
    b119 - block
    b120 - block
    b555 - block
    b67 - block
    b62 - block
    b102 - block
    b25 - block
    b161 - block
    b21 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b559 )
    ( on b219 b559 )
    ( on b427 b219 )
    ( on b931 b427 )
    ( on b288 b931 )
    ( on b119 b288 )
    ( on b120 b119 )
    ( on b555 b120 )
    ( on b67 b555 )
    ( on b62 b67 )
    ( on b102 b62 )
    ( on b25 b102 )
    ( on b161 b25 )
    ( on b21 b161 )
    ( clear b21 )
  )
  ( :goal
    ( and
      ( clear b559 )
    )
  )
)
