( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b679 - block
    b714 - block
    b808 - block
    b542 - block
    b76 - block
    b757 - block
    b330 - block
    b127 - block
    b912 - block
    b436 - block
    b15 - block
    b949 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b679 )
    ( on b714 b679 )
    ( on b808 b714 )
    ( on b542 b808 )
    ( on b76 b542 )
    ( on b757 b76 )
    ( on b330 b757 )
    ( on b127 b330 )
    ( on b912 b127 )
    ( on b436 b912 )
    ( on b15 b436 )
    ( on b949 b15 )
    ( clear b949 )
  )
  ( :goal
    ( and
      ( clear b679 )
    )
  )
)
