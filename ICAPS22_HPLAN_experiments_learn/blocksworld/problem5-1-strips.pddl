( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b866 - block
    b745 - block
    b445 - block
    b109 - block
    b468 - block
    b10 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b866 )
    ( on b745 b866 )
    ( on b445 b745 )
    ( on b109 b445 )
    ( on b468 b109 )
    ( on b10 b468 )
    ( clear b10 )
  )
  ( :goal
    ( and
      ( clear b866 )
    )
  )
)
