( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b772 - block
    b16 - block
    b230 - block
    b627 - block
    b444 - block
    b562 - block
    b949 - block
    b6 - block
    b389 - block
    b40 - block
    b688 - block
    b875 - block
    b588 - block
    b47 - block
    b791 - block
    b853 - block
    b250 - block
    b555 - block
    b340 - block
    b597 - block
    b315 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b772 )
    ( on b16 b772 )
    ( on b230 b16 )
    ( on b627 b230 )
    ( on b444 b627 )
    ( on b562 b444 )
    ( on b949 b562 )
    ( on b6 b949 )
    ( on b389 b6 )
    ( on b40 b389 )
    ( on b688 b40 )
    ( on b875 b688 )
    ( on b588 b875 )
    ( on b47 b588 )
    ( on b791 b47 )
    ( on b853 b791 )
    ( on b250 b853 )
    ( on b555 b250 )
    ( on b340 b555 )
    ( on b597 b340 )
    ( on b315 b597 )
    ( clear b315 )
  )
  ( :goal
    ( and
      ( clear b772 )
    )
  )
)
