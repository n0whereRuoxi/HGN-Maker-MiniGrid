( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b83 - block
    b748 - block
    b540 - block
    b649 - block
    b792 - block
    b570 - block
    b376 - block
    b802 - block
    b185 - block
    b528 - block
    b167 - block
    b634 - block
    b801 - block
    b571 - block
    b7 - block
    b726 - block
    b871 - block
    b332 - block
    b145 - block
    b641 - block
    b73 - block
    b413 - block
    b255 - block
    b358 - block
    b28 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b83 )
    ( on b748 b83 )
    ( on b540 b748 )
    ( on b649 b540 )
    ( on b792 b649 )
    ( on b570 b792 )
    ( on b376 b570 )
    ( on b802 b376 )
    ( on b185 b802 )
    ( on b528 b185 )
    ( on b167 b528 )
    ( on b634 b167 )
    ( on b801 b634 )
    ( on b571 b801 )
    ( on b7 b571 )
    ( on b726 b7 )
    ( on b871 b726 )
    ( on b332 b871 )
    ( on b145 b332 )
    ( on b641 b145 )
    ( on b73 b641 )
    ( on b413 b73 )
    ( on b255 b413 )
    ( on b358 b255 )
    ( on b28 b358 )
    ( clear b28 )
  )
  ( :goal
    ( and
      ( clear b83 )
    )
  )
)
