( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b789 - block
    b94 - block
    b662 - block
    b514 - block
    b280 - block
    b83 - block
    b457 - block
    b814 - block
    b327 - block
    b107 - block
    b936 - block
    b109 - block
    b313 - block
    b847 - block
    b142 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b789 )
    ( on b94 b789 )
    ( on b662 b94 )
    ( on b514 b662 )
    ( on b280 b514 )
    ( on b83 b280 )
    ( on b457 b83 )
    ( on b814 b457 )
    ( on b327 b814 )
    ( on b107 b327 )
    ( on b936 b107 )
    ( on b109 b936 )
    ( on b313 b109 )
    ( on b847 b313 )
    ( on b142 b847 )
    ( clear b142 )
  )
  ( :goal
    ( and
      ( clear b789 )
    )
  )
)
