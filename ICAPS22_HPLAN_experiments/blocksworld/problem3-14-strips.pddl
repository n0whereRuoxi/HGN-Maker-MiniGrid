( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b373 - block
    b569 - block
    b789 - block
    b709 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b373 )
    ( on b569 b373 )
    ( on b789 b569 )
    ( on b709 b789 )
    ( clear b709 )
  )
  ( :goal
    ( and
      ( clear b373 )
      ( clear b373 )
      ( clear b373 )
      ( clear b373 )
    )
  )
)
