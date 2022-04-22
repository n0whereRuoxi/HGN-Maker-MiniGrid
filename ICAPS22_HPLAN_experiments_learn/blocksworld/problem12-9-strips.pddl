( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b524 - block
    b911 - block
    b438 - block
    b553 - block
    b395 - block
    b164 - block
    b388 - block
    b190 - block
    b611 - block
    b444 - block
    b12 - block
    b732 - block
    b834 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b524 )
    ( on b911 b524 )
    ( on b438 b911 )
    ( on b553 b438 )
    ( on b395 b553 )
    ( on b164 b395 )
    ( on b388 b164 )
    ( on b190 b388 )
    ( on b611 b190 )
    ( on b444 b611 )
    ( on b12 b444 )
    ( on b732 b12 )
    ( on b834 b732 )
    ( clear b834 )
  )
  ( :goal
    ( and
      ( clear b524 )
    )
  )
)
