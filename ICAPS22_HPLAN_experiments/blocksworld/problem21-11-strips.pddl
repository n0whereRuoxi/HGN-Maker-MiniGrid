( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b842 - block
    b82 - block
    b48 - block
    b603 - block
    b819 - block
    b786 - block
    b880 - block
    b494 - block
    b650 - block
    b458 - block
    b195 - block
    b609 - block
    b382 - block
    b35 - block
    b277 - block
    b237 - block
    b390 - block
    b285 - block
    b310 - block
    b443 - block
    b515 - block
    b957 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b842 )
    ( on b82 b842 )
    ( on b48 b82 )
    ( on b603 b48 )
    ( on b819 b603 )
    ( on b786 b819 )
    ( on b880 b786 )
    ( on b494 b880 )
    ( on b650 b494 )
    ( on b458 b650 )
    ( on b195 b458 )
    ( on b609 b195 )
    ( on b382 b609 )
    ( on b35 b382 )
    ( on b277 b35 )
    ( on b237 b277 )
    ( on b390 b237 )
    ( on b285 b390 )
    ( on b310 b285 )
    ( on b443 b310 )
    ( on b515 b443 )
    ( on b957 b515 )
    ( clear b957 )
  )
  ( :goal
    ( and
      ( clear b842 )
    )
  )
)
