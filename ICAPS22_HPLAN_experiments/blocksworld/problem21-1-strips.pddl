( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b538 - block
    b255 - block
    b87 - block
    b980 - block
    b465 - block
    b1 - block
    b643 - block
    b846 - block
    b342 - block
    b565 - block
    b138 - block
    b622 - block
    b302 - block
    b841 - block
    b86 - block
    b189 - block
    b553 - block
    b871 - block
    b856 - block
    b705 - block
    b94 - block
    b424 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b538 )
    ( on b255 b538 )
    ( on b87 b255 )
    ( on b980 b87 )
    ( on b465 b980 )
    ( on b1 b465 )
    ( on b643 b1 )
    ( on b846 b643 )
    ( on b342 b846 )
    ( on b565 b342 )
    ( on b138 b565 )
    ( on b622 b138 )
    ( on b302 b622 )
    ( on b841 b302 )
    ( on b86 b841 )
    ( on b189 b86 )
    ( on b553 b189 )
    ( on b871 b553 )
    ( on b856 b871 )
    ( on b705 b856 )
    ( on b94 b705 )
    ( on b424 b94 )
    ( clear b424 )
  )
  ( :goal
    ( and
      ( clear b538 )
    )
  )
)
