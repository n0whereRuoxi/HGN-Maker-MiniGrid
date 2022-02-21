( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b333 - block
    b919 - block
    b960 - block
    b666 - block
    b107 - block
    b620 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b333 )
    ( on b919 b333 )
    ( on b960 b919 )
    ( on b666 b960 )
    ( on b107 b666 )
    ( on b620 b107 )
    ( clear b620 )
  )
  ( :goal
    ( and
      ( clear b333 )
      ( clear b333 )
      ( clear b333 )
      ( clear b333 )
      ( clear b333 )
      ( clear b333 )
    )
  )
)
