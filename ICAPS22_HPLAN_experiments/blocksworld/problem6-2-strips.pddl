( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b576 - block
    b347 - block
    b248 - block
    b3 - block
    b11 - block
    b500 - block
    b175 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b576 )
    ( on b347 b576 )
    ( on b248 b347 )
    ( on b3 b248 )
    ( on b11 b3 )
    ( on b500 b11 )
    ( on b175 b500 )
    ( clear b175 )
  )
  ( :goal
    ( and
      ( clear b576 )
      ( clear b576 )
      ( clear b576 )
      ( clear b576 )
      ( clear b576 )
      ( clear b576 )
      ( clear b576 )
    )
  )
)
