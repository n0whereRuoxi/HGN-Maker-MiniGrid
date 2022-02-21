( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b421 - block
    b601 - block
    b441 - block
    b653 - block
    b784 - block
    b594 - block
    b815 - block
    b256 - block
    b474 - block
    b697 - block
    b212 - block
    b941 - block
    b747 - block
    b170 - block
    b707 - block
    b358 - block
    b979 - block
    b100 - block
    b202 - block
    b947 - block
    b378 - block
    b373 - block
    b508 - block
    b189 - block
    b197 - block
    b605 - block
    b800 - block
    b678 - block
    b649 - block
    b283 - block
    b966 - block
    b823 - block
    b756 - block
    b704 - block
    b740 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b421 )
    ( on b601 b421 )
    ( on b441 b601 )
    ( on b653 b441 )
    ( on b784 b653 )
    ( on b594 b784 )
    ( on b815 b594 )
    ( on b256 b815 )
    ( on b474 b256 )
    ( on b697 b474 )
    ( on b212 b697 )
    ( on b941 b212 )
    ( on b747 b941 )
    ( on b170 b747 )
    ( on b707 b170 )
    ( on b358 b707 )
    ( on b979 b358 )
    ( on b100 b979 )
    ( on b202 b100 )
    ( on b947 b202 )
    ( on b378 b947 )
    ( on b373 b378 )
    ( on b508 b373 )
    ( on b189 b508 )
    ( on b197 b189 )
    ( on b605 b197 )
    ( on b800 b605 )
    ( on b678 b800 )
    ( on b649 b678 )
    ( on b283 b649 )
    ( on b966 b283 )
    ( on b823 b966 )
    ( on b756 b823 )
    ( on b704 b756 )
    ( on b740 b704 )
    ( clear b740 )
  )
  ( :goal
    ( and
      ( clear b421 )
    )
  )
)
