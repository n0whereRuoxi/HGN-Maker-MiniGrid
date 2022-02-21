( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b777 - block
    b414 - block
    b361 - block
    b308 - block
    b38 - block
    b754 - block
    b731 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b777 )
    ( on b414 b777 )
    ( on b361 b414 )
    ( on b308 b361 )
    ( on b38 b308 )
    ( on b754 b38 )
    ( on b731 b754 )
    ( clear b731 )
  )
  ( :goal
    ( and
      ( clear b777 )
      ( clear b777 )
      ( clear b777 )
      ( clear b777 )
      ( clear b777 )
      ( clear b777 )
      ( clear b777 )
    )
  )
)
