( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b793 - block
    b66 - block
    b909 - block
    b167 - block
    b397 - block
    b169 - block
    b735 - block
    b200 - block
    b452 - block
    b775 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b793 )
    ( on b66 b793 )
    ( on b909 b66 )
    ( on b167 b909 )
    ( on b397 b167 )
    ( on b169 b397 )
    ( on b735 b169 )
    ( on b200 b735 )
    ( on b452 b200 )
    ( on b775 b452 )
    ( clear b775 )
  )
  ( :goal
    ( and
      ( clear b793 )
    )
  )
)
