( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b288 - block
    b988 - block
    b130 - block
    b572 - block
    b885 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b288 )
    ( on b988 b288 )
    ( on b130 b988 )
    ( on b572 b130 )
    ( on b885 b572 )
    ( clear b885 )
  )
  ( :goal
    ( and
      ( clear b288 )
    )
  )
)
