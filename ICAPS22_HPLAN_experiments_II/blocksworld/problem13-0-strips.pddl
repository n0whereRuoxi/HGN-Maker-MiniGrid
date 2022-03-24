( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b445 - block
    b538 - block
    b110 - block
    b30 - block
    b984 - block
    b382 - block
    b899 - block
    b556 - block
    b501 - block
    b688 - block
    b762 - block
    b782 - block
    b902 - block
    b402 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b445 )
    ( on b538 b445 )
    ( on b110 b538 )
    ( on b30 b110 )
    ( on b984 b30 )
    ( on b382 b984 )
    ( on b899 b382 )
    ( on b556 b899 )
    ( on b501 b556 )
    ( on b688 b501 )
    ( on b762 b688 )
    ( on b782 b762 )
    ( on b902 b782 )
    ( on b402 b902 )
    ( clear b402 )
  )
  ( :goal
    ( and
      ( clear b445 )
    )
  )
)
