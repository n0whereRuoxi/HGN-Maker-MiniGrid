( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b332 - block
    b875 - block
    b26 - block
    b68 - block
    b810 - block
    b419 - block
    b947 - block
    b998 - block
    b331 - block
    b544 - block
    b526 - block
    b740 - block
    b627 - block
    b398 - block
    b985 - block
    b147 - block
    b747 - block
    b402 - block
    b937 - block
    b694 - block
    b174 - block
    b290 - block
    b286 - block
    b708 - block
    b120 - block
    b438 - block
    b806 - block
    b215 - block
    b40 - block
    b599 - block
    b166 - block
    b415 - block
    b927 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b332 )
    ( on b875 b332 )
    ( on b26 b875 )
    ( on b68 b26 )
    ( on b810 b68 )
    ( on b419 b810 )
    ( on b947 b419 )
    ( on b998 b947 )
    ( on b331 b998 )
    ( on b544 b331 )
    ( on b526 b544 )
    ( on b740 b526 )
    ( on b627 b740 )
    ( on b398 b627 )
    ( on b985 b398 )
    ( on b147 b985 )
    ( on b747 b147 )
    ( on b402 b747 )
    ( on b937 b402 )
    ( on b694 b937 )
    ( on b174 b694 )
    ( on b290 b174 )
    ( on b286 b290 )
    ( on b708 b286 )
    ( on b120 b708 )
    ( on b438 b120 )
    ( on b806 b438 )
    ( on b215 b806 )
    ( on b40 b215 )
    ( on b599 b40 )
    ( on b166 b599 )
    ( on b415 b166 )
    ( on b927 b415 )
    ( clear b927 )
  )
  ( :goal
    ( and
      ( clear b332 )
    )
  )
)
