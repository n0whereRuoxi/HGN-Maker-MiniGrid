( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b572 - block
    b709 - block
    b223 - block
    b87 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b572 )
    ( on b709 b572 )
    ( on b223 b709 )
    ( on b87 b223 )
    ( clear b87 )
  )
  ( :goal
    ( and
      ( clear b572 )
      ( clear b572 )
      ( clear b572 )
      ( clear b572 )
    )
  )
)
