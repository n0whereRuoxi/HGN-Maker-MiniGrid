( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b13 - block
    b912 - block
    b258 - block
    b524 - block
    b781 - block
    b283 - block
    b265 - block
    b69 - block
    b895 - block
    b866 - block
    b271 - block
    b318 - block
    b154 - block
    b926 - block
    b710 - block
    b441 - block
    b522 - block
    b568 - block
    b156 - block
    b107 - block
    b901 - block
    b872 - block
    b412 - block
    b257 - block
    b136 - block
    b214 - block
    b965 - block
    b125 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b13 )
    ( on b912 b13 )
    ( on b258 b912 )
    ( on b524 b258 )
    ( on b781 b524 )
    ( on b283 b781 )
    ( on b265 b283 )
    ( on b69 b265 )
    ( on b895 b69 )
    ( on b866 b895 )
    ( on b271 b866 )
    ( on b318 b271 )
    ( on b154 b318 )
    ( on b926 b154 )
    ( on b710 b926 )
    ( on b441 b710 )
    ( on b522 b441 )
    ( on b568 b522 )
    ( on b156 b568 )
    ( on b107 b156 )
    ( on b901 b107 )
    ( on b872 b901 )
    ( on b412 b872 )
    ( on b257 b412 )
    ( on b136 b257 )
    ( on b214 b136 )
    ( on b965 b214 )
    ( on b125 b965 )
    ( clear b125 )
  )
  ( :goal
    ( and
      ( clear b13 )
    )
  )
)
