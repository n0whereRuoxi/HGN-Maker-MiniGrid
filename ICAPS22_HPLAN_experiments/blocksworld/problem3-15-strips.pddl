( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b51 - block
    b382 - block
    b392 - block
    b991 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b51 )
    ( on b382 b51 )
    ( on b392 b382 )
    ( on b991 b392 )
    ( clear b991 )
  )
  ( :goal
    ( and
      ( clear b51 )
      ( clear b51 )
      ( clear b51 )
      ( clear b51 )
    )
  )
)
