( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b431 - block
    b180 - block
    b728 - block
    b909 - block
    b972 - block
    b104 - block
    b356 - block
    b863 - block
    b892 - block
    b214 - block
    b371 - block
    b584 - block
    b630 - block
    b406 - block
    b681 - block
    b12 - block
    b487 - block
    b501 - block
    b977 - block
    b845 - block
    b847 - block
    b365 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b431 )
    ( on b180 b431 )
    ( on b728 b180 )
    ( on b909 b728 )
    ( on b972 b909 )
    ( on b104 b972 )
    ( on b356 b104 )
    ( on b863 b356 )
    ( on b892 b863 )
    ( on b214 b892 )
    ( on b371 b214 )
    ( on b584 b371 )
    ( on b630 b584 )
    ( on b406 b630 )
    ( on b681 b406 )
    ( on b12 b681 )
    ( on b487 b12 )
    ( on b501 b487 )
    ( on b977 b501 )
    ( on b845 b977 )
    ( on b847 b845 )
    ( on b365 b847 )
    ( clear b365 )
  )
  ( :goal
    ( and
      ( clear b431 )
    )
  )
)
