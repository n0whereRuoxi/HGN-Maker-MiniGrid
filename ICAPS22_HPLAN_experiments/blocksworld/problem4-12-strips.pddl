( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b502 - block
    b940 - block
    b704 - block
    b745 - block
    b979 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b502 )
    ( on b940 b502 )
    ( on b704 b940 )
    ( on b745 b704 )
    ( on b979 b745 )
    ( clear b979 )
  )
  ( :goal
    ( and
      ( clear b502 )
      ( clear b502 )
      ( clear b502 )
      ( clear b502 )
      ( clear b502 )
    )
  )
)
