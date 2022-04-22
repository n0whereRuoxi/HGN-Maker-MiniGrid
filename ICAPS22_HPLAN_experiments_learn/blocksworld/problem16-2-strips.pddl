( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b646 - block
    b357 - block
    b219 - block
    b414 - block
    b421 - block
    b404 - block
    b229 - block
    b40 - block
    b571 - block
    b246 - block
    b719 - block
    b392 - block
    b803 - block
    b561 - block
    b373 - block
    b449 - block
    b185 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b646 )
    ( on b357 b646 )
    ( on b219 b357 )
    ( on b414 b219 )
    ( on b421 b414 )
    ( on b404 b421 )
    ( on b229 b404 )
    ( on b40 b229 )
    ( on b571 b40 )
    ( on b246 b571 )
    ( on b719 b246 )
    ( on b392 b719 )
    ( on b803 b392 )
    ( on b561 b803 )
    ( on b373 b561 )
    ( on b449 b373 )
    ( on b185 b449 )
    ( clear b185 )
  )
  ( :goal
    ( and
      ( clear b646 )
    )
  )
)
