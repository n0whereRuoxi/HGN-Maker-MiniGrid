( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b126 - block
    b662 - block
    b742 - block
    b497 - block
    b869 - block
    b921 - block
    b300 - block
    b279 - block
    b239 - block
    b267 - block
    b80 - block
    b881 - block
    b64 - block
    b878 - block
    b55 - block
    b226 - block
    b827 - block
    b539 - block
    b168 - block
    b147 - block
    b680 - block
    b830 - block
    b554 - block
    b353 - block
    b982 - block
    b57 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b126 )
    ( on b662 b126 )
    ( on b742 b662 )
    ( on b497 b742 )
    ( on b869 b497 )
    ( on b921 b869 )
    ( on b300 b921 )
    ( on b279 b300 )
    ( on b239 b279 )
    ( on b267 b239 )
    ( on b80 b267 )
    ( on b881 b80 )
    ( on b64 b881 )
    ( on b878 b64 )
    ( on b55 b878 )
    ( on b226 b55 )
    ( on b827 b226 )
    ( on b539 b827 )
    ( on b168 b539 )
    ( on b147 b168 )
    ( on b680 b147 )
    ( on b830 b680 )
    ( on b554 b830 )
    ( on b353 b554 )
    ( on b982 b353 )
    ( on b57 b982 )
    ( clear b57 )
  )
  ( :goal
    ( and
      ( clear b126 )
    )
  )
)
