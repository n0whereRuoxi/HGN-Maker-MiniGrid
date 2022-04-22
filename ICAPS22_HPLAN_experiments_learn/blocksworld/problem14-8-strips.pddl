( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b105 - block
    b588 - block
    b277 - block
    b233 - block
    b885 - block
    b349 - block
    b130 - block
    b46 - block
    b303 - block
    b971 - block
    b140 - block
    b957 - block
    b780 - block
    b664 - block
    b367 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b105 )
    ( on b588 b105 )
    ( on b277 b588 )
    ( on b233 b277 )
    ( on b885 b233 )
    ( on b349 b885 )
    ( on b130 b349 )
    ( on b46 b130 )
    ( on b303 b46 )
    ( on b971 b303 )
    ( on b140 b971 )
    ( on b957 b140 )
    ( on b780 b957 )
    ( on b664 b780 )
    ( on b367 b664 )
    ( clear b367 )
  )
  ( :goal
    ( and
      ( clear b105 )
    )
  )
)
