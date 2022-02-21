( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b770 - block
    b374 - block
    b820 - block
    b568 - block
    b667 - block
    b716 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b770 )
    ( on b374 b770 )
    ( on b820 b374 )
    ( on b568 b820 )
    ( on b667 b568 )
    ( on b716 b667 )
    ( clear b716 )
  )
  ( :goal
    ( and
      ( clear b770 )
      ( clear b770 )
      ( clear b770 )
      ( clear b770 )
      ( clear b770 )
      ( clear b770 )
    )
  )
)
