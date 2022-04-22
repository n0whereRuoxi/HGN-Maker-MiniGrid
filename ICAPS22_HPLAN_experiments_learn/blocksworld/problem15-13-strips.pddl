( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b582 - block
    b198 - block
    b575 - block
    b95 - block
    b182 - block
    b377 - block
    b954 - block
    b375 - block
    b866 - block
    b757 - block
    b979 - block
    b82 - block
    b865 - block
    b795 - block
    b945 - block
    b339 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b582 )
    ( on b198 b582 )
    ( on b575 b198 )
    ( on b95 b575 )
    ( on b182 b95 )
    ( on b377 b182 )
    ( on b954 b377 )
    ( on b375 b954 )
    ( on b866 b375 )
    ( on b757 b866 )
    ( on b979 b757 )
    ( on b82 b979 )
    ( on b865 b82 )
    ( on b795 b865 )
    ( on b945 b795 )
    ( on b339 b945 )
    ( clear b339 )
  )
  ( :goal
    ( and
      ( clear b582 )
    )
  )
)
