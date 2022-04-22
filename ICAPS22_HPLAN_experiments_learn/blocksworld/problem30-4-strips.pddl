( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b672 - block
    b656 - block
    b267 - block
    b89 - block
    b769 - block
    b439 - block
    b514 - block
    b877 - block
    b697 - block
    b738 - block
    b210 - block
    b429 - block
    b948 - block
    b640 - block
    b246 - block
    b3 - block
    b812 - block
    b582 - block
    b744 - block
    b895 - block
    b523 - block
    b878 - block
    b144 - block
    b272 - block
    b105 - block
    b308 - block
    b282 - block
    b69 - block
    b659 - block
    b680 - block
    b191 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b672 )
    ( on b656 b672 )
    ( on b267 b656 )
    ( on b89 b267 )
    ( on b769 b89 )
    ( on b439 b769 )
    ( on b514 b439 )
    ( on b877 b514 )
    ( on b697 b877 )
    ( on b738 b697 )
    ( on b210 b738 )
    ( on b429 b210 )
    ( on b948 b429 )
    ( on b640 b948 )
    ( on b246 b640 )
    ( on b3 b246 )
    ( on b812 b3 )
    ( on b582 b812 )
    ( on b744 b582 )
    ( on b895 b744 )
    ( on b523 b895 )
    ( on b878 b523 )
    ( on b144 b878 )
    ( on b272 b144 )
    ( on b105 b272 )
    ( on b308 b105 )
    ( on b282 b308 )
    ( on b69 b282 )
    ( on b659 b69 )
    ( on b680 b659 )
    ( on b191 b680 )
    ( clear b191 )
  )
  ( :goal
    ( and
      ( clear b672 )
    )
  )
)
