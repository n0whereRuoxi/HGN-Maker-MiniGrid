( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b86 - block
    b797 - block
    b332 - block
    b100 - block
    b546 - block
    b495 - block
    b649 - block
    b334 - block
    b360 - block
    b912 - block
    b788 - block
    b490 - block
    b949 - block
    b81 - block
    b169 - block
    b597 - block
    b395 - block
    b347 - block
    b602 - block
    b470 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b86 )
    ( on b797 b86 )
    ( on b332 b797 )
    ( on b100 b332 )
    ( on b546 b100 )
    ( on b495 b546 )
    ( on b649 b495 )
    ( on b334 b649 )
    ( on b360 b334 )
    ( on b912 b360 )
    ( on b788 b912 )
    ( on b490 b788 )
    ( on b949 b490 )
    ( on b81 b949 )
    ( on b169 b81 )
    ( on b597 b169 )
    ( on b395 b597 )
    ( on b347 b395 )
    ( on b602 b347 )
    ( on b470 b602 )
    ( clear b470 )
  )
  ( :tasks
    ( Make-19Pile b797 b332 b100 b546 b495 b649 b334 b360 b912 b788 b490 b949 b81 b169 b597 b395 b347 b602 b470 )
  )
)
