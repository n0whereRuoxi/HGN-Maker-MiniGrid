( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b856 - block
    b644 - block
    b51 - block
    b950 - block
    b586 - block
    b885 - block
    b741 - block
    b906 - block
    b274 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b856 )
    ( on b644 b856 )
    ( on b51 b644 )
    ( on b950 b51 )
    ( on b586 b950 )
    ( on b885 b586 )
    ( on b741 b885 )
    ( on b906 b741 )
    ( on b274 b906 )
    ( clear b274 )
  )
  ( :goal
    ( and
      ( clear b856 )
    )
  )
)
