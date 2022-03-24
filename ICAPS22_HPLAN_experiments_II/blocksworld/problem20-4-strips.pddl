( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b143 - block
    b699 - block
    b190 - block
    b627 - block
    b870 - block
    b964 - block
    b923 - block
    b550 - block
    b491 - block
    b555 - block
    b836 - block
    b740 - block
    b454 - block
    b305 - block
    b232 - block
    b930 - block
    b501 - block
    b395 - block
    b885 - block
    b298 - block
    b841 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b143 )
    ( on b699 b143 )
    ( on b190 b699 )
    ( on b627 b190 )
    ( on b870 b627 )
    ( on b964 b870 )
    ( on b923 b964 )
    ( on b550 b923 )
    ( on b491 b550 )
    ( on b555 b491 )
    ( on b836 b555 )
    ( on b740 b836 )
    ( on b454 b740 )
    ( on b305 b454 )
    ( on b232 b305 )
    ( on b930 b232 )
    ( on b501 b930 )
    ( on b395 b501 )
    ( on b885 b395 )
    ( on b298 b885 )
    ( on b841 b298 )
    ( clear b841 )
  )
  ( :goal
    ( and
      ( clear b143 )
    )
  )
)
