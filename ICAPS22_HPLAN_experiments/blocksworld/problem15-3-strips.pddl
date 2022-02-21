( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b496 - block
    b595 - block
    b16 - block
    b473 - block
    b181 - block
    b962 - block
    b307 - block
    b943 - block
    b808 - block
    b7 - block
    b724 - block
    b853 - block
    b50 - block
    b302 - block
    b838 - block
    b353 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b496 )
    ( on b595 b496 )
    ( on b16 b595 )
    ( on b473 b16 )
    ( on b181 b473 )
    ( on b962 b181 )
    ( on b307 b962 )
    ( on b943 b307 )
    ( on b808 b943 )
    ( on b7 b808 )
    ( on b724 b7 )
    ( on b853 b724 )
    ( on b50 b853 )
    ( on b302 b50 )
    ( on b838 b302 )
    ( on b353 b838 )
    ( clear b353 )
  )
  ( :goal
    ( and
      ( clear b496 )
    )
  )
)
