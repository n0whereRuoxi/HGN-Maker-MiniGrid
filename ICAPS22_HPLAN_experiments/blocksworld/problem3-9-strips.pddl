( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b718 - block
    b250 - block
    b653 - block
    b328 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b718 )
    ( on b250 b718 )
    ( on b653 b250 )
    ( on b328 b653 )
    ( clear b328 )
  )
  ( :goal
    ( and
      ( clear b718 )
      ( clear b718 )
      ( clear b718 )
      ( clear b718 )
    )
  )
)
