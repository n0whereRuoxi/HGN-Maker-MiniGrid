( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b727 - block
    b709 - block
    b493 - block
    b657 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b727 )
    ( on b709 b727 )
    ( on b493 b709 )
    ( on b657 b493 )
    ( clear b657 )
  )
  ( :goal
    ( and
      ( clear b727 )
      ( clear b727 )
      ( clear b727 )
      ( clear b727 )
    )
  )
)
