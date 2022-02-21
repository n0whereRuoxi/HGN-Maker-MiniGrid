( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b889 - block
    b606 - block
    b287 - block
    b213 - block
    b634 - block
    b658 - block
    b387 - block
    b866 - block
    b531 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b889 )
    ( on b606 b889 )
    ( on b287 b606 )
    ( on b213 b287 )
    ( on b634 b213 )
    ( on b658 b634 )
    ( on b387 b658 )
    ( on b866 b387 )
    ( on b531 b866 )
    ( clear b531 )
  )
  ( :goal
    ( and
      ( clear b889 )
    )
  )
)
