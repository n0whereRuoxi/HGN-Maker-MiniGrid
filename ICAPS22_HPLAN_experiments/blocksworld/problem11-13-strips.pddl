( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b942 - block
    b823 - block
    b104 - block
    b773 - block
    b882 - block
    b788 - block
    b113 - block
    b734 - block
    b359 - block
    b792 - block
    b233 - block
    b945 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b942 )
    ( on b823 b942 )
    ( on b104 b823 )
    ( on b773 b104 )
    ( on b882 b773 )
    ( on b788 b882 )
    ( on b113 b788 )
    ( on b734 b113 )
    ( on b359 b734 )
    ( on b792 b359 )
    ( on b233 b792 )
    ( on b945 b233 )
    ( clear b945 )
  )
  ( :goal
    ( and
      ( clear b942 )
    )
  )
)
