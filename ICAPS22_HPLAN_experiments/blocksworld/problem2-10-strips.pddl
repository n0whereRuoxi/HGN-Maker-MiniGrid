( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b561 - block
    b915 - block
    b904 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b561 )
    ( on b915 b561 )
    ( on b904 b915 )
    ( clear b904 )
  )
  ( :goal
    ( and
      ( clear b561 )
      ( clear b561 )
      ( clear b561 )
    )
  )
)
