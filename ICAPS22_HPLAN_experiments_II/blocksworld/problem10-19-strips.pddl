( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b840 - block
    b206 - block
    b363 - block
    b925 - block
    b580 - block
    b999 - block
    b680 - block
    b745 - block
    b161 - block
    b211 - block
    b82 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b840 )
    ( on b206 b840 )
    ( on b363 b206 )
    ( on b925 b363 )
    ( on b580 b925 )
    ( on b999 b580 )
    ( on b680 b999 )
    ( on b745 b680 )
    ( on b161 b745 )
    ( on b211 b161 )
    ( on b82 b211 )
    ( clear b82 )
  )
  ( :goal
    ( and
      ( clear b840 )
    )
  )
)
