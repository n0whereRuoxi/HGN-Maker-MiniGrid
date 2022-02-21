( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b805 - block
    b169 - block
    b716 - block
    b269 - block
    b13 - block
    b435 - block
    b78 - block
    b644 - block
    b399 - block
    b877 - block
    b279 - block
    b783 - block
    b186 - block
    b639 - block
    b596 - block
    b510 - block
    b281 - block
    b756 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b805 )
    ( on b169 b805 )
    ( on b716 b169 )
    ( on b269 b716 )
    ( on b13 b269 )
    ( on b435 b13 )
    ( on b78 b435 )
    ( on b644 b78 )
    ( on b399 b644 )
    ( on b877 b399 )
    ( on b279 b877 )
    ( on b783 b279 )
    ( on b186 b783 )
    ( on b639 b186 )
    ( on b596 b639 )
    ( on b510 b596 )
    ( on b281 b510 )
    ( on b756 b281 )
    ( clear b756 )
  )
  ( :goal
    ( and
      ( clear b805 )
    )
  )
)
