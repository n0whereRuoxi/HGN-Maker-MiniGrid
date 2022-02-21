( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b808 - block
    b551 - block
    b225 - block
    b288 - block
    b588 - block
    b988 - block
    b427 - block
    b11 - block
    b332 - block
    b631 - block
    b25 - block
    b880 - block
    b64 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b808 )
    ( on b551 b808 )
    ( on b225 b551 )
    ( on b288 b225 )
    ( on b588 b288 )
    ( on b988 b588 )
    ( on b427 b988 )
    ( on b11 b427 )
    ( on b332 b11 )
    ( on b631 b332 )
    ( on b25 b631 )
    ( on b880 b25 )
    ( on b64 b880 )
    ( clear b64 )
  )
  ( :goal
    ( and
      ( clear b808 )
    )
  )
)
