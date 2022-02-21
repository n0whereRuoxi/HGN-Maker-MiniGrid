( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b30 - block
    b167 - block
    b738 - block
    b710 - block
    b573 - block
    b804 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b30 )
    ( on b167 b30 )
    ( on b738 b167 )
    ( on b710 b738 )
    ( on b573 b710 )
    ( on b804 b573 )
    ( clear b804 )
  )
  ( :goal
    ( and
      ( clear b30 )
      ( clear b30 )
      ( clear b30 )
      ( clear b30 )
      ( clear b30 )
      ( clear b30 )
    )
  )
)
