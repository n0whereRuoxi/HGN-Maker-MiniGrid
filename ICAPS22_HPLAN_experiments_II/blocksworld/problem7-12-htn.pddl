( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b442 - block
    b634 - block
    b311 - block
    b745 - block
    b238 - block
    b501 - block
    b843 - block
    b231 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b442 )
    ( on b634 b442 )
    ( on b311 b634 )
    ( on b745 b311 )
    ( on b238 b745 )
    ( on b501 b238 )
    ( on b843 b501 )
    ( on b231 b843 )
    ( clear b231 )
  )
  ( :tasks
    ( Make-7Pile b634 b311 b745 b238 b501 b843 b231 )
  )
)
