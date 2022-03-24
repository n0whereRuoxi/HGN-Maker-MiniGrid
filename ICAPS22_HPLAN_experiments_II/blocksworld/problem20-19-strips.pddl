( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b205 - block
    b422 - block
    b552 - block
    b995 - block
    b225 - block
    b819 - block
    b61 - block
    b981 - block
    b762 - block
    b341 - block
    b209 - block
    b269 - block
    b352 - block
    b72 - block
    b588 - block
    b416 - block
    b139 - block
    b232 - block
    b998 - block
    b562 - block
    b86 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b205 )
    ( on b422 b205 )
    ( on b552 b422 )
    ( on b995 b552 )
    ( on b225 b995 )
    ( on b819 b225 )
    ( on b61 b819 )
    ( on b981 b61 )
    ( on b762 b981 )
    ( on b341 b762 )
    ( on b209 b341 )
    ( on b269 b209 )
    ( on b352 b269 )
    ( on b72 b352 )
    ( on b588 b72 )
    ( on b416 b588 )
    ( on b139 b416 )
    ( on b232 b139 )
    ( on b998 b232 )
    ( on b562 b998 )
    ( on b86 b562 )
    ( clear b86 )
  )
  ( :goal
    ( and
      ( clear b205 )
    )
  )
)
