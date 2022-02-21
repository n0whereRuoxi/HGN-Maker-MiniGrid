( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b360 - block
    b677 - block
    b131 - block
    b365 - block
    b315 - block
    b209 - block
    b725 - block
    b851 - block
    b199 - block
    b34 - block
    b497 - block
    b75 - block
    b766 - block
    b993 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b360 )
    ( on b677 b360 )
    ( on b131 b677 )
    ( on b365 b131 )
    ( on b315 b365 )
    ( on b209 b315 )
    ( on b725 b209 )
    ( on b851 b725 )
    ( on b199 b851 )
    ( on b34 b199 )
    ( on b497 b34 )
    ( on b75 b497 )
    ( on b766 b75 )
    ( on b993 b766 )
    ( clear b993 )
  )
  ( :goal
    ( and
      ( clear b360 )
    )
  )
)
