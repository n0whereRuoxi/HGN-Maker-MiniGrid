( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b878 - block
    b730 - block
    b382 - block
    b535 - block
    b227 - block
    b135 - block
    b971 - block
    b111 - block
    b709 - block
    b233 - block
    b593 - block
    b77 - block
    b793 - block
    b931 - block
    b772 - block
    b805 - block
    b869 - block
    b589 - block
    b140 - block
    b89 - block
    b930 - block
    b354 - block
    b50 - block
    b737 - block
    b388 - block
    b170 - block
    b482 - block
    b123 - block
    b845 - block
    b974 - block
    b645 - block
    b516 - block
    b74 - block
    b514 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b878 )
    ( on b730 b878 )
    ( on b382 b730 )
    ( on b535 b382 )
    ( on b227 b535 )
    ( on b135 b227 )
    ( on b971 b135 )
    ( on b111 b971 )
    ( on b709 b111 )
    ( on b233 b709 )
    ( on b593 b233 )
    ( on b77 b593 )
    ( on b793 b77 )
    ( on b931 b793 )
    ( on b772 b931 )
    ( on b805 b772 )
    ( on b869 b805 )
    ( on b589 b869 )
    ( on b140 b589 )
    ( on b89 b140 )
    ( on b930 b89 )
    ( on b354 b930 )
    ( on b50 b354 )
    ( on b737 b50 )
    ( on b388 b737 )
    ( on b170 b388 )
    ( on b482 b170 )
    ( on b123 b482 )
    ( on b845 b123 )
    ( on b974 b845 )
    ( on b645 b974 )
    ( on b516 b645 )
    ( on b74 b516 )
    ( on b514 b74 )
    ( clear b514 )
  )
  ( :goal
    ( and
      ( clear b878 )
    )
  )
)
