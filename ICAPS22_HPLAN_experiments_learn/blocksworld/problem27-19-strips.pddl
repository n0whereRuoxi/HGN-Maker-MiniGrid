( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b390 - block
    b608 - block
    b671 - block
    b590 - block
    b152 - block
    b490 - block
    b478 - block
    b830 - block
    b71 - block
    b675 - block
    b758 - block
    b435 - block
    b315 - block
    b330 - block
    b391 - block
    b517 - block
    b745 - block
    b139 - block
    b401 - block
    b837 - block
    b345 - block
    b260 - block
    b975 - block
    b805 - block
    b865 - block
    b851 - block
    b626 - block
    b488 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b390 )
    ( on b608 b390 )
    ( on b671 b608 )
    ( on b590 b671 )
    ( on b152 b590 )
    ( on b490 b152 )
    ( on b478 b490 )
    ( on b830 b478 )
    ( on b71 b830 )
    ( on b675 b71 )
    ( on b758 b675 )
    ( on b435 b758 )
    ( on b315 b435 )
    ( on b330 b315 )
    ( on b391 b330 )
    ( on b517 b391 )
    ( on b745 b517 )
    ( on b139 b745 )
    ( on b401 b139 )
    ( on b837 b401 )
    ( on b345 b837 )
    ( on b260 b345 )
    ( on b975 b260 )
    ( on b805 b975 )
    ( on b865 b805 )
    ( on b851 b865 )
    ( on b626 b851 )
    ( on b488 b626 )
    ( clear b488 )
  )
  ( :goal
    ( and
      ( clear b390 )
    )
  )
)
