( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b382 - block
    b175 - block
    b808 - block
    b857 - block
    b751 - block
    b484 - block
    b441 - block
    b190 - block
    b841 - block
    b885 - block
    b243 - block
    b868 - block
    b733 - block
    b975 - block
    b643 - block
    b85 - block
    b244 - block
    b8 - block
    b980 - block
    b275 - block
    b170 - block
    b420 - block
    b992 - block
    b202 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b382 )
    ( on b175 b382 )
    ( on b808 b175 )
    ( on b857 b808 )
    ( on b751 b857 )
    ( on b484 b751 )
    ( on b441 b484 )
    ( on b190 b441 )
    ( on b841 b190 )
    ( on b885 b841 )
    ( on b243 b885 )
    ( on b868 b243 )
    ( on b733 b868 )
    ( on b975 b733 )
    ( on b643 b975 )
    ( on b85 b643 )
    ( on b244 b85 )
    ( on b8 b244 )
    ( on b980 b8 )
    ( on b275 b980 )
    ( on b170 b275 )
    ( on b420 b170 )
    ( on b992 b420 )
    ( on b202 b992 )
    ( clear b202 )
  )
  ( :goal
    ( and
      ( clear b382 )
    )
  )
)
