( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b712 - block
    b150 - block
    b463 - block
    b577 - block
    b77 - block
    b672 - block
    b745 - block
    b320 - block
    b358 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b712 )
    ( on b150 b712 )
    ( on b463 b150 )
    ( on b577 b463 )
    ( on b77 b577 )
    ( on b672 b77 )
    ( on b745 b672 )
    ( on b320 b745 )
    ( on b358 b320 )
    ( clear b358 )
  )
  ( :goal
    ( and
      ( clear b712 )
    )
  )
)
