( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b62 - block
    b884 - block
    b268 - block
    b710 - block
    b434 - block
    b477 - block
    b532 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b62 )
    ( on b884 b62 )
    ( on b268 b884 )
    ( on b710 b268 )
    ( on b434 b710 )
    ( on b477 b434 )
    ( on b532 b477 )
    ( clear b532 )
  )
  ( :goal
    ( and
      ( clear b62 )
    )
  )
)
