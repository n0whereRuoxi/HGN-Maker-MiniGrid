( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b713 - block
    b838 - block
    b357 - block
    b138 - block
    b80 - block
    b131 - block
    b588 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b713 )
    ( on b838 b713 )
    ( on b357 b838 )
    ( on b138 b357 )
    ( on b80 b138 )
    ( on b131 b80 )
    ( on b588 b131 )
    ( clear b588 )
  )
  ( :goal
    ( and
      ( clear b713 )
    )
  )
)
