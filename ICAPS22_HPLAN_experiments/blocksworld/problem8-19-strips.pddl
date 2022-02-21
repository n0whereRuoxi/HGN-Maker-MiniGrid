( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b587 - block
    b220 - block
    b63 - block
    b570 - block
    b149 - block
    b804 - block
    b855 - block
    b491 - block
    b155 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b587 )
    ( on b220 b587 )
    ( on b63 b220 )
    ( on b570 b63 )
    ( on b149 b570 )
    ( on b804 b149 )
    ( on b855 b804 )
    ( on b491 b855 )
    ( on b155 b491 )
    ( clear b155 )
  )
  ( :goal
    ( and
      ( clear b587 )
    )
  )
)
