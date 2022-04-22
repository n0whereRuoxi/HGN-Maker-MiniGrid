( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b164 - block
    b547 - block
    b315 - block
    b651 - block
    b490 - block
    b557 - block
    b793 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b164 )
    ( on b547 b164 )
    ( on b315 b547 )
    ( on b651 b315 )
    ( on b490 b651 )
    ( on b557 b490 )
    ( on b793 b557 )
    ( clear b793 )
  )
  ( :goal
    ( and
      ( clear b164 )
    )
  )
)
