( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b488 - block
    b1 - block
    b162 - block
    b782 - block
    b399 - block
    b651 - block
    b22 - block
    b444 - block
    b696 - block
    b325 - block
    b292 - block
    b532 - block
    b639 - block
    b302 - block
    b407 - block
    b13 - block
    b109 - block
    b528 - block
    b321 - block
    b134 - block
    b382 - block
    b282 - block
    b68 - block
    b544 - block
    b859 - block
    b529 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b488 )
    ( on b1 b488 )
    ( on b162 b1 )
    ( on b782 b162 )
    ( on b399 b782 )
    ( on b651 b399 )
    ( on b22 b651 )
    ( on b444 b22 )
    ( on b696 b444 )
    ( on b325 b696 )
    ( on b292 b325 )
    ( on b532 b292 )
    ( on b639 b532 )
    ( on b302 b639 )
    ( on b407 b302 )
    ( on b13 b407 )
    ( on b109 b13 )
    ( on b528 b109 )
    ( on b321 b528 )
    ( on b134 b321 )
    ( on b382 b134 )
    ( on b282 b382 )
    ( on b68 b282 )
    ( on b544 b68 )
    ( on b859 b544 )
    ( on b529 b859 )
    ( clear b529 )
  )
  ( :goal
    ( and
      ( clear b488 )
    )
  )
)
