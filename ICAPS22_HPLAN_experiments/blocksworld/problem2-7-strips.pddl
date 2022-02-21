( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b143 - block
    b918 - block
    b424 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b143 )
    ( on b918 b143 )
    ( on b424 b918 )
    ( clear b424 )
  )
  ( :goal
    ( and
      ( clear b143 )
      ( clear b143 )
      ( clear b143 )
    )
  )
)
