( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b544 - block
    b762 - block
    b126 - block
    b249 - block
    b825 - block
    b504 - block
    b148 - block
    b572 - block
    b289 - block
    b536 - block
    b666 - block
    b791 - block
    b250 - block
    b892 - block
    b798 - block
    b17 - block
    b246 - block
    b645 - block
    b701 - block
    b86 - block
    b26 - block
    b772 - block
    b498 - block
    b181 - block
    b108 - block
    b229 - block
    b422 - block
    b964 - block
    b497 - block
    b220 - block
    b599 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b544 )
    ( on b762 b544 )
    ( on b126 b762 )
    ( on b249 b126 )
    ( on b825 b249 )
    ( on b504 b825 )
    ( on b148 b504 )
    ( on b572 b148 )
    ( on b289 b572 )
    ( on b536 b289 )
    ( on b666 b536 )
    ( on b791 b666 )
    ( on b250 b791 )
    ( on b892 b250 )
    ( on b798 b892 )
    ( on b17 b798 )
    ( on b246 b17 )
    ( on b645 b246 )
    ( on b701 b645 )
    ( on b86 b701 )
    ( on b26 b86 )
    ( on b772 b26 )
    ( on b498 b772 )
    ( on b181 b498 )
    ( on b108 b181 )
    ( on b229 b108 )
    ( on b422 b229 )
    ( on b964 b422 )
    ( on b497 b964 )
    ( on b220 b497 )
    ( on b599 b220 )
    ( clear b599 )
  )
  ( :goal
    ( and
      ( clear b544 )
    )
  )
)
