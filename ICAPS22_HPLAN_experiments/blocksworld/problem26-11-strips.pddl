( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b530 - block
    b910 - block
    b194 - block
    b584 - block
    b541 - block
    b219 - block
    b86 - block
    b233 - block
    b453 - block
    b809 - block
    b2 - block
    b947 - block
    b929 - block
    b534 - block
    b937 - block
    b468 - block
    b170 - block
    b812 - block
    b239 - block
    b767 - block
    b124 - block
    b80 - block
    b822 - block
    b213 - block
    b844 - block
    b247 - block
    b157 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b530 )
    ( on b910 b530 )
    ( on b194 b910 )
    ( on b584 b194 )
    ( on b541 b584 )
    ( on b219 b541 )
    ( on b86 b219 )
    ( on b233 b86 )
    ( on b453 b233 )
    ( on b809 b453 )
    ( on b2 b809 )
    ( on b947 b2 )
    ( on b929 b947 )
    ( on b534 b929 )
    ( on b937 b534 )
    ( on b468 b937 )
    ( on b170 b468 )
    ( on b812 b170 )
    ( on b239 b812 )
    ( on b767 b239 )
    ( on b124 b767 )
    ( on b80 b124 )
    ( on b822 b80 )
    ( on b213 b822 )
    ( on b844 b213 )
    ( on b247 b844 )
    ( on b157 b247 )
    ( clear b157 )
  )
  ( :goal
    ( and
      ( clear b530 )
    )
  )
)
