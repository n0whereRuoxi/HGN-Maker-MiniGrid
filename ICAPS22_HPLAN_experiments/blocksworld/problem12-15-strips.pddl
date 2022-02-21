( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b901 - block
    b879 - block
    b919 - block
    b866 - block
    b663 - block
    b217 - block
    b83 - block
    b457 - block
    b212 - block
    b302 - block
    b657 - block
    b323 - block
    b249 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b901 )
    ( on b879 b901 )
    ( on b919 b879 )
    ( on b866 b919 )
    ( on b663 b866 )
    ( on b217 b663 )
    ( on b83 b217 )
    ( on b457 b83 )
    ( on b212 b457 )
    ( on b302 b212 )
    ( on b657 b302 )
    ( on b323 b657 )
    ( on b249 b323 )
    ( clear b249 )
  )
  ( :goal
    ( and
      ( clear b901 )
    )
  )
)
