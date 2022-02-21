( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b118 - block
    b635 - block
    b640 - block
    b700 - block
    b343 - block
    b360 - block
    b116 - block
    b143 - block
    b546 - block
    b723 - block
    b161 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b118 )
    ( on b635 b118 )
    ( on b640 b635 )
    ( on b700 b640 )
    ( on b343 b700 )
    ( on b360 b343 )
    ( on b116 b360 )
    ( on b143 b116 )
    ( on b546 b143 )
    ( on b723 b546 )
    ( on b161 b723 )
    ( clear b161 )
  )
  ( :goal
    ( and
      ( clear b118 )
    )
  )
)
