( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b141 - block
    b929 - block
    b910 - block
    b189 - block
    b730 - block
    b381 - block
    b239 - block
    b747 - block
    b859 - block
    b337 - block
    b309 - block
    b638 - block
    b863 - block
    b179 - block
    b669 - block
    b261 - block
    b273 - block
    b751 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b141 )
    ( on b929 b141 )
    ( on b910 b929 )
    ( on b189 b910 )
    ( on b730 b189 )
    ( on b381 b730 )
    ( on b239 b381 )
    ( on b747 b239 )
    ( on b859 b747 )
    ( on b337 b859 )
    ( on b309 b337 )
    ( on b638 b309 )
    ( on b863 b638 )
    ( on b179 b863 )
    ( on b669 b179 )
    ( on b261 b669 )
    ( on b273 b261 )
    ( on b751 b273 )
    ( clear b751 )
  )
  ( :goal
    ( and
      ( clear b141 )
    )
  )
)
